package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.NoticeCommentDTO;
import dao.NoticeCommentDAO;

@WebServlet("*.noticecomment")
public class NoticeCommentController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uri=request.getRequestURI();
		System.out.println("요청 URI : "+uri);

		
		try {
			if(uri.equals("/insertNoticeComment.noticecomment")) {

				String ncm_writer=request.getParameter("ncm_writer");
				String ncm_content=request.getParameter("ncm_content");
				int n_seq=Integer.parseInt(request.getParameter("n_seq"));
				NoticeCommentDAO dao = NoticeCommentDAO.getInstance();
				dao.insertNoticeComment(new NoticeCommentDTO(0,ncm_writer,null,ncm_content,n_seq));
				response.sendRedirect("/");

			}else if(uri.equals("/selectNoticeComment.noticecomment")) {

				int n_seq=Integer.parseInt(request.getParameter("n_seq"));
				NoticeCommentDAO dao = NoticeCommentDAO.getInstance();
				List<NoticeCommentDTO>list=dao.selectNoticeComment(n_seq);
				request.setAttribute("list", list);
//				request.getRequestDispatcher("/board/boardContents.jsp").forward(request, response);

			}else if(uri.equals("/updateNoticeComment.noticecomment")) {

				String ncm_content=request.getParameter("ncm_content");
				int ncm_seq=Integer.parseInt(request.getParameter("ncm_seq"));
				NoticeCommentDAO dao = NoticeCommentDAO.getInstance();
				dao.updateNoticeComment(ncm_content,ncm_seq);
				response.sendRedirect("/");

			}else if(uri.equals("/deleteNoticeComment.noticecomment")) {

				int ncm_seq=Integer.parseInt(request.getParameter("ncm_seq"));
				NoticeCommentDAO dao = NoticeCommentDAO.getInstance();
				dao.deleteNoticeComment(ncm_seq);
				response.sendRedirect("/");
			}
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
