<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Portal</title>
<script type="text/javascript" language="JavaScript">
    if (top.location != self.location) {
      top.location.href = self.location.href;
    }
</script>
<style>
.customerMenu {
  width: 200px; /* Set a width if you like */
  position: relative;
  overflow:hidden;
  margin:0;
  padding:0;
  border-radius: 25px;
  border: 2px solid white;
}
.customerMenu a {
  background-color: #191970;
  color: white; 
  display: block; 
  padding: 12px; 
  text-decoration: none;
  justify-content:center;
}
.customerMenu a:hover {
  background-color: #4B0082;
}
.customerFrame{
	width:60%;
	height:800px;
}
.float-container {
    padding:30px;
}
.c1 {
    width: 11%;
    float: left;
    height:20%;
    padding: 80px 0px;

} 
.c2 {
    width: 80%;
    float: center;
    height:800px;
    overflow:hidden;

} 
body{
	background-image: url('../bg_image/stackBook.jpg');
	background-repeat: no-repeat;
  	background-attachment: fixed;
  	background-size: cover;
}
h3{
font-family: Trebuchet MS, Helvetica, sans-serif;
}
h1{
	font-color: white;
}
.subnav {
 width:inherit;
 display: block;
}
.subnav:hover .subnav-content {
  display: block;
}
.subnav-content {
  display: none;
  left: 0;
  width: 100%;
  z-index: 1;
  border: 1px solid yellow;
  
}
.subnav .subnavA {
  font-size: 16px;
  border: none;
  outline: none;
  color: white;
  background-color: light-blue;
  font-family: inherit;
  margin: 0;
}
.sidenav {
  height: 100%;
  width: 200px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  padding-top: 20px;
}
</style>
</head>
<body>
<h1><center>Customer Portal</center></h1>
<h3><left>Welcome back, 
<% out.println(application.getAttribute("userID"));%>!</left></h3>
<div class="float-container">
<div class="c1">
	<div class="customerMenu">
		 <input type="hidden" id="sortbyID" name="sortbyID" value="none">
		 <div class="subnav">
		<a href="../ViewBookServlet?sortOption=id" class="subA" id="viewBook" target=frame><center>View Book</center><i class="fa fa-caret-left"></i></a>
		<div class="subnav-content">
	    <a href="../ViewBookServlet?sortOption=title" id="viewbyTitle" target=frame><center>By Title</center></a>
	     <a href="../ViewBookServlet?sortOption=price" id="viewbyPrice"  target=frame><center>By Price</center></a>
	     </div>
	     </div>
	      <div class="subnav">
		<a class="subA"   href="../ViewBookServlet?sortOption=category"  target=frame><center>Category</center><i class="fa fa-caret-left"></i></a>
		<div class="subnav-content">
	     <a href="../ViewBookbyCategoryServlet?filterOption=young adult"  target=frame><center>Young Adult</center></a>
	     <a href="../ViewBookbyCategoryServlet?filterOption=autobiography"  target=frame><center>Autobiography</center></a>
	     <a href="../ViewBookbyCategoryServlet?filterOption=computer"  target=frame><center>Computer</center></a>
	     <a href="../ViewBookbyCategoryServlet?filterOption=graphic novel"  target=frame><center>Graphic Novel</center></a>
	     <a href="../ViewBookbyCategoryServlet?filterOption=comic"  target=frame><center>Comic</center></a>
	     <a href="../ViewBookbyCategoryServlet?filterOption=language"  target=frame><center>Language</center></a>
	     <a href="../ViewBookbyCategoryServlet?filterOption=science fiction"  target=frame><center>Science Fiction</center></a>
	     </div>
	     </div>
  		<a href="../PurchaseBookServlet" target=frame><center>Purchase Book</center></a>
  		<a href="../ViewTransactionHistoryServlet" target=frame><center>Transaction History</center></a>
  		<a href="../Logout.jsp" target=frame><center>Logout</center></a>
	</div>
</div>
<div class="c2">
	<div class="iframe" align="center">
	<iframe src="SearchForm.jsp" class="customerFrame"  align="middle" frameBorder="0" name=frame></iframe>
	</div>
</div>
</div>
</body>
</html>