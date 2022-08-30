package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Book;
import com.bean.Transaction;
import com.dao.BookDao;
import com.dao.TransactionDao;

/**
 * Servlet implementation class ViewTransactionHistoryServlet
 */
@WebServlet("/ViewTransactionHistoryServlet")
public class ViewTransactionHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if (session != null) {
			List<Book> list = BookDao.bookList(request.getParameter("id"));	
			List<Transaction> list2 = TransactionDao.transactionList((int)session.getAttribute("customerID"));
			request.setAttribute("booklist", list);
			request.setAttribute("transactionlist", list2);
			request.getRequestDispatcher("customer/ViewTransactionHistory.jsp").forward(request, response);
		}
	}

}
