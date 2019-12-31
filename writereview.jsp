<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import= "login_classes.*"%>

<%@ include file="logincheck.jsp"%>
<%@ include file="ccc.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->	

		<title>Give feedback</title>

		<!-- Bootstrap core CSS & JQuery-->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<!-- Custom styles for this template -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/menu2.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/navbar.css">
	</head>
	<style>
		body {
			background-image: url("<%=request.getContextPath() %>/ismgroup26/imgs/barberBG1.jpg"); 
			background-size: cover;		
		}
	</style>
		<body>
		<%	CustomerUser user = (CustomerUser)session.getAttribute("user");	%>
		<%@	include file="cnavbar.jsp"%>
		
			<div class="container theme-showcase" role="main">
				<!-- Main jumbotron for a primary marketing message or call to action -->
				<div class="jumbotron">
					<h1>Write a review!</h1>
				</div>
					<form action="action_page.php">
						<label for="fname">First Name</label>
						<input type="text" id="fname" name="firstname" placeholder="Your name..">

						<label for="lname">Last Name</label>
						<input type="text" id="lname" name="lastname" placeholder="Your last name..">

						<label for="subject">Review</label>
						<textarea id="subject" name="subject" placeholder="Write a review..." style="height:200px"></textarea>
						<p>Rate!</p>
						<p>
							<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
						</p>
						<input type="submit" value="Submit">
					</form>
				</div> 
			</div>
			<!-- End of container -->
				
			<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
			<!-- jQuery library -->
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
			<!-- Bootstrap core JavaScript -->
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
			<script type="text/javascript" src="<%=request.getContextPath() %>/ismgroup26/js/custom.js"></script>				
		</body>	
	</html>