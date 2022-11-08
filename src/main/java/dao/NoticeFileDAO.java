package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.NoticeFileDTO;


public class NoticeFileDAO {

	private static NoticeFileDAO instance=null;
	synchronized public static NoticeFileDAO getInstance() {
		if(instance==null) {
			instance=new NoticeFileDAO();
		}
		return instance;
	} 
	private NoticeFileDAO() {}

	private Connection getConnection() throws Exception {
		Context cx = new InitialContext();
		DataSource ds = (DataSource) cx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}


	// 공지파일 저장 (C)
	public int insertNoticeFile(NoticeFileDTO dto) throws Exception {

		String sql="insert into notice_file values(notice_file_seq.nextval, ?, ?, sysdate, ?)";

		try(Connection con = getConnection();
				PreparedStatement pstat= con.prepareStatement(sql);){

			pstat.setString(1, dto.getNf_oriName());
			pstat.setString(2, dto.getNf_sysName());
			pstat.setInt(3,dto.getN_seq());
			int result=pstat.executeUpdate();

			con.commit();
			return result;
		}
	}


	// 공지파일 출력 (R)
	public List<NoticeFileDTO> selectNoticeFile(int n_seq) throws Exception{

		String sql="select * from notice_file where n_seq=?";

		try(Connection con = getConnection();
				PreparedStatement pstat= con.prepareStatement(sql);){
			
			pstat.setInt(1, n_seq);

			try(ResultSet rs = pstat.executeQuery();){

				List<NoticeFileDTO>list=new ArrayList<>();

				while(rs.next()) {
					NoticeFileDTO dto = new NoticeFileDTO();
					dto.setNf_seq(rs.getInt("nf_seq"));
					dto.setNf_oriName(rs.getString("nf_oriName"));
					dto.setNf_sysName(rs.getString("nf_sysName"));
					dto.setNf_upload_date(rs.getTimestamp("nf_upload_date"));
					dto.setN_seq(rs.getInt("n_seq"));

					list.add(dto);
				}
				return list;
			}
		}
	}
}