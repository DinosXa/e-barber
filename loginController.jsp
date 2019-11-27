<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import= "login_classes.BarbershopUserDAO"%>
<%@ page import= "login_classes.BarbershopUser"%>
<!DOCTYPE html>
<html>
	<<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->	
	
		<title>Log in handler</title>

		<!-- Bootstrap core CSS & JQuery-->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<!-- Custom styles for this template -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/firstPage.css">
	</head>
	<style>
		body {
			background-image: url("<%=request.getContextPath() %>/ismgroup26/imgs/barberBG1.jpg"); 
			background-size: cover;

		#AccountsBnC{
			margin-right:5%;
			color:black;
		}
		}
	</style>	
	<body>
		
		<%
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			BarbershopUserDAO dao = new BarbershopUserDAO();
		   
			try{
				BarbershopUser user = dao.authenticate(username, password); 
				session.setAttribute("user1", user);
			}catch(Exception e){
			   request.setAttribute("message", "Wrong username or password");
			} %>
			<jsp:forward page="index.jsp"/>
		<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>		
	</body>
</html>
		   
		