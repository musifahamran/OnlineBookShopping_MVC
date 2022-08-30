<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*, java.util.*,com.bean.Book,com.dao.BookDao;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Portal</title>
</head>
<style>
.title{
color:black;
 text-shadow: 1px 1px white;
 font-family: Trebuchet MS, Helvetica, sans-serif;
 font-size: large;
 font-weight: 900;
 
}
.bookTable{
 font-family: Trebuchet MS, Helvetica, sans-serif;
}
tbody tr:nth-child(odd) {
  background-color: 	#FAF0E6;
}

tbody tr:nth-child(even) {
  background-color: #efefc3;
}
th{
  background-color:#2F4F4F;
  color: white;
  text-shadow: 1px 1px 1px black;
}

thead th, tfoot th, tfoot td {
  background: linear-gradient(to bottom, rgba(0,0,0,0.1), rgba(0,0,0,0.5));
  border: 3px solid purple;
}
</style>
<%
List<Book> booklist = (List<Book>)request.getAttribute("list");
Base64.Encoder encoder = Base64.getEncoder();
%>
<body>
<div class="title">
<h2><center>Book List</center></h2>
</div>
<div align="center">
<table class="bookTable"  border="1" width="100%" style="border-collapse:collapse; text-align:center;">
<tr>
<th>Book ID</th>
<th>Book Cover</th>
<th>Title</th>
<th>Author</th>
<th>Stock</th>
<th>Price</th>
<th>Category</th>
</tr>
<%
				for(Book book : booklist) {
				
				out.println("<tr>");
				out.println("<td>"+book.getBookID()+"</td>");
				out.println("<td><img src='data:image/jpg;base64," + encoder.encodeToString(book.getImage()) + "' style='width:60px;height:80px;'></td></td>");
				out.println("<td>"+book.getTitle()+"</td>");
				out.println("<td>"+book.getAuthor()+"</td>");
				out.println("<td>"+book.getStock()+"</td>");
				out.println("<td>"+book.getPrice()+"</td>");
				out.println("<td>"+book.getCategory()+"</td>");
				out.println("</tr>");
			}
%>
</table>
</div>
</body>

</html>