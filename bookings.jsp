<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import= "login_classes.*"%>
<%@ page import= "java.util.*"%>

<%@ include file="logincheck.jsp"%>
<%@ include file="bcc.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		
		<title>e-barber</title>

		<!-- Bootstrap core CSS & JQuery-->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<!-- Custom styles for this template -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/bookings.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/navbar.css">
		<script src="https://kit.fontawesome.com/3781654338.js" crossorigin="anonymous"></script>
	</head>
	<style>
		body {
			background-image: url("<%=request.getContextPath() %>/ismgroup26/imgs/barberBG1.jpg"); 
			background-size: cover;
			}
		#AccountsBnC{
			margin-right:5%;
			color:black;
			}
	</style>
	<body>
		<% 	BarbershopUser user = (BarbershopUser)session.getAttribute("user");
			forBookings fb = new forBookings();
			List<Booking> bookings = fb.getBookings(user.getBID());
		%>
		<%@ include file="bnavbar.jsp"%>

		<div class="container">
			<div class="jumbotron">
				<h1>Bookings</h1>
			</div>
		<%	if(bookings.size() == 0){	%>
				<p class="display-4 text-center">You do not have any <text style="color:#808000;">bookings</text> yet.</p>
		<%	}else{
				String size = "bookings";
				if(bookings.size() == 1) size = "booking";	%>
				<p class="display-4 text-center">You have <code style="color:#88B04B;"><%=bookings.size()%></code> <%=size%> on total.</p>
		<%		int counter = 0;	%>
				<ul class="book-container">		
		<%		for(Booking booking: bookings) { %>
					<li class="book-item">
						<div class="card" style="width:290px;">
							<img class="card-img-top" src="<%=request.getContextPath() %>/ismgroup26/imgs/johnny.jpg" alt="Card image" style="width:287px; height:230px;">
							<div class="card-body" style="line-height:13px; font-weight:500; font-size:14px;">
								<h4 class="card-title text-capitalize"><%=booking.getCustomer().getName()%> <%=booking.getCustomer().getSurname()%></text></h4>
								<p class="card-text">Telephone: <text style="color:#0000CD;"><%=booking.getCustomer().getPhone()%></text></p>
								<p class="card-text">E-mail: <text style="color:#0000CD;"><%=booking.getCustomer().getEmail()%></text></p>
								<p class="card-text">Day: <text style="color:#0000CD;"><%=booking.getDay()%></text></p>
								<p class="card-text">Time: <text style="color:#0000CD;"><%=booking.getTime()%></text></p>
								<p class="card-text">Service: <text style="color:#0000CD;"><%=booking.getService()%></text></p>
								<p class="card-text">Price: <text style="color:#0000CD;"><%=booking.getPrice()%></text></p>
								<a href="#" class="btn btn-primary">Accept</a>
								<button type="button" class="btn btn-danger">Decline</button>
							</div>
						</div>
					</li>
				<%	}	%>
				</ul>
		<%	}	%>
		</div>

		<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/ismgroup26/js/custom.js"></script>
	</body>
</html>