<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import= "exercise.UserDAO"%>
<%@ page import= "exercise.User"%>
<!DOCTYPE html>
<html>
	<!--<head>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css_docs/firstPage.css">
	
		<title>Search</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>	
		<script src="https://kit.fontawesome.com/3781654338.js" crossorigin="anonymous"></script>	
		
		<style>
			body {
				background-image: url("../imgs/barberBG1.jpg"); 
				background-size: cover;		
			}
			#AccountsBnC{
				margin-right:5%;
				color:black;
			}
		</style>

	</head>
		<% request.setCharacterEncoding("ISO-8859-7"); %>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="#"><em>e-barber</em></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
					<li class="nav-item ">
						<a class="nav-link" href=""<%=request.getContextPath() %>/searchforbarbers.html">Search</a>
					</li>
					
					<li class="nav-item ">
						<a class="nav-link" href=""<%=request.getContextPath() %>/myreviews.html">My reviews</a>
					</li>			
					<li class="nav-item ">
						<a class="nav-link" href=""<%=request.getContextPath() %>/myappointments.html">My appointments</a>
					</li>		
				</ul>
				-->
	<div class="container theme-showcase" role="main">

			

		
		<% String username= request.getParameter("username");
		   String password=request.getParameter("password1");
		%>
		<% UserDAO dao= new UserDAO();
		   try{
		   User user = dao.authenticate(username, password); 
		   session.setAttribute("ex1buser2019", user);
		   response.sendRedirect("searchforbarbers.jsp"); 
		   }catch(Exception e){
			   request.setAttribute("message", "Wrong username or password");%>
			   <jsp:forward page="index.jsp"/>
		   <% } %>
		   
		