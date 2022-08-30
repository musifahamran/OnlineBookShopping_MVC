<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List,com.bean.Book,com.bean.Transaction" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
<body>
<div class="title">
<h2><center>Transaction History</center></h2>
</div>
<div align="center">
<table class="bookTable"  border="1" width="100%" style="border-collapse:collapse; text-align:center;">
	<tr>
	<th>Transaction ID</th>
	<th>Book Title</th>
	<th>Author</th>
	<th>Category</th>
	<th>Quantity</th>
	<th>Total Price</th>
	<th>Purchased Date</th>
	</tr>
<%
	List<Transaction> transactionList = (List<Transaction>)request.getAttribute("transactionlist");
	List<Book> booklist = (List<Book>)request.getAttribute("booklist");
	
	for(Transaction t1: transactionList){
		for(Book b1: booklist){
			if(t1.getBook_id()==b1.getBookID()){
				out.println("<tr>");
				out.println("<td>"+t1.getTransaction_id()+"</td>");
				out.println("<td>"+b1.getTitle()+"</td>");
				out.println("<td>"+b1.getAuthor()+"</td>");
				out.println("<td>"+b1.getCategory()+"</td>");
				out.println("<td>"+t1.getQuantity()+"</td>");
				out.println("<td>"+t1.getTotalPrice()+"</td>");
				out.println("<td>"+t1.getTransaction_date()+"</td>");
				out.println("</tr>");
				break;
			}
		}
		
	}
				
				
%>
</table>
</div>
</body>

</html>