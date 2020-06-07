package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplate {

	public static Connection getConnection() {
		
		Connection con = null;
		// DB 서버 계정 정보 삭제...
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "SEMI";
			String pwd = "SEMI";
			
			con = DriverManager.getConnection(url, id, pwd);
			
			con.setAutoCommit(false);
			
		} catch (ClassNotFoundException e) {
			System.out.println("1. �������");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("2. �����������");
			e.printStackTrace();
		}
		
		
		return con;
		
	}
	
	public static void close(Connection con) {
		
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void close(Statement stmt) {
		
		try {
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void close(ResultSet res) {
		
		try {
			res.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void commit(Connection con) {
		
		try {
			con.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void rollback(Connection con) {
		
		try {
			con.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
