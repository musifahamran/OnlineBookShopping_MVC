package com.controller;


import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Base64;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.tomcat.util.http.fileupload.FileUtils;

import com.bean.Book;
import com.dao.BookDao;
import com.db.DBConnect;

/**
 * Servlet implementation class AddBookServlet
 */
@WebServlet("/AddBookServlet")
@MultipartConfig(fileSizeThreshold = 1024*1024,
maxFileSize = 1024*1024*5,
maxRequestSize = 1024*1024*5*5)
public class AddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		InputStream imageUpload = request.getPart("fileUpload").getInputStream();
		PrintWriter out = response.getWriter();
		try {
	        ImageIO.read(imageUpload).toString();
	        Book b1 = new Book();
			b1.setTitle(request.getParameter("bookName"));
			b1.setAuthor(request.getParameter("author"));
			b1.setPrice(Float.parseFloat(request.getParameter("price")));
			b1.setStock(Integer.parseInt(request.getParameter("stockList")));
			b1.setCategory(request.getParameter("categoryList"));
			byte[] image = BookDao.toByteArray(request.getPart("fileUpload").getInputStream());
			b1.setImage(image);
			int num = BookDao.addBook(b1);
			if(num>0) {
				request.setAttribute("alert", "Successfully added " + b1.getTitle() + " to book list!");	
			}
			else {
				request.setAttribute("alert", "Unable to add book to list!\\nTry again later...");
			}
	    } catch (Exception e) {
	    	request.setAttribute("alert", "File is not an image!\\nPlease upload in bmp, gif, jpg, gif or tfif extenstion");
	    }
		request.getRequestDispatcher("admin/AddBookForm.jsp").forward(request, response);
		
	}
}
