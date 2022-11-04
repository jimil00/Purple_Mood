package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DramaDAO;
import dto.DramaDTO;

@WebServlet("*.content")
public class ContentController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		request.setCharacterEncoding("utf8");
		
		String uri = request.getRequestURI();
		
		if(uri.equals("/search.content")){
			
			try {
				//드라마
			List <DramaDTO> list =DramaDAO.getInstance().searchBytitle(request.getParameter(""));
			request.setAttribute("list", list);
			
				//영화
			
			
			
			request.getRequestDispatcher("resarchpage.jsp").forward(request, response); 
		}catch(Exception e) {
			e.printStackTrace();
		}
			
		if(uri.equals("/.content")) {
			
		}
			
			
					
			
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
