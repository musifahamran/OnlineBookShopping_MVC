<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,com.db.DBConnect"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script>
window.onload = function() {
	let msg = "<%=request.getAttribute("alert")%>";
	if (msg != "null") {
		alert(msg);
		<% request.removeAttribute("alert");%>
	}
};
function validateForm() {
	  let name = document.forms["feedbackForm"]["name"].value;
	  let feedback = document.forms["feedbackForm"]["feedback"].value;
	  let email = document.forms["feedbackForm"]["email"].value;
	  let phoneNo = document.forms["feedbackForm"]["phoneNo"].value;
	  if (name == "") {
	    alert("Please enter your name");
	    return false;
	  }
	  else if (email == "") {
		  alert("Please enter your email");
		  return false;
		}
	  else if (phoneNo == "") {
		  alert("Please enter your phoneNo");
		  return false;
		}
	  else if (feedback == "") {
		  alert("Please enter your feedback");
		  return false;
		}
	  else 
		  return true;
return false;
}
</script>
</head>
<style>
body{
font-family: Trebuchet MS, Helvetica, sans-serif;
background: linear-gradient(20deg, rgba(251,145,145,0.9391106784510679) 0%, rgba(253,255,210,0.8746849081429446) 2%);
}
.feedbackbtn{
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
.feedbackbtn:hover {
      background-color:#020E5D;
      transition: 0.7s;
  }
</style>
<body>
<div class="container" align="center">
<table>
<tr>
<h2> Contact Us</h2>
<hr>
<td>
<table align="center">
	<tr>
		<td>Company: </td>
		<td>Kinokunniya </td>
		</tr>
		<tr>
		<td>Email:</td>
		<td>kino&#64;gmail.com</td>
		</tr>
		<tr>
		<td>Phone:</td>
		<td>+65 7890 5678</td>
		</tr>
		<tr>
		<td>Fax</td>
		<td>+65 9081 3452</td>
		</tr>
		<tr>
		<td>Website</td>
		<td><a href="www.xyz.com">www.magrudys.com</a></td>
		</tr>
		<tr>
		<td>Address: </td>
		<td>200 Victoria Street 03-09 Bugis Junction, Singapore 188021 </td>
		</tr>
</table>
</td>
<td></td>
<td>
<table>
		<tr>
		<td></td>
		<td>
<div class="mapouter"><div class="gmap_canvas"><iframe class="gmap_iframe" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?width=400&amp;height=350&amp;hl=en&amp;q=200 Victoria Street 03-09 Bugis Junction, 188021&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"></iframe><a href="https://embedmapgenerator.com/">embed google maps in website</a></div><style>.mapouter{position:relative;text-align:right;width:400px;height:350px;}.gmap_canvas {overflow:hidden;background:none!important;width:400px;height:350px;}.gmap_iframe {width:400px!important;height:350px!important;}</style></div></table>
</td>
</tr>
</table>
</div>
<div><br> <hr>
<table>
				<h2 style="text-align:center;">Feedback</h2>
				<hr><br>
				<form name="feedbackForm" action="AddFeedbackServlet" method="post" onsubmit="return validateForm()">
					<label for="name">Name</label><br>
					<input type="text" name="name" id="name"><br><br>
					<label for="email">Email</label><br>
					<input type="text" name="email" id="email" ><br><br>
					<label for="phoneNo">Phone No</label><br>
					<input type="text" name="phoneNo" id="phoneNo"><br><br>
					<label for="feedback">Feedback</label><br>
					<textarea name="feedback" rows="10" cols="70" id="feedback"></textarea><br><br>
					<p id="feedbackMsg" style="color:red;"></p>	
					<input type="submit" class="feedbackbtn" value="Submit Feedback">
				</form>
				
</table>
			</div>
		</div>
</body>
</html>