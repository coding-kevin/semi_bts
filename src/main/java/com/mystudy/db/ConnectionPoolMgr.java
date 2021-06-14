package com.mystudy.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ConnectionPoolMgr {
	public ConnectionPoolMgr(){
	//1. 드라이버 로딩
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버로딩성공");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버로딩실패");
			e.printStackTrace();
		}
	}
	
	public Connection getConnection(String url, String uid, String upwd) throws SQLException {
			
		Connection conn = DriverManager.getConnection(url, uid, upwd);
		System.out.println("db연결 conn="+conn);
		
		return conn;
	}
	public Connection getConnection(String uid, String upwd) throws SQLException {
		//String url = "jdbc:oracle:thin:@DESKTOP-K313T60:1521:xe"; //학원
		String url = "jdbc:oracle:thin:@DESKTOP-OM5V34J:1521:xe"; //집
		Connection conn = DriverManager.getConnection(url, uid, upwd);
		
		return conn;
	}
	
	public Connection getConnection() throws SQLException {
		//String url = "jdbc:oracle:thin:@DESKTOP-K313T60:1521:xe"; //학원
		String url = "jdbc:oracle:thin:@DESKTOP-OM5V34J:1521:xe"; // 집
		String uid = "herb", upwd="herb123";
		Connection conn = DriverManager.getConnection(url, uid, upwd);
		
		return conn;
	}
	
	public void dbClose(PreparedStatement ps, Connection conn) throws SQLException {
		if(ps!=null) ps.close();
		if(conn!=null) conn.close();
	}
	public void dbClose(ResultSet rs, PreparedStatement ps, Connection conn) throws SQLException {
		if(rs!=null) rs.close();
		if(ps!=null) ps.close();
		if(conn!=null) conn.close();
	}
	
}
