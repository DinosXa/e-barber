<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import= "login_classes.*"%>

<%@ include file="logincheck.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		
		<title>My appointments</title>
		
		<!-- Bootstrap core CSS & JQuery-->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<!-- Custom styles for this template -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/menu2.css">

	</head>
	<style>
		body {
			background-image: url("<%=request.getContextPath() %>/ismgroup26/imgs/barberBG1.jpg"); 
			background-size: cover;		
		}
	</style>	
	<body>
		<% CustomerUser user = (CustomerUser)session.getAttribute("user");%>
		<%@ include file="cnavbar.jsp"%>

		<div class="container theme-showcase" role="main">
			<div class="jumbotron">
				<h1>My appointments</h1>
			</div>
			<div class="container">
				<div class="card" style="width:250px;">
					<img class="card-img-top" src="<%=request.getContextPath() %>/ismgroup26/imgs/bpoleAv.jpg" alt="Card image" style="width:250px; height:200px;">
					<div class="card-body">
						<h4 class="card-title">Barber01</h4>
						<p class="card-text">phone: 2109999999</p>
						<p class="card-text">email: barber01@gmail.com</p>
						<p class="card-text">date: 21/11/2019</p>
						<p class="card-text">time: 18:00pm</p>
						<a href="#" class="btn btn-primary">Change</a>
						<button type="button" class="btn btn-danger">Cancel</button>  
					</div>
				</div>
			</div> 
		</div>
		
		<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/ismgroup26/js/custom.js"></script>
	</body>
</html>

