<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import= "login_classes.*"%>
<%@ page import= "java.util.*"%>

<%@ include file="logincheck.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		
		<title>My reviews</title>
		
		<!-- Bootstrap core CSS & JQuery-->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<!-- Custom styles for this template -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/menu2.css">		
		<script src="https://kit.fontawesome.com/3781654338.js" crossorigin="anonymous"></script>

	</head>
	<style>
		body {
			background-image: url("<%=request.getContextPath() %>/ismgroup26/imgs/barberBG1.jpg"); 
			background-size: cover;		
		}
	</style>	
	<body>			
		<%	CustomerUser user = (CustomerUser)session.getAttribute("user");	%>
		<%@ include file="cnavbar.jsp"%>
		<div class="container theme-showcase" role="main">
			<div class="jumbotron">
				<h1>My reviews</h1>
			</div>
			<div class="container">
				<div class="media border p-3">
					<img src="<%=request.getContextPath() %>/ismgroup26/imgs/bpoleAv.jpg" alt="barber-photo" class="mr-3 mt-3 rounded-circle" style="width:120px;">
					<div class="media-body">
						<h4>Barber01 <small><i>Answered on February 15, 2019<i></small></h4>
						<p>Ευχαριστούμε για την κριτική! </p>
						<p>
							<span class="fas fa-star"></span>
							<span class="fas fa-star"></span>
							<span class="fas fa-star"></span>
							<span class="fas fa-star"></span>
							<span class="far fa-star"></span>
						</p>	
						<button type="button" class="btn btn-info btn-rounded">Answer</button>
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

