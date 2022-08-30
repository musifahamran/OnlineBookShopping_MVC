<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.bean.Book, com.dao.BookDao, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Portal</title>
</head>
<style>
body{
background-color: #FFF8DC;
}
.updatebtn{
	border-radius:3px;
	border:1px solid #124d77;
	cursor:pointer;
	font-family:Arial;
	font-size:13px;
	padding:6px 24px;
	text-decoration:none;
	background-color:#660066;
	 color:#ffffff;
}
.updatebtn:hover {
      background-color:#cce6ff;
      color: black;
      transition: 0.7s;
  }

</style>
<script>
window.onload = function() {
	let message = "<%=request.getAttribute("alert")%>";
	if (message != "null") {
		alert(message);
		<% request.removeAttribute("alert");%>
	}
};
function validate() {
	let stockList = document.getElementById('stockList');
	stockList.style.display = 'none';
	stockList.required = false;
	let bookField = document.forms['updateForm']['bookTitles'].value;
	let columnField = document.forms['updateForm']['columnList'].value;
	let updateField = document.forms['updateForm']['columnList'];
	let selectedField = updateField.options[updateField.selectedIndex];
	let input = document.forms['updateForm']['updateTxtBox'].value;
	if(bookField == 'none'){
		alert("Please select a book to update!");
		return false;
	}
	else if(columnField == 'none'){
		alert("Please select a choice to update!");
		return false;
	}
	else{ 
	if(selectedField.value != '') {
		document.getElementById('updateTxtBox').style.display = 'block';
		if(selectedField.value == 'stock'){
			document.getElementById('updateTxtBox').style.display = 'none';
			document.getElementById('stockList').style.display = 'block';
		}
		else if(selectedField.value == 'price'){
			document.getElementById('updateTxtBox').placeholder = 'Enter price';
			}
	}
	return true;
	}
	return false;
	
};
</script>
<body>
<form name='updateForm' align='center' action='UpdateBookServlet' method='post' onsubmit="return validate()">
<div class='container' align='center'>
<br>
<h2><center>Update Book</center></h2>
<hr>
<table>
	<br>
	<tr>
	<td>Select Book to update:</td>
	<td><select id='bookTitles' name='bookTitles'>
	<option value='none' selected disabled hidden>Select Book</option>
		<%         	List<Book> booklist = (List<Book>)request.getAttribute("list");
					for(Book book:booklist){
						out.println("<option value='" + book.getBookID() +"'>"+ book.getTitle() + "</option>");
					}
	%>
	</select></td>
	</tr>
	<tr><td><label for='update'>Select choice to update:</label></td>
	<td><select name='columnList' required onchange='validate()'>
	<option value='none' selected disabled hidden>Select an Option</option>
	<option value='stock'>Stock</option>
	<option value='price'>Price</option></select></td></tr>
	<tr><td><label id='value' for='value'>Enter update details</label></td>
	<td><input type='text' id='updateTxtBox' name='updateTxtBox'>
	<select id='stockList' name='stockList' required style='display: none;'>
		<option value='1'>1</option>
		<option value='2'>2</option>
		<option value='3'>3</option>
		<option value='4'>4</option>
		<option value='5'>5</option>
		<option value='6'>6</option>
		<option value='7'>7</option>
		<option value='8'>8</option>
		<option value='9'>9</option>
		<option value='10'>10</option></select></td>
	</td></tr>
	</table><br>
	<hr><br><button class='updatebtn' type='submit' align='center'>Update</button></div></form>
</div>
</form>
</body>
</html>