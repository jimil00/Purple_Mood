package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.BoardComplainDTO;

public class BoardComplainDAO {

	private static BoardComplainDAO instance;

	public synchronized static BoardComplainDAO getInstance() {
		if(instance == null) {
			instance = new BoardComplainDAO();
		}
		return instance;
	}

	private BoardComplainDAO() {}

	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public int insertComplain(BoardComplainDTO dto) throws Exception {
		String sql="insert into board_complain values(board_complain_seq.nextval,?,sysdate,?,?,?)";
		try(
				Connection con = getConnection();
				PreparedStatement pstat=con.prepareStatement(sql);)
		{
			pstat.setString(1, dto.getBcp_complainer());
			pstat.setInt(2, dto.getB_seq());
			pstat.setString(3, dto.getB_writer());
			pstat.setString(4, dto.getB_title());
			int result = pstat.executeUpdate();

			con.commit();
			return result;

		}
	}

}
