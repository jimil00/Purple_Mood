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

import dto.BoardCommentDTO;

public class BoardCommentDAO {
	private static BoardCommentDAO instance;
	synchronized public static BoardCommentDAO getInstance() {
		if(instance == null) {
			instance = new BoardCommentDAO();
		}
		return instance;
	}

	private BoardCommentDAO() {}
	
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	
	// 게시글 댓글 입력 (C)
	public int insertBoardComment(BoardCommentDTO dto) throws Exception {
		String sql = "insert into board_comment values(board_comment_seq.nextval, ?, sysdate, ?, ?)";
		try(Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setString(1, dto.getBcm_writer());
			pstat.setString(2, dto.getBcm_content());
			pstat.setInt(3, dto.getB_seq());

			int result = pstat.executeUpdate();

			con.commit();
			return result;
		}
	}

	
	// 게시글 댓글 출력 (R)
	public List<BoardCommentDTO> selectBoardComment(int b_seq) throws Exception{
		List<BoardCommentDTO> list= new ArrayList<>();
		String sql = "select * from board_comment where b_seq=? order by bcm_seq";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, b_seq);

			try(ResultSet rs = pstat.executeQuery();){
				BoardCommentDTO dto = new BoardCommentDTO();
				while(rs.next()) {
					dto.setBcm_seq(rs.getInt("bcm_seq"));
					dto.setBcm_writer(rs.getString("bcm_writer"));
					dto.setBcm_write_date(rs.getTimestamp("bcm_write_date"));
					dto.setBcm_content(rs.getString("bcm_content"));
					dto.setB_seq(rs.getInt("b_seq"));

					list.add(dto);
				}
				return list;
			}
		}

	}
	
	
	// 게시글 댓글 수정 (U)
	public int updateBoardComment(String bcm_content, int bcm_seq) throws Exception{
		String sql = "update board_comment set bcm_write_date=sysdate, bcm_content=? where bcm_seq=?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, bcm_content);
			pstat.setInt(2, bcm_seq);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	
	// 게시글 댓글 삭제 (D)
	public int deleteBoardComment(int bcm_seq) throws Exception{
		String sql = "delete from board_comment where bcm_seq = ?";
		try(Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setInt(1, bcm_seq);
			int result = pstat.executeUpdate();

			con.commit();
			return result;
			}
	}
	
}
