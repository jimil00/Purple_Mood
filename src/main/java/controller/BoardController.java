package controllers;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardDAO;
import dto.BoardDTO;


@WebServlet("*.board")
public class BoardController extends HttpServlet {
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      request.setCharacterEncoding("utf8");
		try {
			String uri = request.getRequestURI();
			System.out.println("요청 URI : " + uri);
			BoardDAO dao = BoardDAO.getInstance();

			if(uri.equals("/boardwrite.board")) {
				
				int maxSize = 1024*1024*10;
				String savePath = request.getServletContext().getRealPath("/files"); 
				File fileSavePath = new File(savePath);
				if(!fileSavePath.exists()) {
					fileSavePath.mkdir();
				}
				String writer = (String)request.getSession().getAttribute("loginID");

				MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF8", new DefaultFileRenamePolicy());
				// 실제 자바스크립트 프론트에서 파일 사이즈 체크하고 넘어와야 한다.? 어렵네 이거도 해야 해요?
				
				String category = multi.getParameter("catagory");
				String title = multi.getParameter("title");
				String content = multi.getParameter("content");
				// seq, writer, title, content, write_date, view_count
			
				int nextVal = BoardDAO.getInstance().getNextVal();

				BoardDAO.getInstance().writeContent(new BoardDTO(nextVal ,writer, title, content, null, 0));
				
				Enumeration<String> e = multi.getFileNames();
				// 엑스 눌렀다가 다시 업로드하고 그러면 파일 이름을 예상할 수 없다.
				// Enumertaion 일종의 collection 잘 모르겠으면 그냥 arraylist에 저장했다 생각해라 근데 사용방법은 좀 더 불편
				while (e.hasMoreElements()) {
					//rs.next()랑 비슷한 것 이너머레이션 안에 다음 데이터가 있다면 true 없다면 false되면서 while문 끝
					String name = e.nextElement();
					// <- 가장 최신 글의 seq를 얻어오는 코드가 선행
					String oriName = multi.getOriginalFileName(name);

					if(oriName == null) {continue;}
					//프론트에서 값이 없는 인풋타입은 없애는 게 좋겠다 일단 차선책을 비워있는 파일 넘어오면 서버에서 걸러내자

					String sysName = multi.getFilesystemName(name);
					// seq, oriName, sysName, parent_seq
					System.out.println(name);
					FilesDAO.getInstance().insert(new FilesDTO(0,oriName, sysName, nextVal));
					// 최신 글의 seq를 얻어오는 것으로는 내가 올리지 않은 글에 파일이 첨부되는 일이 생길 수 있다.
				}
				
				
				response.sendRedirect("/list.board?cpage=1");
				
				
			}else if(uri.equals("/list.board")) {

				String page = request.getParameter("cpage");
				int cpage = Integer.parseInt(page);
				request.getSession().setAttribute("boardPage", page);

				
//				List<BoardDTO> list = dao.selectAllBoardContents();
				
				List<BoardDTO> list = BoardDAO.getInstance().selectByRange(cpage*10-9, cpage*10);
//				상수들 조만간 바꾼다
				
//				cpage 1
//				seq 1~10
//				cpage 2
//				seq 11~20
				
				String navi = BoardDAO.getInstance().getPageNavi(cpage);
				
				request.setAttribute("list", list);
				request.setAttribute("navi", navi);
				
				request.getRequestDispatcher("/board/listView.jsp").forward(request, response);
			
			}else if(uri.equals("/detail.board")){
								//절대경로로 꼭대기에 위치
				int seq = Integer.parseInt(request.getParameter("seq"));
				BoardDAO.getInstance().addViewCount(seq);
				BoardDTO dto = BoardDAO.getInstance().selectContentDetail(seq);
//				BoardDTO dto = dao.selectContentDetail(seq);
				
				request.setAttribute("dto", dto);
				
				
				List<FilesDTO> filelist = FilesDAO.getInstance().selectAllByPseq(seq);
				request.setAttribute("filelist", filelist); 
				
				
				List<CommentsDTO> list =CommentsDAO.getInstance().selectAllComments(seq);
				request.setAttribute("list", list);
				request.getRequestDispatcher("/board/contentDetailView.jsp").forward(request, response);
//				DTO 한 줄 여기 writer랑 dao의 writer랑 일치하면 삭제 수정버튼도 보이게
			
			}else if(uri.equals("/delete.board")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				int result = dao.deleteContent(seq);
				
				String page = (String)request.getSession().getAttribute("boardPage");

				response.sendRedirect("/list.board?cpage="+page);
			
			}else if(uri.equals("/modify.board")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				String title = request.getParameter("title");
				String content = request.getParameter("content");
				
				int result = dao.updateContent(title,content,seq);
				response.sendRedirect("/detail.board?seq="+seq);
			}

			

		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("/error.jsp");

		}
	}
		


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
