<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.db.DBConnect,com.bean.Book, com.dao.BookDao, java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Purchase Book</title>
<script>
window.onload = function() {
	let message = "<%=request.getAttribute("alert")%>";
	if (message != "null") {
		alert(message);
		<% request.removeAttribute("alert");%>
	}
};
function validateForm() {
	  let bookName = document.forms["buyBookForm"]["bookTitles"].value;
	  let stock = document.forms["buyBookForm"]["quantity"].value;
	  if (bookName == "none") {
	    alert("Please select book name");
	    return false;
	  }
	  else if (stock == "") {
		  alert("Please enter quantity");
		  return false;
	  }
	  return true;
} 
</script>
</head>
<style>
.purchaseTable tr:nth-child(odd) {
  background-color: rgba(218,245,246, 0.1);
}

.purchaseTable tr:nth-child(even) {
  background-color: rgba(218,245,246, 0.1);
}
.purchasebtn{
	border-radius:3px;
	border:1px solid #124d77;
	cursor:pointer;
	font-family:Arial;
	font-size:13px;
	padding:6px 12px;
	text-decoration:none;
	background-color:#660066;
	 color:#ffffff;
}
.purchasebtn:hover {
      background-color:#cce6ff;
      color: black;
      transition: 0.7s;
  }
  .bookFrame{
	width:100%;
	height:400px;  
  }
</style>
<body>
<form name="buyBookForm" align="center" action="PurchaseBookServlet" method="post" onsubmit="return validateForm()">
<div class="buyBookContainer" align="center">
<iframe src="ViewBookServlet" class="bookFrame"  align="middle" frameBorder="0" name=productFrame></iframe>
<hr>
<table class = "purchaseTable">
<tr>
<td>Select Book to purchase: </td>
<td><select id='bookTitles' name='bookTitles'>
<option value='none' selected disabled hidden>Select Book</option>
<%
	List<Book> bookList = (List<Book>)request.getAttribute("list");
	for(Book book: bookList){
		out.println("<option value='" +book.getBookID() +"'>"+ book.getTitle() + "</option>");
	}	
%>
</select>
</td>
</tr>
<tr><td>Select quantity:</td>
	<td>
	 <input type="text" placeholder="Enter quantity" name="quantity" id="quantity">
	</td>
	</tr>
</table>
<hr><br><button class='purchasebtn' type='submit' align='center'>Purchase Book</button>
</div>
</form>
</body>
</html>