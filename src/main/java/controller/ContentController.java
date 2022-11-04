package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DramaDAO;
import dao.MovieDAO;
import dto.DramaDTO;
import dto.MovieDTO;

@WebServlet("*.content")
public class ContentController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		request.setCharacterEncoding("utf8");

		String uri = request.getRequestURI();







		if(uri.equals("/search.content")){
			
			//계속 추가 중
			
			try { 
				//드라마 출력
				List <DramaDTO> dr_list =DramaDAO.getInstance().searchBytitle(request.getParameter(""));
				request.setAttribute("dr_list", dr_list);

				//영화 출력
				List <MovieDTO> mv_list =MovieDAO.getInstance().searchBytitle(request.getParameter(""));
				request.setAttribute("mv_list", mv_list);
				
				request.getRequestDispatcher("resarchpage.jsp").forward(request, response); 

			}catch(Exception e) {
				e.printStackTrace();
			}

			if(uri.equals("/list.content")) {
				//검색 전 콘텐츠를 출력하기 위해 검색 페이지로 넘어올 때, 이 컨트롤러를 거쳐서 와야 함.
			

			}
			
			if(uri.equals("/detail.content")) {
				//영화 드라마 출력 페이지 로직
				
				
			}

		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
