<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html lang="en">
	<head>
		<meta name="description" content="Error page">
		<title>Error Page</title>
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
						<b>Message: </b> <%= exception.getMessage() %>
					</p>
					<p>
						<b>Class: </b> <%= exception.getClass() %>
					</p>
				</div>
			<% } %>		
		</div>
		<!-- /container -->
		
	</body>
</html>