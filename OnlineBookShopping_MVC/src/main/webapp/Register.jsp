<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.db.DBConnect" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Page</title>
<style>
#registerbtn{
    width: 250px;
    height: 50px;
}
#clearbbtn{
    width: 300px;
    height: 50px;
}
#container{
    text-align: center;
    padding-left: 151px;
}
body{

background-image: url('bg_image/LifeBook.jpg');
opacity: 0.9;
}
h2,label{
font-family: Trebuchet MS, Helvetica, sans-serif;

}
.registerbtn{
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
.registerbtn:hover {
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
	let message = "<%=request.getAttribute("alert")%>";
	if (message != "null") {
		alert(message);
		<% request.removeAttribute("alert");%>
	}
};
function validateForm() {
	  let fname = document.forms["registerForm"]["fname"].value;
	  let lname = document.forms["registerForm"]["lname"].value;
	  let email = document.forms["registerForm"]["email"].value;
	  let phoneNo = document.forms["registerForm"]["phoneNo"].value;
	  var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/; 

	  if (fname == "") {
	    alert("Please enter your first name");
	    return false;
	  }
	  else if (lname == "") {
		  alert("Please enter your last name");
		  return false;
		}
	  else if (email == "") {
		  alert("Please enter your email");
		  return false;
		}
	  else if (phoneNo == "") {
		  alert("Please enter your phone number");
		  return false;
		}
	  else if (reg.test(email) == false) 
	    {
	        alert('Invalid Email Address');
	        return false;
	    }
	  else 
		  return true;
}
</script>
</head>
<body>
<form name="registerForm" action="CustomerRegisterServlet" method="post" onsubmit="return validateForm()">
<div class="registerContainer" align="center">
	<br>
    <h2 style="text-align:center;">Customer Register Page</h2>
    <hr>
	<table>
	<tr>
	<td><label for="fname"><b>Enter First Name: </b></label></td>
	<td><input type="text" placeholder="Enter First name" name="fname" id="fname"></td>
	</tr>
	<tr>
	<td><label for="lname"><b>Enter Last Name: </b></label></td>
	<td><input type="text" placeholder="Enter Last name" name="lname" id="lname"></td>
	</tr>
	<tr>
	<td><label for="email"><b>Enter Email: </b></label></td>
	<td><input type="text" placeholder="Enter email" name="email" id="email"></td>
	</tr>
	<tr>
	<td><label for="phoneNo"><b>Enter Phone No: </b></label></td>
	<td><input type="text" placeholder="Enter phone number" name="phoneNo" id="phoneNo"></td>
	</tr>
	</table>
    <hr>
	<div id="container">
	<br>
    <button type="submit" class="registerbtn">Register</button>
     <button type="reset" class="clearbtn">Clear</button>
     <br><br>
     </div>
  </div>
  </form>
  </body>
</html>