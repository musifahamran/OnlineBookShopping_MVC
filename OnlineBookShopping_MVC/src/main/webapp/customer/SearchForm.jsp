<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,com.bean.Book"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<script>
window.onload = function() {
	let msg = "<%=request.getAttribute("msg")%>";
	if (msg != "null") {
		alert(msg);
		<% request.removeAttribute("msg");%>
	}
};
function validateForm() {
	  let searchInput = document.forms["searchForm"]["search"].value;
	  if (searchInput == "") {
	    alert("Please type in the textbox to start searching...");
	    return false;
	  }
	  else{
		  return true;
	  } 
	  return false;
		  
}
</script>
<style>
body {
  font-family: Arial;
}

* {
  box-sizing: border-box;
}

form.searchForm input[type=text] {
  padding: 10px;
  font-size: 13px;
  border: 1px solid grey;
  float: left;
  width: 80%;
  background: #f1f1f1;
}

form.searchForm button {
  float: left;
  width: 20%;
  padding: 10px;
  background: #2196F3;
  color: white;
  font-size: 13px;
  border: 1px solid grey;
  border-left: none;
  cursor: pointer;
}

form.searchForm button:hover {
  background: #0b7dda;
}

form.searchForm::after {
  content: "";
  clear: both;
  display: table;
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
</style>
<body>
<form class="searchForm" action="../ViewSearchResultServlet" method="post" style="margin:auto;max-width:300px" target='frame' onsubmit="return validateForm()">
<div align="center">
  <input type="text" placeholder="Search..author or book title" name="search">
  <button type="submit">Submit</button>
  </div>
</form>
<br>

<%
List<Book> booklist = (List<Book>)request.getAttribute("searchResult");
if(booklist!=null){
	%>
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
	Base64.Encoder encoder = Base64.getEncoder();
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
	
	
}
%>
</table>
</div>
</body>
</html>