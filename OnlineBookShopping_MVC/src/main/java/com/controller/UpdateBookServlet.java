package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Book;
import com.dao.BookDao;

/**
 * Servlet implementation class UpdateBookServlet
 */
@WebServlet("/UpdateBookServlet")
public class UpdateBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Book> bookList = BookDao.bookList("id");
		request.setAttribute("list", bookList);
		request.getRequestDispatcher("admin/UpdateBookForm.jsp").forward(request, response);
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Book b1 = new Book();
		String updateOption=null;
		b1.setBookID(Integer.parseInt(request.getParameter("bookTitles")));
		if(request.getParameter("updateTxtBox")!="") {
			b1.setPrice(Float.parseFloat(request.getParameter("updateTxtBox")));
			updateOption="price";
		}
		else if(request.getParameter("stockList")!="none") {
			b1.setStock(Integer.parseInt(request.getParameter("stockList")));
			updateOption="stock";
		}
		int insertRecord = BookDao.updateBook(b1, updateOption);
		if(insertRecord>0) {
			request.setAttribute("alert", "Successfully updated book!");	
		}
		else {
			request.setAttribute("alert", "Unable to update book! Try again later...");	
		}
		this.doGet(request, response);
		
		
	}

}
