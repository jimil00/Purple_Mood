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

import dto.BoardDTO;

public class BoardDAO {
	private static BoardDAO instance;
	synchronized public static BoardDAO getInstance() {
		if(instance == null) {
			instance = new BoardDAO();
		}
		return instance;
	}

	private BoardDAO() {}
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	
	// 게시글 작성 (C)
	public int insert(BoardDTO dto) throws Exception{
		String sql = "insert into board values(?, ?, ?, sysdate, ?, ?, 0)";
		//							board_seq.nextval
		try(Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			
			pstat.setInt(1, dto.getB_seq());
			pstat.setString(2, dto.getB_category());
			pstat.setString(3, dto.getB_writer());
			pstat.setString(4, dto.getB_title());
			pstat.setString(5, dto.getB_content());

			int result = pstat.executeUpdate();

			con.commit();
			return result;
		}
	}
	
	
	// 게시글 작성 시 게시글 번호 미리 받아두기
	public int getNextVal() throws Exception{
		String sql = "select board_seq.nextval from dual";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			rs.next();
			return rs.getInt(1);
		}
	}

	
	// 게시글 출력 (R)
	public BoardDTO selectContents(int b_seq) throws Exception {

		String sql = "select * from board where b_seq = ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setInt(1, b_seq);
			try(ResultSet rs = pstat.executeQuery();){

				rs.next();
				BoardDTO dto = new BoardDTO();
				dto.setB_seq(rs.getInt("b_seq"));
				dto.setB_category(rs.getString("b_category"));
				dto.setB_writer(rs.getString("b_writer"));
				dto.setB_write_date(rs.getTimestamp("b_write_date"));
				dto.setB_title(rs.getString("b_title"));
				dto.setB_content(rs.getString("b_content"));
				dto.setB_view_count(rs.getInt("b_view_count"));
				return dto;
			}

		}
	}


	
	// 게시글 수정 (U)
	public int updateContents(String b_title, String b_content, int b_seq) throws Exception{
		String sql = "update board set b_write_date=sysdate, b_title=?, b_content=? where b_seq=?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, b_title);
			pstat.setString(2, b_content);
			pstat.setInt(3, b_seq);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}}

	
	
	// 게시글 삭제 (D)
	public int deleteContents(int b_seq) throws Exception{
		String sql = "delete from board where b_seq = ?";
		try(Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setInt(1, b_seq);
			int result = pstat.executeUpdate();

			con.commit();
			return result;
			}
	}
	
	
}


