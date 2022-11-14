package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.MovieDAO;
import dto.MovieDTO;

@WebServlet("*.ajax")
public class ManagerController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf8");
		response.setContentType("test/html; charset=UTF-8");

		String uri = request.getRequestURI();
		System.out.println(uri);

		try {

			// 영화 전체 조회
			if(uri.equals("/MovieAllOutput.ajax")) {

				System.out.println("MovieAllOutput : 비동기 통신 도착");

				MovieDAO dao = MovieDAO.getInstance();
				List<MovieDTO> list = dao.selectAllMovie();
				System.out.println(list.size());

				Gson g = new Gson();
				String jsonString = g.toJson(list);
				response.getWriter().append(jsonString);

				// 영화 삭제
			}else if(uri.equals("/MovieDelete.ajax")) {
				
				System.out.println("MovieDelete : 비동기 통신 도착");
//				String mv_id = request.getParameter("mv_id");
				int mv_id = Integer.parseInt(request.getParameter("mv_id"));
				int result = MovieDAO.getInstance().delete(mv_id);
				System.out.println(mv_id);
//				response.getWriter().append(mv_id+"번의 콘텐츠가 삭제되었습니다.");	
			}

		}catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
