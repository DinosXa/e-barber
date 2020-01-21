<!-- t8170101 (κατανόηση όλων) -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import= "login_classes.*"%>

<%@ include file="logincheck.jsp"%>
<%
if(session.getAttribute("user") == null) {
	request.setAttribute("message", "You are not connected. Please login.");
%>
	<jsp:forward page="index.jsp" />
<% }session.invalidate();%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">	
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	
		<title>Log out</title>
	
		<!-- automatically will redirect to index_ex1_b_8170101.jsp after 1.5 seconds -->
		<meta http-equiv="refresh" content="1.0;url=<%=request.getContextPath() %>/ismgroup26/index.jsp" />
		<!-- Bootstrap core CSS & JQuery-->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<!-- Custom styles for this template -->
		<link rel="stylesheet" type="text/css" href="css_docs/firstPage.css">
	</head>
	<style>
		body {
			background-image: url("<%=request.getContextPath() %>/ismgroup26/imgs/barberBG1.jpg"); 
			background-size: cover;		
		}
	</style>
	<body>
		<h1 class="text-center font-weight-lighter" style="color:white; margin-top:5%;"><em>e-barber</em></h1>
		<div class="jumbotron">
			<h3 class="text-center font-weight-lighter" style="color:#6B8E23;">See you!</h3>	
		</div>

		<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>		
	</body>
</html>