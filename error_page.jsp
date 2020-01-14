<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		<meta name="description" content="Error page">		

		<title>Error Page</title>

		<!-- Bootstrap core CSS & JQuery-->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<!-- Custom styles for this template -->	
	</head>
	<body>			
		<div class="container">
			<!-- Page Title -->
			<div class="page-header">
				<h1>Error</h1>				
			</div>
			<% if(exception != null) {  %>			
				<div class="alert alert-danger" role="alert">
					<p>
						<b>The Message: </b> <%= exception.getMessage() %>
					</p>
					<p>
						<b>The Class: </b> <%= exception.getClass() %>
					</p>
				</div>
			<% } %>		
		</div>
		<!-- /container -->	
	</body>
</html>