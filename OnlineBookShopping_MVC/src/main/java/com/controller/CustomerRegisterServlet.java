package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Customer;
import com.dao.CustomerDao;

/**
 * Servlet implementation class CustomerRegisterServlet
 */
@WebServlet("/CustomerRegisterServlet")
public class CustomerRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer customer = new Customer();
		customer.setFname(request.getParameter("fname"));
		customer.setLname(request.getParameter("lname"));
		customer.setEmail(request.getParameter("email"));
		customer.setPhoneNo(request.getParameter("phoneNo"));
		int insertRecord = CustomerDao.addCustomer(customer);
		if(insertRecord>1) {
			request.setAttribute("alert", "You have registered successfully!");	
		}
		else {
			request.setAttribute("alert", "Unsuccessful registration... \\nPlease try again.");	
		}
		request.getRequestDispatcher("/Register.jsp").forward(request, response);;
	}

}
