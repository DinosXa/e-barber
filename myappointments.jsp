<!-- t8170101 (κατανόηση όλων) -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import= "login_classes.*"%>
<%@ page import= "java.util.*, java.text.*, java.time.format.*, java.time.*"%>

<%@ include file="logincheck.jsp"%>
<%@ include file="ccc.jsp"%>
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
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/menu2.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/navbar.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/cards.css">
	</head>
	<style>
		body {
			background-image: url("<%=request.getContextPath() %>/ismgroup26/imgs/barberBG1.jpg"); 
			background-size: cover;		
		}
	</style>	
	<body>
	<%	CustomerUser user = (CustomerUser)session.getAttribute("user");
		forBookings fb = new forBookings();
		List<Booking> bookings = fb.getBookingsForCustomer(user.getCID());		
	%>
		<%@ include file="cnavbar.jsp"%>

		<div class="container theme-showcase" role="main">
			<div class="jumbotron">
				<h1>My appointments</h1>
			</div>
		<%	if(bookings.size() == 0){	%>
				<p class="display-4 text-center">You have not made any <text style="color:#808000;">bookings</text> yet.</p>			
		<%	}else{
				String size = "bookings";
				if(bookings.size() == 1) size = "booking";
				int counter = 0;	%>			
				<ul class="appointments-container">
		<%		
					SimpleDateFormat dtf = new SimpleDateFormat("dd-MM-yyyy HH:mm"); //dtf = DateTime Formatter		
				
					//get current local datetime as Date
					DateTimeFormatter cdtf = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");  
					LocalDateTime now = LocalDateTime.now();
					String currentDatetime = cdtf.format(now);
					Date cdt = dtf.parse(currentDatetime); //covert string-type currentDaytime to date-type currentDaytime \ cdt = Current DateTime
		
					for(Booking booking: bookings) {
						//get book datetime as Date
						String bookDatetime = booking.getDay() + " " + booking.getTime().substring(6,11); //Combining day & time
						Date bdt = dtf.parse(bookDatetime); //covert string-type bookDaytime to date-type bookDaytime \ bdt = Book DateTime
						
						//Difference of hours						
						if(cdt.compareTo(bdt) < 0)	{
							long diff = bdt.getTime() - cdt.getTime();
							int diffHours = (int) (diff / (60 * 60 * 1000)); //difference in hours
							int diffMin = (int) (diff / (60 * 1000)); //difference in minutes	
							
							int difference = diffHours;
							String timeLeft = "hours";
							if (diffHours < 1)	{
								difference = diffMin;
								timeLeft = "minutes";
							}%>
							<li class="a-item">
								<div class="card" style="width:250px;">
									<div class="img-container">
										<img class="card-img-top mx-auto d-block" src="<%=request.getContextPath() %>/ismgroup26/imgs/bpoleAv.jpg" alt="Card image" style="width:248.5px; height:200px;">
										<div class="middle">
											<h2 class="text"><%=booking.getBarbershop().getUsername()%><br><b style="font-size:19px;"><%=difference%> <%=timeLeft%></b></h2>
										</div>
									</div>
									<div class="card-body" style="line-height:13px; font-weight:450; font-size:13px;">
										<p class="card-text">Telephone: <text style="color:#0000CD;"><%=booking.getBarbershop().getPhone()%></text></p>
										<p class="card-text">E-mail: <text style="color:#0000CD;"><%=booking.getBarbershop().getEmail()%></text></p>
										<p class="card-text">Day: <text style="color:#0000CD;"><%=booking.getDay()%></text></p>
										<p class="card-text">Time: <text style="color:#0000CD;"><%=booking.getTime()%></text></p>
										<p class="card-text">Service: <text style="color:#0000CD; font-size:12px;"><%=booking.getService()%></text></p>
										<p class="card-text">Price: <text style="color:#0000CD;"><%=booking.getPrice()%></text></p>
										<a href="<%=request.getContextPath() %>/ismgroup26/BarbershopPage.jsp?bid=<%=booking.getBarbershop().getBID()%>&active=info" class="btn btn-primary">Go to barbershop</a>
									</div>
								</div>
							</li>
					<%	}else{	%>
							<li class="a-item">
								<div class="card" style="width:250px; border-color:red; border-style:ridge; border-width:4px;">
									<div class="img-container finished1">										
										<img class="card-img-top mx-auto d-block" src="<%=request.getContextPath() %>/ismgroup26/imgs/bpoleAv.jpg" alt="Card image" style="width:242px; height:200px;">
										<div class="middle finished2">
											<h2 class="text"><text style="color:black;"><%=booking.getBarbershop().getUsername()%></text> <b style="color:white;">FINISHED</b></h2>
										</div>
									</div>
									<div class="card-body" style="line-height:13px; font-weight:450; font-size:13px;">
										<p class="card-text">Telephone: <text style="color:#0000CD;"><%=booking.getBarbershop().getPhone()%></text></p>
										<p class="card-text">E-mail: <text style="color:#0000CD;"><%=booking.getBarbershop().getEmail()%></text></p>
										<p class="card-text">Day: <text style="color:#0000CD;"><%=booking.getDay()%></text></p>
										<p class="card-text">Time: <text style="color:#0000CD;"><%=booking.getTime()%></text></p>
										<p class="card-text">Service: <text style="color:#0000CD;"><%=booking.getService()%></text></p>
										<p class="card-text">Price: <text style="color:#0000CD;"><%=booking.getPrice()%></text></p>
										<a href="<%=request.getContextPath() %>/ismgroup26/BarbershopPage.jsp?bid=<%=booking.getBarbershop().getBID()%>&active=info" type="button" class="btn btn-primary">Go to barbershop</a>
									</div>
								</div>
							</li>
					<%	}
					}	%>
				</ul> 
		<%	}	%>
		</div>
		
		<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/ismgroup26/js/custom.js"></script>
	</body>
</html>

