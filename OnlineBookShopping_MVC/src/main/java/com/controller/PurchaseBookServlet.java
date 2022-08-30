package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Book;
import com.bean.Transaction;
import com.dao.BookDao;

/**
 * Servlet implementation class PurchaseBookServlet
 */
@WebServlet("/PurchaseBookServlet")
public class PurchaseBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Book> list = BookDao.bookList(request.getParameter("id"));
		request.setAttribute("list", list);
		request.getRequestDispatcher("customer/PurchaseBookForm.jsp").forward(request, response);
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession(false);
		Transaction t1 = new Transaction();
		if (session != null) {
			t1.setBook_id(Integer.parseInt(request.getParameter("bookTitles")));
			t1.setQuantity(Integer.parseInt(request.getParameter("quantity")));
			t1.setCustomer_id((int)session.getAttribute("customerID"));
			t1.setTransaction_date((LocalDate.now()));
			int insertRecord = BookDao.purchaseBook(t1);
			if(insertRecord>1) {
				request.setAttribute("alert", "Thank you for your purchase!\\nYour total amount: $" + t1.getTotalPrice() +"!");	
			}else if(insertRecord<0) {
				request.setAttribute("alert", "Not enough in stock!");	
			}
			else {
				request.setAttribute("alert", "Failed to purchase book! Try again later...");
			}
			this.doGet(request, response);
	}
		else {
			System.out.print("No existing session!");
		}
	}

}
