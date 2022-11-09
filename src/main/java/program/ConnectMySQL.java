package program;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectMySQL {
	public static void main(String[] args) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/eBook_project?useSSL=false"; 
			String user="root";
			String password="19062003";
			Connection conn = DriverManager.getConnection(url,user,password);
			System.out.println("Success!!");
			if(conn != null) {
				System.out.println("Failed");
			}else {
				System.out.println("Cusss");
			}
			
		} catch (Exception e) {
			System.out.println("Error");
			e.printStackTrace();	
			
		}
		

	}
	
	
}