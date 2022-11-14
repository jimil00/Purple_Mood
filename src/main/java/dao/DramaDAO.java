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



public class DramaDAO {


	private static DramaDAO instance;

	public synchronized  static DramaDAO getInstance() throws Exception {
		if(instance==null) {
			instance=new DramaDAO();
		}return instance;
	}

	private Connection getConnection() throws Exception{
		Context ctx= new InitialContext();
		DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();

	}


	public List<DramaDTO> selectByLike() throws Exception{

		String sql="select dr_id, dr_title, dr_poster_path from drama_test where rownum <= 6 order by dr_like";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			try(ResultSet rs = pstat.executeQuery();){
				List <DramaDTO> list = new ArrayList<>();

				while(rs.next()) {

					DramaDTO dto = new DramaDTO();
					dto.setDr_id(rs.getInt("dr_id"));
					dto.setDr_title(rs.getString("dr_title"));
					dto.setDr_poster_path(rs.getString("dr_poster_path"));	

					list.add(dto);
				}
				return list;
			}	
		}

	}


	public List <DramaDTO> searchBytitle(String dr_title) throws Exception {

		String sql="select dr_id, dr_title, dr_poster_path from drama_test where dr_title like ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);)
		{pstat.setString(1, "%"+dr_title+"%"); //여기서 한 글자만 쳐도 나오게 하는 기능 구현해야 함.

		try(ResultSet rs = pstat.executeQuery();){
			List <DramaDTO> list = new ArrayList<>();

			while(rs.next()) {

				DramaDTO dto = new DramaDTO();
				dto.setDr_id(rs.getInt("dr_id"));
				dto.setDr_title(rs.getString("dr_title"));
				dto.setDr_poster_path(rs.getString("dr_poster_path"));	

				list.add(dto);
			}
			return list;
		}

		}

	}


	//상세 페이지 출력
	public  DramaDTO selectByDr_id(int dr_id) throws Exception { 

		String sql="select * from drama_test where dr_id=?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);)
		{pstat.setInt(1, dr_id); 

		try(ResultSet rs = pstat.executeQuery();){

			DramaDTO dto = new DramaDTO();

			while(rs.next()) {
				dto.setDr_id(rs.getInt("dr_id"));
				dto.setDr_title(rs.getString("dr_title"));
				dto.setDr_genre(rs.getString("dr_genre"));	
				dto.setDr_first_air_date(rs.getString("dr_first_air_date"));	
				dto.setDr_vote_average(rs.getString("dr_vote_average"));	
				dto.setDr_ottNF((rs.getString("dr_ottNF").charAt(0))); 
				dto.setDr_ottWV((rs.getString("dr_ottWV").charAt(0)));
				dto.setDr_ottDZ((rs.getString("dr_ottDZ").charAt(0)));
				dto.setDr_ottWC((rs.getString("dr_ottWC").charAt(0)));
				dto.setDr_like(rs.getInt("dr_like"));
				dto.setDr_poster_path(rs.getString("dr_poster_path"));	
				dto.setDr_overview(rs.getString("dr_overview"));	

				System.out.println(rs.getString("dr_ottNF").charAt(0));

			}
			return dto;
		}

		}

	}

	//아이콘 출력용 메서드( 수정 중)
	public DramaDTO selectOtt_icon(int dr_id) throws Exception{

		String sql="select dr_ottNF, dr_ottWV,dr_ottDZ,dr_ottWC from drama_test where dr_id = ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);)
		{pstat.setInt(1, dr_id); //여기서 한 글자만 쳐도 나오게 하는 기능 구현해야 함.

		try(ResultSet rs = pstat.executeQuery();){

			DramaDTO dto = new DramaDTO();
			while(rs.next()) {
				dto.setDr_ottNF((rs.getString("dr_ottNF").charAt(0))); 
				dto.setDr_ottWV((rs.getString("dr_ottWV").charAt(0)));
				dto.setDr_ottDZ((rs.getString("dr_ottDZ").charAt(0)));
				dto.setDr_ottWC((rs.getString("dr_ottWC").charAt(0)));

			}return dto;
		}


		}
	}

	//최신드라마 출력
	public List <DramaDTO> searchByDate() throws Exception {

		String sql="SELECT * from(select dr_id, dr_poster_path, rank() over(ORDER BY DR_FIRST_AIR_DATE  desc)\"개봉일자\" from drama_test) WHERE \"개봉일자\" BETWEEN 1 AND 18";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			List <DramaDTO> list = new ArrayList<>();
			while(rs.next()) {
				DramaDTO dto = new DramaDTO();
				dto.setDr_id(rs.getInt("dr_id"));
				dto.setDr_poster_path(rs.getString("dr_poster_path"));	
				list.add(dto);
			}
			return list;
		}
	}

	
	
	//평점드라마 출력
		public List <DramaDTO> searchByAvg() throws Exception {

			String sql="SELECT * from(select dr_id, dr_poster_path, rank() over(ORDER BY DR_vote_average   desc)\"평점\" from drama_test) WHERE \"평점\" BETWEEN 1 AND 18";

			try(Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);
					ResultSet rs = pstat.executeQuery();){
				List <DramaDTO> list = new ArrayList<>();
				while(rs.next()) {
					DramaDTO dto = new DramaDTO();
					dto.setDr_id(rs.getInt("dr_id"));
					dto.setDr_poster_path(rs.getString("dr_poster_path"));	
					list.add(dto);
				}
				return list;
			}
		}
}

