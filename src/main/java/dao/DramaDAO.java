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
	
	
	public List<DramaDTO> selectByLike_count() throws Exception{
		
		String sql="select dr_title, dr_img from drama where rownum <= 6 order by like_count";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			
			try(ResultSet rs = pstat.executeQuery();){
				List <DramaDTO> list = new ArrayList<>();
				
				while(rs.next()) {
					
					DramaDTO dto = new DramaDTO();
					dto.setDr_title(rs.getString("dr_title"));
					dto.setDr_img(rs.getString("dr_img"));
					
					list.add(dto);
				}
				return list;
			}	
		}
		
	}
	

	public  List<DramaDTO> searchBytitle(String dr_title) throws Exception {
		
		String sql="select dr_title, dr_img from drama where dr_title like ?";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);)
		{pstat.setString(1, "%"+dr_title+"%"); //여기서 한 글자만 쳐도 나오게 하는 기능 구현해야 함.
			
			try(ResultSet rs = pstat.executeQuery();){
				List <DramaDTO> list = new ArrayList<>();
				
				while(rs.next()) {
					
					DramaDTO dto = new DramaDTO();
					dto.setDr_title(rs.getString("dr_title"));
					dto.setDr_img(rs.getString("dr_img"));
					
					list.add(dto);
				}
				return list;
			}
				
				
			}
				

		
		
	}

}
