<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import= "login_classes.BarbershopUserDAO"%>
<%@ page import= "login_classes.BarbershopUser"%>

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
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/contactwithus.css">
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
		<% 	BarbershopUser user = (BarbershopUser)session.getAttribute("user1");
			if((user == null)) {
				request.setAttribute("message", "Your access to this resource is forbidden. Please login.");
		%>
				<jsp:forward page = "../index.jsp"/>
			<% } else { %>
		<!-- Navbar -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="#"><em>e-barber</em></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0">	
					<li class="nav-item">
						<a class="nav-link" href="<%=request.getContextPath() %>/ismgroup26/BarbershopPage.jsp">My Barbershop<a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="<%=request.getContextPath() %>/ismgroup26/BarberJSP/bookings.jsp">Bookings</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="<%=request.getContextPath() %>/ismgroup26/BarberJSP/availability.jsp">Availability</a>
					</li>							
					<li class="nav-item">
						<a class="nav-link active" href="<%=request.getContextPath() %>/ismgroup26/BarberJSP/contactwithus.jsp">Help</a>
					</li>		
				</ul>
				<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
					
				</nav>
				
				<!-- Account Option on Navbar + Avatars -->
				<div id=AccountsBnC>
					<form class="form-inline my-2 my-lg-0">
						<div class="nav-item dropdown">
							<div class="border" style="border-radius:0px;">
								<a class="nav-link dropdown-toggle text-white bg-dark" href="#" id="navbarDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
								  Accounts
								</a>
								<div class="dropdown-menu" aria-labelledby="navbarDropdown">								
									<a class="dropdown-item" href="<%=request.getContextPath() %>/ismgroup26/Logout.jsp">
										<span class="border-0">
											<img src="<%=request.getContextPath() %>/ismgroup26/imgs/logoutAv.jpg" alt="Avatar" class="avatar rounded-circle" style="width:25px; height:25px; border-radius:25px;"> Log out
										</span>
									</a>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<span class="border-0">
				<img src="<%=request.getContextPath() %>/ismgroup26/imgs/bpoleAv.jpg" alt="Avatar" class="avatar rounded-circle" style="width:50px; height:50px; border-radius:50px;" data-toggle="tooltip" title="Signed in as a barber">
			</span>	
		</nav>
		<br>

		<div class="contact_container theme-showcase" role="main">
			<div class="container">
				<form action="action_page.php">
					<label for="Busername">Username</label>
					<input type="text" id="Busername" name="Busername" placeholder="Your barbershop..">
					<label for="address">Address</label>
					<input type="text" id="address" name="address" placeholder="Your address..">
					<label for="area">Area</label>
					<select id="area" name="area">
						<optgroup label="Αθήνα">
							<option value="" disabled selected hidden>-- Select your barbershop's location --</option>
							<option value="ilisia">Ιλίσια</option>
							<option value="kentro">Κέντρο</option>
							<option value="kolonaki">Κολωνάκι-Λυκαβηττός</option>
							<option value="kolonos">Κολωνός</option>
							<option value="koukaki">Κουκάκι</option>
							<option value="kypseli">Κυψέλη</option>
							<option value="mets">Καλλιμάρμαρο-Μετς</option>
							<option value="neoskosmos">Νέος Κόσμος</option>
							<option value="pagkrati">Παγκράτι</option>
							<option value="anopatisia">Άνω Πατήσια</option>
							<option value="katopatisia">Κάτω Πατήσια</option>
							<option value="petralona">Πετράλωνα</option>
							<option value="polygono">Πολύγωνο</option>
							<option value="sepolia">Σεπόλια</option>
						</optgroup>
					</select>
					<br>
					<label for="subject">Subject</label>
					<textarea id="subject" name="subject" placeholder="Explain the problem..." style="height:200px"></textarea>
					<input type="submit" value="Submit">
				</form>
			</div> 
		</div>
		<!-- End of container -->	

		<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>	
		<!-- Bootstrap core JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/ismgroup26/js/custom.js"></script>		
			<% } %>
	</body>
</html>