package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.DramaDTO;
import dto.MovieDTO;


public class MovieDAO {

	private static MovieDAO instance;

	public synchronized  static MovieDAO getInstance() throws Exception {
		if(instance==null) {
			instance=new MovieDAO();
		}return instance;
	}

	private Connection getConnection() throws Exception{
		Context ctx= new InitialContext();
		DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();

	}

	//검색 전 좋아요 순으로 콘텐츠의 이미지와 타이틀을 6개 가져오는 메서드
	public List<MovieDTO> selectByLike() throws Exception{

		//테스트용
		String sql="select mv_id, mv_title, mv_poster_path from movie_test where rownum <=6 order by mv_like";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			try(ResultSet rs = pstat.executeQuery();){
				List <MovieDTO> list = new ArrayList<>();


				while(rs.next()) {

					MovieDTO dto = new MovieDTO();
					dto.setMv_id(rs.getInt("mv_id"));
					dto.setMv_title(rs.getString("mv_title"));
					dto.setMv_poster_path(rs.getString("mv_poster_path"));

					list.add(dto);
				}return list;

			}
		}


	}

	//타이틀로 검색하면 검색 결과를 알려주는 메서드
	public  List<MovieDTO> searchBytitle(String mv_title) throws Exception {

		//테스트용
		String sql="select mv_id, mv_title, mv_poster_path from movie_test where mv_title like ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);)
		{pstat.setString(1, "%"+mv_title+"%"); //여기서 한 글자만 쳐도 나오게 하는 기능 어캐하져

		try(ResultSet rs = pstat.executeQuery();){


			List <MovieDTO> list = new ArrayList<>();


			while(rs.next()) {

				MovieDTO dto = new MovieDTO();
				dto.setMv_id(rs.getInt("mv_id"));
				dto.setMv_title(rs.getString("mv_title"));
				dto.setMv_poster_path(rs.getString("mv_poster_path"));

				list.add(dto);
			}
			return list;
		}

		}

	}


	//상세 페이지 
	public  MovieDTO selectByMv_seq(int mv_id) throws Exception { 

		//테스트용
		String sql="select * from movie_test where mv_id=?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);)
		{pstat.setInt(1, mv_id); 

		try(ResultSet rs = pstat.executeQuery();){

			MovieDTO dto = new MovieDTO();

			while(rs.next()) {
				dto.setMv_id(rs.getInt("mv_id"));
				dto.setMv_title(rs.getString("mv_title"));
				dto.setMv_genre(rs.getString("mv_genre"));
				dto.setMv_release_date(rs.getString("mv_release_date"));	
				dto.setMv_vote_average(rs.getString("mv_vote_average"));
				dto.setMv_runtime(rs.getString("mv_runtime"));
				dto.setMv_ottNF((rs.getString("mv_ottNF").charAt(0))); 
				dto.setMv_ottWV((rs.getString("mv_ottWV").charAt(0)));
				dto.setMv_ottDZ((rs.getString("mv_ottDZ").charAt(0)));
				dto.setMv_ottWC((rs.getString("mv_ottWC").charAt(0)));
				dto.setMv_like(rs.getInt("mv_like"));
				dto.setMv_poster_path(rs.getString("mv_poster_path"));
				dto.setMv_overview(rs.getString("mv_overview"));

			}
			return dto;
		}

		}

	}


	//최신영화 출력
	public List <MovieDTO> searchByDate() throws Exception {

		String sql="SELECT * from(select mv_id, mv_poster_path, rank() over(ORDER BY mv_release_date  desc)\"개봉일자\" from MOVIE_TEST) WHERE \"개봉일자\" BETWEEN 1 AND 18";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			List <MovieDTO> list = new ArrayList<>();
			while(rs.next()) {
				MovieDTO dto = new MovieDTO();
				dto.setMv_id(rs.getInt("mv_id"));
				dto.setMv_poster_path(rs.getString("mv_poster_path"));
				list.add(dto);
			}
			return list;
		}
	}

	//평점영화 출력
	public List <MovieDTO> searchByAvg() throws Exception {

		String sql="SELECT * from(select mv_id, mv_poster_path, rank() over(ORDER BY mv_vote_average  desc)\"평점\" from MOVIE_TEST) WHERE \"평점\" BETWEEN 1 AND 18";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			List <MovieDTO> list = new ArrayList<>();
			while(rs.next()) {
				MovieDTO dto = new MovieDTO();
				dto.setMv_id(rs.getInt("mv_id"));
				dto.setMv_poster_path(rs.getString("mv_poster_path"));
				list.add(dto);
			}
			return list;
		}
	}

	// 관리자페이지_영화 전체 조회
	public List<MovieDTO> selectAllMovie() throws Exception{
		String sql = "select * from movie_test";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){

			List<MovieDTO> list = new ArrayList<>();
			while(rs.next()) {

				MovieDTO dto = new MovieDTO();
				dto.setMv_id(rs.getInt("mv_id"));
				dto.setMv_title(rs.getString("mv_title"));
				dto.setMv_genre(rs.getString("mv_genre"));
				dto.setMv_release_date(rs.getString("mv_release_date"));	
				dto.setMv_vote_average(rs.getString("mv_vote_average"));
				dto.setMv_runtime(rs.getString("mv_runtime"));
				dto.setMv_ottNF((rs.getString("mv_ottNF").charAt(0))); 
				dto.setMv_ottWV((rs.getString("mv_ottWV").charAt(0)));
				dto.setMv_ottDZ((rs.getString("mv_ottDZ").charAt(0)));
				dto.setMv_ottWC((rs.getString("mv_ottWC").charAt(0)));
				dto.setMv_like(rs.getInt("mv_like"));
				dto.setMv_poster_path(rs.getString("mv_poster_path"));
				dto.setMv_overview(rs.getString("mv_overview"));

				list.add(dto);
			}
			return list;
		}
	}

	// 관리자페이지_영화 삭제
	public int delete(int mv_id) throws Exception{
		String sql = "delete from movie_test where mv_id = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, mv_id);
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

}
