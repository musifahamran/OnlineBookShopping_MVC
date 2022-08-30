<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Admin</title>
<script type="text/javascript" language="JavaScript">
    if (top.location != self.location) {
      top.location.href = self.location.href;
    }
</script>
<style type="text/css">
body{
background-color: #DBF9FC;
}
.adminMenu {
  width: 200px; /* Set a width if you like */
  position: relative;
  overflow:hidden;
  margin:0;
  padding:0;
  border-radius: 25px;
  border: 2px solid pink;
}
.adminMenu a {
  background-color: #191970;
  color: white; 
  display: block; 
  padding: 12px; 
  text-decoration: none;
  justify-content:center;
  
}
.adminMenu a:hover {
  background-color: #4B0082;
}
.adminFrame{
	border-radius: 25px;
	width:70%;
	height:600px;
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
    height:600px;
    overflow:hidden;

} 
body{
	background-image: url('../bg_image/Books.jpg');
	background-repeat: no-repeat;
  	background-attachment: fixed;
  	background-size: cover;
}
</style>
</head>
<body>
<h1><center>Welcome Admin</font></center></h1>
<div class="float-container">
<div class="c1">
	<div class="adminMenu">
  		<a href="AddBookForm.jsp" target=frame><center>Add Book</center></a>
  		<a href="../ViewBookServlet" target=frame><center>View Book</center></a>
  		<a href="../UpdateBookServlet" target=frame><center>Update Book</center></a>
  		<a href="../ViewCustomerOrderServlet" target=frame><center>View Customer Order</center></a>
  		<a href="../Logout.jsp" target=frame><center>Logout</center></a>
	</div>
</div>
<div class="c2">
	<div class="iframe" align="center">
	<iframe class="adminFrame"  align="middle" frameBorder="0" name=frame></iframe>
	</div>
</div>
</div>
</body>
</html>