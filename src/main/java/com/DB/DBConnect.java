package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnect {
	
	private static Connection conn = null;
	
	public static Connection getConn() {
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook_project","root","19062003");
		
		}catch(Exception e) {
			e.printStackTrace();
		
		}
		
		return conn;
	}
	
}
