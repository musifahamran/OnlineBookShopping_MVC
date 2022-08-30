<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Book Shopping Portal</title>
<style>
.nav{
	border:10px solid #ccc;
	border-width:1px 0;
	list-style:none;
	margin:0;
	padding:0;
	text-align:center;
}
		
.nav ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333333;
}
		
.nav li{
     display:inline;
}
		
.nav li a:hover {
	background-color: #111;
}
		
.nav a{
	display:inline-block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}
html{
  height: 100%;
}
body{
	background-image: url('bg_image/bookshelf.jpg');
  	background-position: center;
  	background-repeat: no-repeat;
  	background-size: cover;
  	height: 100%;
}
.homeFrame{
	border-radius: 25px;
	width: 900px;
	height:550px;
	display:block;
	margin: 0 auto;

}
.c2{
height:100%;
}
</style>
</head>
<body>
<script type="text/javascript" language="JavaScript">
    if (top.location != self.location) {
      top.location.href = self.location.href;
    }
    function preventBack()
    {window.history.forward();}
    setTimeout("preventBack()", 0);
    window.onunload=function(){null};
</script>
<h1 align="center">Online Book Shopping Portal</h1>
<div class="nav">
<ul>
<li><a href="AboutUs.jsp" target=frame>About Us</a></li>
<li><a href="Register.jsp" target=frame>Customer Register</a></li>
  <li><a href="Login.jsp" target=frame>Login</a></li>
  <li><a href="ContactUs.jsp" target=frame>Contact Us</a></li>
 </ul>
 </div>
 <br>
 <div class="c2" align="center">
<iframe src="bookShop.html"class="homeFrame" align="center" frameBorder="0" name=frame></iframe>
</div>
</body>
</html>