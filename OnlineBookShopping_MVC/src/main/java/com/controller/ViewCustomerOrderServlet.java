package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Book;
import com.bean.Transaction;
import com.dao.BookDao;
import com.dao.TransactionDao;

/**
 * Servlet implementation class ViewCustomerOrderServlet
 */
@WebServlet("/ViewCustomerOrderServlet")
public class ViewCustomerOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Transaction> list2 = TransactionDao.getCustomerOrder();
		request.setAttribute("customerOrderList", list2);
		request.getRequestDispatcher("admin/ViewCustomerOrder.jsp").forward(request, response);
	}

}
