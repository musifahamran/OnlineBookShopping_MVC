package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;

import com.bean.User;
import com.db.DBConnect;

public class UserDao {

	public static String checkLogin(User user) {
		Connection conn = DBConnect.dbConnect();
		try{		
			PreparedStatement ps = conn.prepareStatement("Select acctype from usertable where userid=? AND userpwd=?");
			ps.setString(1,user.getUserID());
			ps.setString(2, user.getPassword());
			ResultSet rs = ps.executeQuery();
			if(!rs.isBeforeFirst()){
				return null;
			}
			else{
				if(rs.next()){
					return rs.getString(1);
				}
			}
			conn.close();
			}catch(SQLException e){
				e.printStackTrace();
		}
		return null;
	}

	public static int getCustomerID(String email) {
		Connection conn = DBConnect.dbConnect();
		int customerID=0;
		try{		
			PreparedStatement ps = conn.prepareStatement("Select id from bookcustomer where email=?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
				customerID=rs.getInt(1);
			
			conn.close();
			return customerID;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return 0;
	}

}
