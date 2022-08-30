package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.User;
import com.dao.UserDao;
import com.db.DBConnect;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = new User();
		user.setUserID(request.getParameter("userID"));
		user.setPassword(request.getParameter("pwd"));
		if(user.getUserID() !=null && user.getPassword() !=null){
			String role = UserDao.checkLogin(user);
			
			ServletContext servletcontext = getServletContext();
			servletcontext.setAttribute("userID", user.getUserID());
			
			if(role!=null) {
				session.setAttribute("name", user.getUserID());
				if(role.equalsIgnoreCase("admin")){
					response.sendRedirect("admin/AdminPage.jsp");
				}
				else if(role.equalsIgnoreCase("customer")){
					session.setAttribute("customerID", UserDao.getCustomerID(user.getPassword()));
					response.sendRedirect("customer/CustomerPage.jsp");
				}
			}
			else {
				request.setAttribute("msg", "Invalid username or password...");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
		}
	}

}
