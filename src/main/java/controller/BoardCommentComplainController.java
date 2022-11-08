package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardComplainDAO;
import dto.BoardComplainDTO;

/**
 * Servlet implementation class BoardCommentComplainController
 */
@WebServlet("*.boardcommentcomplain")
public class BoardCommentComplainController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf8");
		String uri=request.getRequestURI();
		System.out.println("요청된 URI : "+ uri);

		try {
			if(uri.equals("/boardcommentcomplain")) {
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
