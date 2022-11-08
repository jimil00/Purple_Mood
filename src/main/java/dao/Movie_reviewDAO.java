package dao;

import java.sql.Connection;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Movie_reviewDAO {
	
	private static Movie_reviewDAO instance;

	public synchronized  static Movie_reviewDAO getInstance() throws Exception {
		if(instance==null) {
			instance=new Movie_reviewDAO();
		}return instance;
	}

	private Connection getConnection() throws Exception{
		Context ctx= new InitialContext();
		DataSource ds=(DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();

	}

	


}
