package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bean.Feedback;
import com.db.DBConnect;

public class FeedbackDao {
	
	public static int addFeedback(Feedback obj) {
		Connection conn = DBConnect.dbConnect();
		try {
		PreparedStatement ps = conn.prepareStatement("insert into feedback values(seq_book_id.nextval,?,?,?,?)");
		ps.setString(1,obj.getName());
		ps.setString(2, obj.getEmail());
		ps.setString(3,obj.getPhoneNo());
		ps.setString(4, obj.getDescription());
		int insertRecord = ps.executeUpdate();
		conn.close();
		return insertRecord;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		
	}

}
