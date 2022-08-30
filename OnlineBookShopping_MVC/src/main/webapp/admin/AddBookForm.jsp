<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
window.onload = function() {
	let message = "<%=request.getAttribute("alert")%>";
	if (message != "null") {
		alert(message);
		<% request.removeAttribute("alert");%>
	}
};
function validateForm() {
	  let bookName = document.forms["addBookForm"]["bookName"].value;
	  let author = document.forms["addBookForm"]["author"].value;
	  let stock = document.forms["addBookForm"]["stockList"].value;
	  let price = document.forms["addBookForm"]["price"].value;
	  let category = document.forms["addBookForm"]["categoryList"].value;
	  let image = document.forms["addBookForm"]["fileUpload"].value;
	  var fileInput = document.getElementById('fileUpload');
	  if (bookName == "") {
	    alert("Please enter book name");
	    return false;
	  }
	  else if (author == "") {
		  alert("Please enter author");
		  return false;
		}
	  else if (stock == "none") {
		  alert("Please select stock");
		  return false;
		}
	  else if (price == "") {
		  alert("Please enter price");
		  return false;
		}
	  else if (category == "none") {
		  alert("Please select book category");
		  return false;
		}
	  else if (image == "") {
		  alert("Please upload book image");
		  return false;
		}
	  else {
		  return true;
	  }
	  
	return false;
	  
}

</script>
<style>
body{
background-color: #FFF8DC;
}
.addbtn{
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
.addbtn:hover {
      background-color:#cce6ff;
      color: black;
      transition: 0.7s;
  }
 .clearbtn{
	border-radius:3px;
	border:1px solid grey;
	cursor:pointer;
	font-family:Arial;
	font-size: 13px;
	background-color: white;
	padding:6px 12px;
}
.clearbtn:hover {
      background-color:#4d4d4d;
      transition: 0.7s;
      color:#ffffff;
  }
</style>
</head>
<body>
<form name="addBookForm" align="center" action="../AddBookServlet" method="post" onsubmit="return validateForm()" enctype='multipart/form-data'>
<div class="loginContainer" align="center">
	<br>
    <h2 style="text-align:center;">Add Books Form</h2>
    <hr>
	<table>
	<tr>
	<td><label for="bookName"><b>Enter Book Name: </b></label></td>
	<td><input type="text" placeholder="Enter Book Name" name="bookName" id="bookName"></td>
	</tr>
	<tr>
	<td><label for="author"><b>Enter Author: </b></label></td>
	<td><input type="text" placeholder="Enter Author" name="author" id="author"></td>
	</tr>
	<tr>
	<td><label for="stock"><b>Select Stock: </b></label></td>
	<td><select id="stockList" name="stockList">
	<option value='none' selected disabled hidden>Select stock</option>
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
	<option value="10">10</option></select>
	</td>
	</tr>
	<tr>
	<td><label for="price"><b>Enter Price: </b></label></td>
	<td><input type="text" placeholder="Enter Price" name="price" id="price"></td>
	</tr>
	<tr>
	<td><label for="stock"><b>Select Category: </b></label></td>
	<td><select id="categoryList" name="categoryList">
	<option value='none' selected disabled hidden>Select category</option>
	<option value="Young Adult">Young Adult</option>
	<option value="Autobiography">Autobiography</option>
	<option value="Computer">Computer</option>
	<option value="Graphic Novel">Graphic Novel</option>
	<option value="Comic">Comic</option>
	<option value="Language">Language</option>
	<option value="Science Fiction">Science Fiction</option></select>
	</td>
	</tr>
	<tr>
	<td><label for="price"><b>Upload book cover: </b></label></td>
	<td> <input type="file" id="fileUpload" name="fileUpload">
  	</td>
	</tr>
	</table>
    <hr>
    
	<div id="container">
    <button type="submit" class="addbtn" value="Upload">Add Book</button>
     <button type="reset" class="clearbtn">Clear</button>
     </div>
     <br><br><br>
  </div>
  </form>
</body>
</html>