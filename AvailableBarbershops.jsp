<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import= "login_classes.*"%>
<%@ page import= "java.util.*"%>

<%	
	if(request.getParameter("area") == null) {
		request.setAttribute("errors", "You have to select an area.");
%>
		<jsp:forward page="index.jsp" />
<%  } %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		
		<title>Results</title>

		<!-- Bootstrap core CSS & JQuery-->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<!-- Custom styles for this template -->	
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/results.css">
		<script src="https://kit.fontawesome.com/3781654338.js" crossorigin="anonymous"></script>	
	</head>
	<style>
		body {
			background-image: url("<%=request.getContextPath() %>/ismgroup26/imgs/barberBG1.jpg"); 
			background-size: cover;		
		}
	</style>
	<body>

		<% 	if(session.getAttribute("user") != null) {	
				CustomerUser user = (CustomerUser)session.getAttribute("user");	%>
				<%@ include file="cnavbar.jsp"%>	
				<%
				BarbershopUserService brbservice = new BarbershopUserService();
				String area_id = request.getParameter("area");
				int id = Integer.parseInt(area_id);
				List<BarbershopUser> busers = brbservice.getBarbershops(id);
				
				if(busers.size() == 0) {
					request.setAttribute("errors", "The are no barbershops at this area yet.");
				%>	<jsp:forward page="index.jsp"/>
			<%	}else{	%>		
					<ul class="container">
						<div class="jumbotron">
							<h1>Ανοιχτά μπαρμπέρικα στην περιοχή "<%=brbservice.convertIntToArea(id)%>": <span class="text-info"><%=busers.size() %></span></h1>
						</div>
					<%	int counter = 0;
						for(BarbershopUser buser: busers) {	%>	
							<li class="flex-item p-3">
								<img src="<%=request.getContextPath() %>/ismgroup26/imgs/barbr.jpg" alt="barbershop" class="mr-3 mt-3 rounded-circle">
								<div class="media-body">
									<h4><%=buser.getUsername()%>  <small><%=buser.getAddress()%></small></h4><br>
									<a class="btn btn-success" style="color:white;"><!--href="cBarbershopPage.html#book"-->Book</a>				
									<a class="btn btn-info" style="color:white;" href="<%=request.getContextPath() %>/ismgroup26/BarbershopPage.jsp?ifbarber2=">More Info</a>
									<a class="btn btn-warning" style="color:white;" href="<%=request.getContextPath() %>/ismgroup26/writereview.jsp">Post a Review</a>
								</div>
							</li><br>
					<%	}	%>
					</ul>
					<!-- /container -->
			<%	}
			}else{
				Areas area = null;
				BarbershopUserService brbservice = new BarbershopUserService();
				String area_id = request.getParameter("area");
				int id = Integer.parseInt(area_id);
				List<BarbershopUser> busers = brbservice.getBarbershops(id);
				
				if(busers.size() == 0) {
					request.setAttribute("errors", "The are no barbershops at this area yet.");
				%>	<jsp:forward page="index.jsp"/>	<%
				}else{
				%>		
					<div class="container">
						<div class="jumbotron">
							<h1>Ανοιχτά μπαρμπέρικα στην περιοχή "<%=brbservice.convertIntToArea(id)%>": <span class="text-info"><%=busers.size() %></span></h1>
						</div>
					<%	int counter = 0;
						for(BarbershopUser buser: busers) {	%>	
							<div class="media border p-3">
								<img src="<%=request.getContextPath() %>/ismgroup26/imgs/barbr.jpg" alt="barbershop" class="mr-3 mt-3 rounded-circle">
								<div class="media-body">
									<h4><%=buser.getUsername()%></h4><br>
									<a class="btn btn-success" style="color:white;"><!--href="cBarbershopPage.html#book"-->Book</a>				
									<a class="btn btn-info" style="color:white;" href="<%=request.getContextPath() %>/ismgroup26/BarbershopPage.jsp#info">More Info</a>
									<a class="btn btn-warning" style="color:white;" href="<%=request.getContextPath() %>/ismgroup26/CustomerJSP/writereview.jsp">Post a Review</a>
								</div>
							</div>
					<%	}	%>
					</div>
					<!-- /container -->

			<%	}	
			}	%>
	</body>
</head>















