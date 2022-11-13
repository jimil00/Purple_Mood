package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DramaDAO;
import dao.Drama_reviewDAO;
import dao.MovieDAO;
import dao.Movie_reviewDAO;
import dto.DramaDTO;
import dto.Drama_reviewDTO;
import dto.MovieDTO;
import dto.Movie_reviewDTO;

@WebServlet("*.content")
public class ContentController extends HttpServlet {


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		request.setCharacterEncoding("utf8");
		
	    response.setContentType("test/html; charset=UTF-8");

		String uri = request.getRequestURI();


		if(uri.equals("/search.content")){

			System.out.println(uri);

			String searchtext=request.getParameter("searchtext");

			System.out.println(searchtext);


			try { 
				//드라마 출력
				List <DramaDTO> dr_list =DramaDAO.getInstance().searchBytitle(request.getParameter("searchtext"));
				request.setAttribute("dr_list", dr_list);
				
				//System.out.println(dr_list);



				//영화 출력
				List <MovieDTO> mv_list = MovieDAO.getInstance().searchBytitle(request.getParameter("searchtext"));
				request.setAttribute("mv_list", mv_list);
				
				
								System.out.println(mv_list.size());
			

				request.getRequestDispatcher("/content/SearchPage.jsp").forward(request, response); 


			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("Error.jsp");
			}

		}
		
	
		
		else if(uri.equals("/detailMv.content")) {
			//영화 출력 페이지 로직

			System.out.println(uri);

		
			int mv_id= Integer.parseInt(request.getParameter("mv_id"));


			try {
			
				MovieDTO mv_detail = MovieDAO.getInstance().selectByMv_seq(mv_id);
				List<Movie_reviewDTO> mvr_list =Movie_reviewDAO.getInstance().selectMv_ReviewByMvSeq(mv_id);
				
				request.setAttribute("mv_detail", mv_detail);
				
//				System.out.println(mv_detail.getMv_ottNF());
//				System.out.println(mv_detail.getMv_ottWV());
//				System.out.println(mv_detail.getMv_ottDZ());
//				System.out.println(mv_detail.getMv_ottWC());
			

				request.getRequestDispatcher("/content/ContentView.jsp").forward(request, response);

			}catch(Exception e)	{
				e.printStackTrace();
				response.sendRedirect("Error.jsp");
			}
		}
		
		else if(uri.equals("/detailDr.content")) {
			//드라마 출력 페이지 로직

			System.out.println(uri);

			int dr_id= Integer.parseInt(request.getParameter("dr_id"));
			
			try {
				DramaDTO dr_detail = DramaDAO.getInstance().selectByDr_id(dr_id);
				List<Drama_reviewDTO> drr_list =Drama_reviewDAO.getInstance().selectDr_ReviewByDrSeq(dr_id);

				request.setAttribute("dr_detail", dr_detail);
				request.setAttribute("drr_list", drr_list);
				
				// ott 아이콘 출력을 위한 구문(일단 스킵)-> 일단 dao에 기능 만들어서 콜하는게 깔끔할 듯
//				DramaDTO dr_fromOtt=DramaDAO.getInstance().selectOtt_icon(dr_id);

//				if(dr_fromOtt.getDr_ottDZ()==('Y')) {
//					System.out.println("a"); 
//					
//				}else if() {
//					
//				}else if() {
//					
//				}else {
//					
//				}
				

				request.getRequestDispatcher("/content/ContentView.jsp").forward(request, response);

			}catch(Exception e)	{
				e.printStackTrace();
				response.sendRedirect("Error.jsp");
			}
		}
			
		//ott별 버튼을 눌러서 ott별 출력 페이지로 넘어올 때, 이 컨트롤러를 거쳐서 와야 함.
		if(uri.equals("/netflix.content")) {
			
			
			try {
				List<DramaDTO> dr_like=DramaDAO.getInstance().selectByLike();
				List <MovieDTO> mv_like=MovieDAO.getInstance().selectByLike();
				
				System.out.println(dr_like);
				

				request.setAttribute("dr_like", dr_like);
				request.setAttribute("mv_like", mv_like);

				request.getRequestDispatcher("/content/SearchPage.jsp").forward(request, response); 

			}catch(Exception e) {
				e.printStackTrace();
				response.sendRedirect("Error.jsp");
			}

		}else if(uri.equals("/wavve.content")) {
			
		}


		else if(uri.equals("/like.content")) {
			
			String nickname = (String)request.getSession().getAttribute("loginNickname");
			
//			if(좋아요 누른게==0) {
//				DramaDAO.getInstance().insertLike();
//				MovieDAO.getInstance().insertLike();
				
//			}else{DramaDAO.getInstance().deleteLike();}
			
		}
		
		
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
