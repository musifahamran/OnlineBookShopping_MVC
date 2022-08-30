package com.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.bean.Book;
import com.bean.Customer;
import com.bean.Transaction;
import com.db.DBConnect;

public class TransactionDao {
	
	public static List<Transaction> transactionList(int customer_id){
		List<Transaction> transactionHistory = new ArrayList<>();
		Connection conn = DBConnect.dbConnect();
		try {
			PreparedStatement ps = conn.prepareStatement("Select id, book_id, quantity, price, transaction_date from transaction where customer_id=?");
			ps.setInt(1, customer_id);
			ResultSet rs = ps.executeQuery();
			if(!rs.isBeforeFirst()){
				return null;
			}
			else{
			while(rs.next()) {
					Transaction obj = new Transaction();
					obj.setTransaction_id(rs.getInt(1));
					obj.setBook_id(rs.getInt(2));
					obj.setQuantity(rs.getInt(3));
					obj.setTotalPrice(rs.getFloat(4));
					obj.setTransaction_date(rs.getDate(5).toLocalDate());
					transactionHistory.add(obj);
			}
			}
			conn.close();
			} catch (SQLException e) {
			e.printStackTrace();
		}
		return transactionHistory;
		
	}

	
	public static List<Transaction> getCustomerOrder(){
		List<Transaction> customerOrderList = new ArrayList<>();
		Connection conn = DBConnect.dbConnect();
		
		try {
			PreparedStatement ps = conn.prepareStatement("Select t.id, t.quantity, t.price, t.transaction_date, c.fname, c.lname, b.title, b.author, b.category from transaction t,bookcustomer c, book b where b.id=t.book_id and c.id=t.customer_id");
			ResultSet rs = ps.executeQuery();
			if(!rs.isBeforeFirst()){
				return null;
			}
			else{
			while(rs.next()) {
					Transaction obj = new Transaction();
					Customer c1 = new Customer();
					Book b1 = new Book();
					obj.setTransaction_id(rs.getInt(1));
					obj.setQuantity(rs.getInt(2));
					obj.setTotalPrice(rs.getFloat(3));
					obj.setTransaction_date(rs.getDate(4).toLocalDate());
					
					c1.setFname(rs.getString(5));
					c1.setLname(rs.getString(6));
					obj.setCustomer(c1);
					
					b1.setTitle(rs.getString(7));
					b1.setAuthor(rs.getString(8));
					b1.setCategory(rs.getString(9));
					obj.setBook(b1);
					
					customerOrderList.add(obj);
			}
			}
			conn.close();
			} catch (SQLException e) {
			e.printStackTrace();
		}
		return customerOrderList;
		
	}
}
