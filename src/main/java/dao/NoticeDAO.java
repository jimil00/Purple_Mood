package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.NoticeDTO;

public class NoticeDAO {
	private static NoticeDAO instance;
	synchronized public static NoticeDAO getInstance() {
		if(instance == null) {
			instance = new NoticeDAO();
		}
		return instance;
	}

	private NoticeDAO() {}
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}


	// 공지사항 작성 (C)
	public int insert(NoticeDTO dto) throws Exception{
		String sql = "insert into notice values(?, ?, ?, sysdate, ?, ?, 0)";
		try(Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setInt(1, dto.getN_seq());
			pstat.setString(2, dto.getN_category());
			pstat.setString(3, dto.getN_writer());
			pstat.setString(4, dto.getN_title());
			pstat.setString(5, dto.getN_content());

			int result = pstat.executeUpdate();

			con.commit();
			return result;
		}
	}



	// 공지사항 출력 (R)
	public NoticeDTO selectContents(int n_seq) throws Exception {

		String sql = "select * from notice where n_seq = ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setInt(1, n_seq);
			try(ResultSet rs = pstat.executeQuery();){

				rs.next();
				NoticeDTO dto = new NoticeDTO();
				dto.setN_seq(rs.getInt("n_seq"));
				dto.setN_category(rs.getString("n_category"));
				dto.setN_writer(rs.getString("n_writer"));
				dto.setN_write_date(rs.getTimestamp("n_write_date"));
				dto.setN_title(rs.getString("n_title"));
				dto.setN_content(rs.getString("n_content"));
				dto.setN_view_count(rs.getInt("n_view_count"));
				return dto;
			}

		}
	}



	// 공지사항 수정 (U)
	public int updateContents(String n_title, String n_content, int n_seq) throws Exception{
		String sql = "update notice set n_write_date=sysdate, n_title=?, n_content=? where n_seq=?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, n_title);
			pstat.setString(2, n_content);
			pstat.setInt(3, n_seq);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}}



	// 공지사항 삭제 (D)
	public int deleteContents(int n_seq) throws Exception{
		String sql = "delete from notice where n_seq = ?";
		try(Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setInt(1, n_seq);
			int result = pstat.executeUpdate();

			con.commit();
			return result;
		}
	}


}




