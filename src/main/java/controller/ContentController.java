package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DramaDAO;
import dao.MovieDAO;
import dto.BoardDTO;
import dto.DramaDTO;
import dto.MovieDTO;

@WebServlet("*.content")
public class ContentController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		request.setCharacterEncoding("utf8");

		String uri = request.getRequestURI();


		if(uri.equals("/search.content")){
			
			System.out.println(uri);

			String searchtext=request.getParameter("searchtext");
		
			System.out.println(searchtext);
			

			try { 
				//드라마 출력
				List <DramaDTO> dr_list =DramaDAO.getInstance().searchBytitle(request.getParameter("searchtext"));
				request.setAttribute("dr_list", dr_list);
				
				System.out.println(dr_list);

				//영화 출력
				List <MovieDTO> mv_list = MovieDAO.getInstance().searchBytitle(request.getParameter("searchtext"));
				request.setAttribute("mv_list", mv_list);
				
				System.out.println(mv_list.get(0).getMv_img()+":"+mv_list.get(0).getMv_title());
				
//				//주소값이 왜 나옴
//					List<String> list= new ArrayList();
//				for(int i = 0; i< mv_list.size(); i++) { 
//					list.add(mv_list.get(i).getMv_img()); 
//					list.add(mv_list.get(i).getMv_title());}
//			
//					request.setAttribute("list", list);
//					
//					System.out.println(list);

				request.getRequestDispatcher("/content/SearchPage.jsp").forward(request, response); 
				

			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("Error.jsp");
			}

			if(uri.equals("/list.content")) {
				
				//검색 전 콘텐츠를 출력하기 위해 검색 페이지로 넘어올 때, 이 컨트롤러를 거쳐서 와야 함.
				try {
					List<DramaDTO> dr_like=DramaDAO.getInstance().selectByLike();
					List <MovieDTO> mv_like=MovieDAO.getInstance().selectByLike();
					
//					System.out.println(dr_like);
					

					request.setAttribute("dr_like", dr_like);
					request.setAttribute("mv_like", mv_like);

					request.getRequestDispatcher("/content/SearchPage.jsp").forward(request, response); 

				}catch(Exception e) {
					e.printStackTrace();
					response.sendRedirect("Error.jsp");
				}

			}

		}

		if(uri.equals("/detail.content")) {
			//영화 드라마 출력 페이지 로직
			int dr_seq= Integer.parseInt(request.getParameter("dr_seq"));
			int mv_seq= Integer.parseInt(request.getParameter("mv_seq"));

			try {
				DramaDTO dr_detail = DramaDAO.getInstance().selectByseq(dr_seq);
				MovieDTO mv_dateil = MovieDAO.getInstance().selectByseq(mv_seq);

				request.getRequestDispatcher("/content/ContentView.jsp").forward(request, response);

			}catch(Exception e)	{
				e.printStackTrace();
				response.sendRedirect("Error.jsp");
			}

		}
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
