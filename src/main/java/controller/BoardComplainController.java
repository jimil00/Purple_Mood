package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardComplainDAO;
import dto.BoardComplainDTO;

@WebServlet("*.boardcomplain")
public class BoardComplainController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf8");
		String uri=request.getRequestURI();
		System.out.println("요청된 URI : "+ uri);

		try {
			if(uri.equals("/boardComplain.boardcomplain")) {
				String bcp_complainer=String.valueOf(request.getSession().getAttribute("loginID"));
				int b_seq=Integer.parseInt(request.getParameter("b_seq"));
				String b_writer=request.getParameter("b_writer");
				String b_title=request.getParameter("b_title");
				System.out.println(bcp_complainer+":"+b_seq+":"+b_writer+":"+b_title);
				BoardComplainDAO dao = BoardComplainDAO.getInstance();
				dao.insertComplain(new BoardComplainDTO(0,bcp_complainer,null,b_seq,b_writer, b_title));
				System.out.println("신고 table insert완");
				response.sendRedirect("/board/boardContents.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
