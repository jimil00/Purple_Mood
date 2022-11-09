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

		String sql="select dr_seq, dr_title, dr_img from drama where rownum <= 6 order by dr_like";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			try(ResultSet rs = pstat.executeQuery();){
				List <DramaDTO> list = new ArrayList<>();

				while(rs.next()) {

					DramaDTO dto = new DramaDTO();
					dto.setDr_seq(rs.getInt("dr_seq"));
					dto.setDr_title(rs.getString("dr_title"));
					dto.setDr_img(rs.getString("dr_img"));

					list.add(dto);
				}
				return list;
			}	
		}

	}
	

	public List <DramaDTO> searchBytitle(String dr_title) throws Exception {

		String sql="select dr_seq, dr_title, dr_img from drama where dr_title like ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);)
		{pstat.setString(1, "%"+dr_title+"%"); //여기서 한 글자만 쳐도 나오게 하는 기능 구현해야 함.

		try(ResultSet rs = pstat.executeQuery();){
			List <DramaDTO> list = new ArrayList<>();

			while(rs.next()) {

				DramaDTO dto = new DramaDTO();
				dto.setDr_seq(rs.getInt("dr_seq"));
				dto.setDr_title(rs.getString("dr_title"));
				dto.setDr_img(rs.getString("dr_img"));

				list.add(dto);
			}
			return list;
		}

		}

	}
	
	
	//상세 페이지 출력
	public  DramaDTO selectByseq(int dr_seq) throws Exception { 

		String sql="select * from drama where dr_seq=?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);)
		{pstat.setInt(1, dr_seq); 

		try(ResultSet rs = pstat.executeQuery();){

			DramaDTO dto = new DramaDTO();

			while(rs.next()) {
				dto.setDr_seq(rs.getInt("dr_seq"));
				dto.setDr_title(rs.getString("dr_title"));
				dto.setDr_genre(rs.getString("dr_genre"));	
				dto.setDr_summary(rs.getString("dr_summary"));
				dto.setDr_img(rs.getString("dr_img"));
				dto.setDr_like(rs.getInt("dr_like"));
				dto.setDr_ottNF((rs.getString("dr_ottNF").charAt(0))); 
				dto.setDr_ottWV((rs.getString("dr_ottWV").charAt(0)));
				dto.setDr_ottDZ((rs.getString("dr_ottDZ").charAt(0)));
				dto.setDr_ottWC((rs.getString("dr_ottWC").charAt(0)));
				dto.setDr_ottCP((rs.getString("dr_ottAT").charAt(0)));
				dto.setDr_ottTV((rs.getString("dr_ottAT").charAt(0)));
				
				System.out.println(rs.getString("dr_ottNF").charAt(0));

			}
			return dto;
		}

		}

	}
}
