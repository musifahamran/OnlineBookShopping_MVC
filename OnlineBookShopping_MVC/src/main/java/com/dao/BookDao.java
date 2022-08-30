package com.dao;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import com.bean.Book;
import com.bean.Transaction;
import com.db.DBConnect;

public class BookDao {
	
	public static List<Book> bookList(String sortbyOption){
		List<Book> bookList = new ArrayList<>();
		Connection conn = DBConnect.dbConnect();
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from book order by " + sortbyOption);
			ResultSet rs = ps.executeQuery();
			if(!rs.isBeforeFirst()){
				return null;
			}
			else{
			while(rs.next()) {
					Book book = new Book();
					book.setBookID(rs.getInt(1));
					book.setTitle(rs.getString(2));
					book.setAuthor(rs.getString(3));
					book.setStock(rs.getInt(4));
					book.setPrice(rs.getFloat(5));
					book.setCategory(rs.getString(6));
					book.setImage(rs.getBytes(7));
					bookList.add(book);
			}
			}
			conn.close();
			} catch (SQLException e) {
			e.printStackTrace();
		}
		return bookList;		
	}

	public static int addBook(Book book) {
		// TODO Auto-generated method stub
		Connection conn = DBConnect.dbConnect();
		try {
		PreparedStatement ps = conn.prepareStatement("insert into book values(seq_book_id.nextval,?,?,?,?,?,?)");
		ps.setString(1,book.getTitle());
		ps.setString(2, book.getAuthor());
		ps.setInt(3,book.getStock());
		ps.setFloat(4, book.getPrice());
		ps.setString(5,book.getCategory());
		ps.setBytes(6,book.getImage());
		int insertRecord = ps.executeUpdate();
		conn.close();
		return insertRecord;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	
	public static int updateBook(Book book, String updateOption) {
		Connection conn = DBConnect.dbConnect();
		int updateRecord=0;
		try {
		PreparedStatement ps = null;
		if(updateOption.equalsIgnoreCase("stock")){
				ps=conn.prepareStatement("update book set stock=? where id=?");
				ps.setInt(1,book.getStock());
			
		}else if(updateOption.equalsIgnoreCase("price")){
				ps=conn.prepareStatement("update book set price=? where id=?");
				ps.setFloat(1, book.getPrice());
				
		}
		ps.setInt(2,book.getBookID());
		updateRecord = ps.executeUpdate();
		conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return updateRecord;
	}
	public static List<Book> bookfilterbyCategory(String filterOption) {
		List<Book> bookList = new ArrayList<>();
		Connection conn = DBConnect.dbConnect();
		PreparedStatement ps = null;
		try {
			ps = conn.prepareStatement("Select * from book where UPPER(category)= UPPER('"+ filterOption +"') order by id");
			ResultSet rs = ps.executeQuery();
			if(!rs.isBeforeFirst()){
				return null;
			}
			else{
			while(rs.next()) {
					Book book = new Book();
					book.setBookID(rs.getInt(1));
					book.setTitle(rs.getString(2));
					book.setAuthor(rs.getString(3));
					book.setStock(rs.getInt(4));
					book.setPrice(rs.getFloat(5));
					book.setCategory(rs.getString(6));
					book.setImage(rs.getBytes(7));
					bookList.add(book);
			}
			}
			conn.close();
			} catch (SQLException e) {
			e.printStackTrace();
		}
		return bookList;		
		
	}
	public static int purchaseBook(Transaction t1) {
		Connection conn = DBConnect.dbConnect();
		PreparedStatement ps =null;
		int insertRecord=0;
		if(checkBookStock(t1.getBook_id(),t1.getQuantity())) {
			try {
				ps = conn.prepareStatement("Select * from book where id=?");
				ps.setInt(1, t1.getBook_id());
				ResultSet rs = ps.executeQuery();
				ps = conn.prepareStatement("insert into transaction values(seq_transac_id.nextval,?,?,?,?,?)");
				ps.setInt(1, t1.getCustomer_id()); //Customer ID
				ps.setInt(2, t1.getBook_id()); //Book ID
				ps.setInt(3,t1.getQuantity()); 
				if(rs.next()) {
					t1.setTotalPrice(rs.getFloat(5)*t1.getQuantity());
					}
				ps.setFloat(4, t1.getTotalPrice()); //Total Price
				ps.setDate(5,  Date.valueOf(t1.getTransaction_date()));
				insertRecord = ps.executeUpdate();
				PreparedStatement ps2 = conn.prepareStatement("update book set stock=? where id=?");
				ps2.setInt(1, (rs.getInt(4)-t1.getQuantity()));
				ps2.setInt(2, t1.getBook_id());
				insertRecord += ps2.executeUpdate();
				conn.close();
				return insertRecord;
				}catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
		return -1;
	
	}
	public static boolean checkBookStock(int bookID, int quantity) {
		Connection conn = DBConnect.dbConnect();
		boolean check = true;
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from book where id=?");
			ps.setInt(1, bookID);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				if(rs.getInt(4)<quantity)
					check= false;
			}
			conn.close();
			return check;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public static List<Book> searchBook(String input) {
		return null;
		
	}

	public static List<Book> searchResult(String searchInput) {
		List<Book> resultList = new ArrayList<>();
		Connection conn = DBConnect.dbConnect();
		try {
			PreparedStatement ps = conn.prepareStatement("Select * from book where UPPER(title) like UPPER(?) OR UPPER(author) like UPPER(?)");
			ps.setString(1, "%" + searchInput + "%");
			ps.setString(2, "%" + searchInput + "%");
			ResultSet rs = ps.executeQuery();
			if(!rs.isBeforeFirst()){
				return null;
			}
			else{
				while(rs.next()) {
					Book b1 = new Book();
					b1.setBookID(rs.getInt(1));
					b1.setTitle(rs.getString(2));
					b1.setAuthor(rs.getString(3));
					b1.setStock(rs.getInt(4));
					b1.setPrice(rs.getFloat(5));
					b1.setCategory(rs.getString(6));
					b1.setImage(rs.getBytes(7));
					resultList.add(b1);
				}
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return resultList;
	}
	public static byte[] toByteArray(InputStream is) throws IOException {
		ByteArrayOutputStream os = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int len;
        while ((len = is.read(buffer)) != -1) {
            os.write(buffer, 0, len);
        }
        return os.toByteArray();
    }
}
