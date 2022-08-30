package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Book;
import com.dao.BookDao;

/**
 * Servlet implementation class ViewBookbyCategoryServlet
 */
@WebServlet("/ViewBookbyCategoryServlet")
public class ViewBookbyCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Book> list = BookDao.bookfilterbyCategory(request.getParameter("filterOption"));
		request.setAttribute("list", list);
		request.getRequestDispatcher("customer/ViewBookbyCategory.jsp").forward(request, response);
		
	}

}
