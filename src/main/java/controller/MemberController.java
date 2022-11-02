package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.MemberDTO;


@WebServlet("*.member")
public class MemberController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");

		String uri = request.getRequestURI();
		//      System.out.println("요청 URI : " + uri);

		try {
			// ID 중복체크
			if(uri.equals("/idDuplCheck.member")) {
				String id = request.getParameter("id");
				boolean result = MemberDAO.getInstance().isIdExist(id);
				request.setAttribute("result", result);
				request.setAttribute("id", id);
				request.getRequestDispatcher("/member/idDuplCheck.jsp").forward(request, response);


				// NICKNAME 중복체크
			}else if(uri.equals("/nicknameDuplCheck.member")) {
				String nickname = request.getParameter("nickname");
				boolean result = MemberDAO.getInstance().isNicknameExist(nickname);
				response.getWriter().append(String.valueOf(result));

				// 마이페이지 회원정보 출력
			}else if(uri.equals("/mypageMemInfo.member")) {

				MemberDAO dao = MemberDAO.getInstance();
				String id = (String)request.getSession().getAttribute("loginID");
				MemberDTO dto = dao.selectById(id);
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("/member/mypageMemInfo.jsp").forward(request, response);

			}else if(uri.equals("/updateMemInfo.member")) {
				String nickname = request.getParameter("nickname");
				String pw = request.getParameter("pw");
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				String postcode = request.getParameter("postcode");
				String address1 = request.getParameter("address1");
				String address2 = request.getParameter("address2");

				int result = MemberDAO.getInstance().update(new MemberDTO(null, nickname, pw, name, phone, email, postcode, address1, address2, null));
				response.sendRedirect("/mypageMemInfo.member");

			}


		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.html");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}