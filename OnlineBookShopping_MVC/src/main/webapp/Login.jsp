<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.db.DBConnect" 
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Book Shopping Portal</title>
<style>
#loginbtn{
    width: 270px;
    height: 50px;
}
#clearbbtn{
    width: 260px;
    height: 50px;
}
#container{
    text-align: center;
     padding-left: 123px;
}
body{

background:  linear-gradient(20deg, rgba(251,145,145,0.9391106784510679) 0%, rgba(254,255,223,0.8972631288843662) 2%);i got 
}
h2,label{
font-family: Trebuchet MS, Helvetica, sans-serif;

}
.loginbtn{
	box-shadow:inset 0px 1px 0px 0px #54a3f7;
	background-color:#007dc1;
	border-radius:3px;
	border:1px solid #124d77;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:13px;
	padding:6px 24px;
	text-decoration:none;
}
.loginbtn:hover {
      background-color:#020E5D;
      transition: 0.7s;
  }
.clearbtn{
	box-shadow:inset 0px 1px 0px 0px white;
	border-radius:3px;
	border:1px solid grey;
	cursor:pointer;
	font-family:Arial;
	font-size: 13px;
	background-color: white;
	padding:6px 24px;
}
.clearbtn:hover {
      background-color:#4d4d4d;
      transition: 0.7s;
      color:#ffffff;
  }
</style>
<script>
window.onload = function() {
	let msg = "<%=request.getAttribute("msg")%>";
	if (msg != "null") {
		alert(msg);
		<% request.removeAttribute("msg");%>
	}
};
function validateForm() {
	  let userID = document.forms["loginForm"]["userID"].value;
	  let userpwd = document.forms["loginForm"]["pwd"].value;
	  if (userID == "") {
	    alert("Please enter your User ID");
	    return false;
	  }
	  else if (userpwd == "") {
		  alert("Please enter your password");
		  return false;
		}
	  else{
		  return true;
	  } 
	  return false;
		  
}
</script>
</head>
<body>
<form name="loginForm" action="LoginServlet" method="post" onsubmit="return validateForm()">
<div class="loginContainer" align="center">
	<br>
    <h2 style="text-align:center;">Login Page</h2>
    <hr>
	<table>
	<tr>
	<td><label for="userID"><b>Enter User ID: </b></label></td>
	<td><input type="text" placeholder="Enter User ID" name="userID" id="userID"></td>
	</tr>
	<tr>
	<td><label for="pwd"><b>Enter Password: </b></label></td>
	<td><input type="password" placeholder="Enter Password" name="pwd" id="pwd"></td>
	</tr>
	</table>
    <hr>
	<div id="container">
	<br>
    <button type="submit" class="loginbtn">Login</button>
     <button type="reset" class="clearbtn">Clear</button>
     <br><br>
     </div>
  </div>
  </form>
  </body>
</html>