package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.NoticeCommentDTO;


public class NoticeCommentDAO {

	private static NoticeCommentDAO instance;
	synchronized public static NoticeCommentDAO getInstance() {
		if(instance == null) {
			instance = new NoticeCommentDAO();
		}
		return instance;
	}

	private NoticeCommentDAO() {}

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}


	// 공지사항 댓글 입력 (C)
	public int insertNoticeComment(NoticeCommentDTO dto) throws Exception {
		String sql = "insert into notice_comment values(notice_comment_seq.nextval, ?, sysdate, ?, ?)";
		try(Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setString(1, dto.getNcm_writer());
			pstat.setString(2, dto.getNcm_content());
			pstat.setInt(3, dto.getN_seq());

			int result = pstat.executeUpdate();

			con.commit();
			return result;
		}
	}


	// 공지사항 댓글 출력 (R)
	public List<NoticeCommentDTO> selectNoticeComment(int n_seq) throws Exception{
		String sql = "select * from notice_comment where n_seq=? order by ncm_seq";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, n_seq);

			try(ResultSet rs = pstat.executeQuery();){
				NoticeCommentDTO dto = new NoticeCommentDTO();
				List<NoticeCommentDTO> list= new ArrayList<>();
				while(rs.next()) {
					dto.setNcm_seq(rs.getInt("ncm_seq"));
					dto.setNcm_writer(rs.getString("ncm_writer"));
					dto.setNcm_write_date(rs.getTimestamp("ncm_write_date"));
					dto.setNcm_content(rs.getString("ncm_content"));
					dto.setN_seq(rs.getInt("n_seq"));

					list.add(dto);
				}
				return list;
			}
		}

	}


	// 공지사항 댓글 수정 (U)
	public int updateNoticeComment(String ncm_content, int ncm_seq) throws Exception{
		String sql = "update notice_comment set ncm_write_date=sysdate, ncm_content=? where ncm_seq=?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, ncm_content);
			pstat.setInt(2, ncm_seq);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}


	// 공지사항 댓글 삭제 (D)
	public int deleteNoticeComment(int ncm_seq) throws Exception{
		String sql = "delete from notice_comment where ncm_seq = ?";
		try(Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setInt(1, ncm_seq);
			int result = pstat.executeUpdate();

			con.commit();
			return result;
		}
	}

}
