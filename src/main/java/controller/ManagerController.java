package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardComplainDAO;
import dao.DramaDAO;
import dao.MemberDAO;
import dao.MovieDAO;
import dto.BoardComplainDTO;
import dto.DramaDTO;
import dto.MemberDTO;
import dto.MovieDTO;

@WebServlet("*.manager")
public class ManagerController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf8");
		response.setContentType("test/html; charset=UTF-8");

		String uri = request.getRequestURI();
		System.out.println(uri);
		String loginID = (String)request.getSession().getAttribute("loginID");
		System.out.println(loginID);
		if (loginID.equals("admin123")) {
			
			try {

				// 회원 전체 조회
				if(uri.equals("/memberOutput.manager")) {

					List<MemberDTO> list = MemberDAO.getInstance().selectAll();
					request.setAttribute("list", list);
					request.getRequestDispatcher("manager/memberOutput.jsp").forward(request, response);

					// 회원 삭제
				}else if(uri.equals("/memberDelete.manager")) {

					String id = request.getParameter("id");
					int result = MemberDAO.getInstance().delete(id);
					System.out.println(id);
					response.sendRedirect("/memberOutput.manager");

					// 영화 전체 조회
				}else if(uri.equals("/movieOutput.manager")) {

					List<MovieDTO> list = MovieDAO.getInstance().selectAllMovie();
					request.setAttribute("list", list);
					request.getRequestDispatcher("manager/movieOutput.jsp").forward(request, response);

					// 영화 삭제
				}else if(uri.equals("/movieDelete.manager")) {

					int mv_id = Integer.parseInt(request.getParameter("mv_id"));
					int result = MovieDAO.getInstance().delete(mv_id);
					response.sendRedirect("/movieOutput.manager");

					// 드라마 조회
				}else if(uri.equals("/dramaOutput.manager")) {

					List<DramaDTO> list = DramaDAO.getInstance().selectAllDrama();
					request.setAttribute("list", list);
					request.getRequestDispatcher("manager/dramaOutput.jsp").forward(request, response);

					// 드라마 삭제
				}else if(uri.equals("/dramaDelete.manager")) {

					int dr_id = Integer.parseInt(request.getParameter("dr_id"));
					int result = DramaDAO.getInstance().delete(dr_id);
					response.sendRedirect("/dramaOutput.manager");

					// 신고 게시글 조회
				}else if(uri.equals("/boardComplainOutput.manager")) {
					
					List<BoardComplainDTO> list = BoardComplainDAO.getInstance().selectBoardComplain();
					request.setAttribute("list", list);
					request.getRequestDispatcher("manager/boardComplainOutput.jsp").forward(request, response);
					
					
					// 실패함,,
//					// 게시글 신고 테이블 행 삭제, 동일 행 삭제, 게시글 삭제 
//				}else if(uri.equals("/boardComplainDelete.manager")) {
//					
//					// 게시글 삭제
//					int b_seq = Integer.parseInt(request.getParameter("b_seq"));
//					int result1 = BoardComplainDAO.getInstance().delete(b_seq);
//					
//					// 게시글 신고 테이블 행 삭제
//					int bcp_seq = Integer.parseInt(request.getParameter("bcp_seq"));
//					int result2 = BoardComplainDAO.getInstance().complainTableDelete(bcp_seq);
//					
//					response.sendRedirect("/boardComplainOutput.manager");
					
				}

			}catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect("/error.jsp");
			}
		}else {
			response.sendRedirect("/error.jsp");

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);


	}

}
