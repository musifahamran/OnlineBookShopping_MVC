package com.db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBConnect {
	
	public static Connection dbConnect(){
		Connection conn =null;
		
		try {
			//step 1
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//step 2
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","dbuser","dbuser");
			if(conn!=null){
				System.out.println("DB connected successfully!!");
			}
			else{
				System.out.println("Sorry..!! Something went wrong");
			}
			//conn.close();
			}catch(ClassNotFoundException | SQLException e){
				e.printStackTrace();
			}
		return conn;
}

}
