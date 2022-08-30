package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.Customer;
import com.db.DBConnect;

public class CustomerDao {
	
	public static int addCustomer(Customer customer) {
		
		Connection conn = DBConnect.dbConnect();
			try{		
				PreparedStatement ps = conn.prepareStatement("insert into bookcustomer values(seq_bookCustomer_id.nextval,?,?,?,?,?)");
				ps.setString(1,customer.getFname());
				ps.setString(2, customer.getLname());
				ps.setString(3, customer.getEmail());
				ps.setString(4, customer.getEmail());
				ps.setString(5, customer.getPhoneNo());
				PreparedStatement ps1 = conn.prepareStatement("insert into userTable values(?,?,?)");
				ps1.setString(1,customer.getFname());
				ps1.setString(2, customer.getEmail());
				ps1.setString(3, "customer");
				int insertCustomer = ps.executeUpdate();
				insertCustomer += ps1.executeUpdate();
				conn.close();
				return insertCustomer;
				}catch(SQLException e){
					e.printStackTrace();
			}
		return 0;
		
	}


}
