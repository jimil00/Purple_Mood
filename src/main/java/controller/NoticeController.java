package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.NoticeDAO;
import dto.NoticeDTO;


@WebServlet("*.notice")
public class NoticeController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		try {

			String uri = request.getRequestURI();
			System.out.println("요청 URI : " + uri);

			//공지사항 리스트 출력(R)
			if(uri.equals("/noticeList.notice")) {

				int cpage=Integer.parseInt(request.getParameter("cpage"));
				System.out.println(cpage);
				List<NoticeDTO> notice = NoticeDAO.getInstance().selectNoticeByRange(cpage*20-19, cpage*20);
				//List<BoardDTO> list = BoardDAO.getInstance().selectBoardByRange(cpage*20-19, cpage*20);
				//String navi = BoardDAO.getInstance().getBoardPageNavi(cpage);
				List<String>list=NoticeDAO.getInstance().getNoticePageNavi(cpage);
				int endNavi=Integer.parseInt(list.get(0));
				String navi=list.get(1);
				request.setAttribute("notice", notice);
				request.setAttribute("navi", navi);
				request.setAttribute("endNavi", endNavi);
				request.getRequestDispatcher("/notice/noticeList.jsp").forward(request, response);

				// 게시판 검색 리스트 출력 (R)
			}else if(uri.equals("/noticeListSearch.notice")) {
				String noticeSearchOption=request.getParameter("noticeSearchOption");
				String noticeSearchWord = request.getParameter("noticeSearchWord");
				System.out.println(noticeSearchOption + noticeSearchWord);
				List<NoticeDTO>list = NoticeDAO.getInstance().selectNoticeSearchList(noticeSearchOption,noticeSearchWord);
				request.setAttribute("list", list);
				System.out.println(list.size());

				request.getRequestDispatcher("/notice/noticeList.jsp").forward(request, response);

				// 게시글 입력 (C)
			}else if(uri.equals("/insertNoticeContents.notice")) {

				//				int maxSize = 1024*1024*10;
				//				String savePath = request.getServletContext().getRealPath("/files"); 
				//				File fileSavePath = new File(savePath);
				//				if(!fileSavePath.exists()) {
				//					fileSavePath.mkdir();
				//				}
				String n_writer = (String)request.getSession().getAttribute("loginNickname");

				//				MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF8", new DefaultFileRenamePolicy());
				// 실제 자바스크립트 프론트에서 파일 사이즈 체크하고 넘어와야 한다.? 어렵네 이거도 해야 해요?

				String n_category = request.getParameter("n_category");
				String n_title = request.getParameter("n_title");
				String n_content = request.getParameter("n_content");
				System.out.println("n_category : "+n_category);
				System.out.println("n_title : "+n_title);
				System.out.println("n_content : "+n_content);

				int nextVal = NoticeDAO.getInstance().getNoticeNextVal();

				NoticeDAO.getInstance().insertNoticeContents(new NoticeDTO(nextVal ,n_category, n_writer, null, n_title, n_content, 0));

				//				Enumeration<String> e = multi.getFileNames();
				//
				//				while (e.hasMoreElements()) {
				//
				//					String name = e.nextElement();
				//					// <- 가장 최신 글의 seq를 얻어오는 코드가 선행
				//					String bf_oriName = multi.getOriginalFileName(name);
				//
				//					if(bf_oriName == null) {continue;}
				//					//프론트에서 값이 없는 인풋타입은 없애는 게 좋겠다 일단 차선책을 비워있는 파일 넘어오면 서버에서 걸러내자
				//
				//					String bf_sysName = multi.getFilesystemName(name);
				//
				//					//					System.out.println(name);
				//					BoardFileDAO.getInstance().insertBoardFile(new BoardFileDTO(0,bf_oriName, bf_sysName, null, nextVal));
				//				}


				response.sendRedirect("/noticeList.board");


				// 게시글 출력 (R)
			}else if(uri.equals("/selectNoticeContents.notice")){
				String n_writer = (String)request.getSession().getAttribute("loginNickname");

				int n_seq = Integer.parseInt(request.getParameter("n_seq"));

				NoticeDAO.getInstance().addNoticeViewCount(n_seq); 
				NoticeDTO dto = NoticeDAO.getInstance().selectNoticeContents(n_seq);

				request.setAttribute("dto", dto);


				//				List<BoardFileDTO> filelist = BoardFileDAO.getInstance().selectBoardFile(b_seq);
				//				request.setAttribute("filelist", filelist); 
				//List<NoticeDTO> list =NoticeDAO.getInstance().selectBoardComment(n_seq);
				System.out.println();
				//request.setAttribute("list", list);

				request.getRequestDispatcher("/notice/noticeContents.jsp").forward(request, response);


				// 게시글 삭제 (D)
			}else if(uri.equals("/deleteNoticeContents.board")) {
				int n_seq = Integer.parseInt(request.getParameter("n_seq"));
				int result = NoticeDAO.getInstance().deleteNoticeContents(n_seq);
				//				String page = (String)request.getSession().getAttribute("boardPage");
				response.sendRedirect("/noticeList.notice");


				//				response.sendRedirect("/boardList.board?cpage="+page);
				// 그 페이지로

				// 게시글 수정 (U)
			}else if(uri.equals("/updateNoticeContents.notice")) {
				int n_seq = Integer.parseInt(request.getParameter("n_seq"));
				String n_title = request.getParameter("n_title");
				String n_content = request.getParameter("n_content");
				int result = NoticeDAO.getInstance().updateNoticeContents(n_title,n_content,n_seq);
				response.sendRedirect("/noticeContents.notice?seq="+n_seq);



				//마이페이지 작성 게시글 출력
			}else if(uri.equals("/selectMypageBoard.board")) {

				/*
				 * Map<String, List> listMap = new HashMap<>(); List list = new ArrayList<>();
				 */
				Gson gsonStr   = new Gson();
				/*
				 * List <DramaDTO> dr_list_d =DramaDAO.getInstance().searchByDate(); 
				 * String strJsonList = gsonStr.toJson(dr_list_d);
				 * System.out.println("************strJsonList******* \n"+strJsonList);
				 * response.getWriter().append(strJsonList);
				 */
				String nickname=(String)request.getSession().getAttribute("loginNickname"); 
				List <NoticeDTO> notice_list =NoticeDAO.getInstance().searchByNickname(nickname);
				String strJsonList = gsonStr.toJson(notice_list);
				System.out.println("************strJsonList******* \n"+strJsonList);
				response.getWriter().append(strJsonList);
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
