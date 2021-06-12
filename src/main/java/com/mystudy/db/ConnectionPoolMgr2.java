package com.mystudy.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionPoolMgr2 {
	DataSource ds;

	public ConnectionPoolMgr2() {
		Context ctx;
		
		try {
			ctx = new InitialContext();
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracledb");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	//Connection객체 대여
	public Connection getConnection() throws SQLException {
		Connection conn = ds.getConnection();
		//=> Connection Pool에서 Connection을 빌려온다
		System.out.println("db연결 여부, conn = " + conn);
		
		return conn;
	}
	
	//Connection개체 반납
	public void dbClose(PreparedStatement ps,  Connection conn) throws SQLException{
		if(ps!=null) ps.close();
		if(conn!=null) conn.close();
	}
	
	public void dbClose(PreparedStatement ps, ResultSet rs,
			Connection conn) throws SQLException{
		if(ps!=null) ps.close();
		if(rs!=null)rs.close();
		if(conn!=null) conn.close();				
	}
}
