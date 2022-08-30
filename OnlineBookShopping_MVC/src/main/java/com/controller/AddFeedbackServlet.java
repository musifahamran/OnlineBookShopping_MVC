package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Feedback;
import com.dao.BookDao;
import com.dao.FeedbackDao;

/**
 * Servlet implementation class AddFeedbackServlet
 */
@WebServlet("/AddFeedbackServlet")
public class AddFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Feedback obj = new Feedback();
		obj.setName(request.getParameter("name"));
		obj.setEmail(request.getParameter("email"));
		obj.setPhoneNo(request.getParameter("phoneNo"));
		obj.setDescription(request.getParameter("feedback"));
		
		int recordInsert = FeedbackDao.addFeedback(obj);
		if(recordInsert>0) {
			request.setAttribute("alert", "Thank you for your feedback! We'll reach out to you soon.");	
		}
		else {
			request.setAttribute("alert", "Unable to process your feedback!\\nTry again later...");
		}
		request.getRequestDispatcher("/ContactUs.jsp").forward(request, response);
	}

}
