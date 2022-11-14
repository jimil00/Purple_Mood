package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.OttDTO;

public class OttDAO {
	
	private static OttDAO instance;

	public synchronized  static OttDAO getInstance() throws Exception {
		if(instance==null) {
			instance=new OttDAO();
		}return instance;
	}

	private Connection getConnection() throws Exception{
		Context ctx= new InitialContext();
		DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();

	}

	//검색 전 좋아요 순으로 콘텐츠의 이미지와 타이틀을 6개 가져오는 메서드
	public List<OttDTO> selectByLike() throws Exception{

		//테스트용 수정해야 함
		String sql="select mv_id, mv_title, mv_poster_path from movie_test where rownum <=6 order by mv_like";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			try(ResultSet rs = pstat.executeQuery();){
				List <OttDTO> list = new ArrayList<>();


				while(rs.next()) {

					OttDTO dto = new OttDTO();
					dto.setMv_id(rs.getInt("mv_id"));
					dto.setDr_id(rs.getInt("dr_id"));
					dto.setMv_title(rs.getString("mv_title"));
					dto.setDr_title(rs.getString("dr_title"));
					dto.setMv_poster_path(rs.getString("mv_poster_path"));
					dto.setDr_poster_path(rs.getString("dr_poster_path"));

					list.add(dto);
				}return list;

			}
		}


	}
	
	
}
