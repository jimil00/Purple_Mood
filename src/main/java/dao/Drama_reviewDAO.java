package dao;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Drama_reviewDAO {
	
	private static Drama_reviewDAO instance;

	public synchronized  static Drama_reviewDAO getInstance() throws Exception {
		if(instance==null) {
			instance=new Drama_reviewDAO();
		}return instance;
	}

	private Connection getConnection() throws Exception{
		Context ctx= new InitialContext();
		DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();

	}

}
