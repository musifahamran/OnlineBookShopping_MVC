package com.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.db.DBConnect;

public class Book {
	private int bookID;
	private String title;
	private String author;
	private int stock;
	private float price;
	private String category;
	private byte[] image;
	public Book() {
		// TODO Auto-generated constructor stub
	}
	public Book(int bookID){
		this.bookID = bookID;
	}
	public Book(String title, String author, int stock, float price,String category, byte[] image) {
		super();
		this.title = title;
		this.author = author;
		this.stock = stock;
		this.price = price;
		this.category = category;
		this.image = image;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float d) {
		this.price = d;
	}
	public int getBookID() {
		return bookID;
	}
	public void setBookID(int bookID) {
		this.bookID = bookID;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}

}
