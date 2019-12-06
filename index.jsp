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
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/firstPage.css">
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
		%>
			<h1 class="text-center font-weight-lighter" style="color:white; margin-top:5%;"><em>e-barber</em></h1>
			<h3 class="text-center font-weight-lighter" style="color:#6B8E23;">for <b>men</b></h3>
		

				<div class="position dropdown dropup">
					<button type="button" class="btn bg-dark dropdown-toggle" style="color:white;" data-toggle="dropdown">
					Register/Login
					</button>			
					<div class="dropdown-menu">
						<a class="dropdown-item">
							<span class="border-0">		
								<button type="button" class="btn" data-toggle="modal" data-target="#RegisterModal">
									Register
								</button>
							</span>
						</a>
						<a class="dropdown-item">
							<span class="border-0">
								<button type="button" class="btn" data-toggle="modal" data-target="#LogInModal">
									Log In
								</button>										
							</span>
						</a>
					</div>
				</div>

			<div class="search-box">
				<input class="search-txt" type="text" name="" placeholder="Search for barbers in an area">
				<a class="search-btn" href="GuestHTML/gresults.html">
					<i class="fas fa-search-location" style="color:#6B8E23"></i>
				</a>
			</div>
		<!-- Register Pop-up -->
		<div class="modal fade " id="RegisterModal">
			<div class="modal-dialog modal-dialog-centered modal-xl">
				<div class="modal-content">
			  
					<!-- Modal Header -->
					<div class="modal-header text-center">
						<h4 class="modal-title">Register</h4><br>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
				
					<!-- Modal body -->
					<div class="container">
						<ul class="nav nav-tabs nav-justified" role="tablist">
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#breg" aria-selected="false">Register as a barber</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#creg" aria-selected="false">Register as a customer</a>
							</li>
						</ul>

						<div class="tab-content">
							<div id="breg" class="container tab-pane"><br>						
								<div class="modal-body">
									<form class="form-horizontal">					
										<div class="form-group">			
											<label for="Bname" class="col-sm-2 control-label">Username </label>
										<div class="col-sm-10">
											<input name="Bname" type="text" class="form-control" id="Bname" placeholder="Enter your barbershop's name">
										</div>
										</div>
										<div class="form-group">
											<label for="inputBPassword1" class="col-sm-2 control-label">Password</label>
											<div class="col-sm-10">
												<input name="Bpassword1" type="password" class="form-control" id="bpassword1" placeholder="Enter your password">
											</div>
										</div>
										<div class="form-group">
											<label for="Bemail" class="col-sm-2 control-label">E-mail</label>
											<div class="col-sm-10">
												<input name="Bemail" type="email" class="form-control" id="Bemail" placeholder="Enter your email">
											</div>
										</div>
										
										
	
										<div class="form-group">
											<label for="Bphone" class="col-sm-2 control-label">Phone</label>
											<div class="col-sm-10">
												<input name="Bphone" type="integer" class="form-control" id="Bphone" placeholder="Enter your phone">
											</div>
										</div>
										
										
										<div class="form-group">
											<label for="Baddress" class="col-sm-2 control-label">Address</label>
											<div class="col-sm-10">
												<input name="Baddress" type="text" class="form-control" id="Baddress" placeholder="Enter your address">
											</div>
										</div>
										
										<div class="form-group">
										  <label for="Area" class="col-sm-2 control-label" >Area</label>
											<div class="col-sm-10">
												<select class="form-control">
													<optgroup label="Αθήνα">
														<option value="" disabled selected hidden>-- Select your location --</option>
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
											</div>
										</div>
										<div class="col-sm-10">
											<input type="submit" class="btn btn-success" value="Log in" />
											<input type="reset" class="btn btn-danger"  value="Clear" />
										</div>
									</form>	
								</div>
							</div>
							<div id="creg" class="container tab-pane"><br>	
								<div class="modal-body">				
									<form class="form-horizontal">
										<div class="form-group">
											<label for="Cusername" class="col-sm-2 control-label">Username</label>
											<div class="col-sm-10">
												<input name="Cusername" type="name" class="form-control" id="Cusername" placeholder="Enter your username" >
											</div>
										</div>
										<div class="form-group">
											<label for="Cpassword1" class="col-sm-2 control-label">Password</label>
											<div class="col-sm-10">
												<input name="Cpassword" type="password" class="form-control" id="Cpassword" placeholder="Enter your password" >
											</div>
										</div>
										<div class="form-group">
											<label for="Cname" class="col-sm-2 control-label">Name</label>
											<div class="col-sm-10">
												<input name="Cname" type="name" class="form-control" id="Cname" placeholder="Enter your name" >
											</div>
										</div>
										<div class="form-group">
											<label for="Csurname" class="col-sm-2 control-label">Surname</label>
											<div class="col-sm-10">
												<input name="Csurname" type="name" class="form-control" id="Csurname" placeholder="Enter your surname" >
											</div>
										</div>		
										<div class="form-group">
											<label for="Cemail" class="col-sm-2 control-label">E-mail</label>
											<div class="col-sm-10">
												<input name="Cemail" type="email" class="form-control" id="Cemail" placeholder="Enter your email" >
											</div>
										</div>
										<div class="form-group">
											<label for="Cphone" class="col-sm-2 control-label">Phone</label>
											<div class="col-sm-10">
												<input name="Cphone" type="integer" class="form-control" id="Cphone" placeholder="Enter your phone">
											</div>
										</div>
										<div class="col-sm-10">
											<input type="submit" class="btn btn-success" value="Log in" />
											<input type="reset" class="btn btn-danger"  value="Clear" />
										</div>
									</form>					
								</div>	
							</div>
						</div>	
					</div>
				</div>
			</div>
		</div>
	
	
		<!--Log In Pop-up-->
		<div class="modal fade" id="LogInModal" role="dialog">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Log in</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="container">
						<form class="form-signin" method="post" action="<%=request.getContextPath() %>/ismgroup26/loginController.jsp">		
							<div id="clog" class="container tab-pane"><br>
								<div class="modal-body">
								<%
								if(request.getAttribute("message") != null) { %>
									<div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
								<% 	
									}
								%>
									<div class="form-group">			
										<label for="username" class="col-sm-2 control-label text-center">Username </label>
										<div class="col-sm-10">
											<input name="username" type="text" class="form-control" id="username" placeholder="Enter your username" required>
										</div>
									</div>
									<div class="form-group">
										<label for="password" class="col-sm-2 control-label">Password</label>
										<div class="col-sm-10">
											<input name="password" type="password" class="form-control" id="password" placeholder="Enter your password" required>
										</div>
									</div><br>
									<div class="col-sm-10">
										<button type="submit" class="btn btn-success" href="<%=request.getContextPath() %>/ismgroup26/index.jsp">Log in</button>
										<input type="reset" class="btn btn-danger"  value="Clear" />
									</div>
								</div>	
							</div>
						</form>
					</div>>
				</div>
			</div>
		</div>
		<% }else{
			if(user.getBarber() == false) {
		%>
		
			<!-- Navbar -->
			<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
				<a class="navbar-brand" href="#"><em>e-barber</em></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
					<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
						<li class="nav-item active">
							<a class="nav-link" href="<%=request.getContextPath() %>/ismgroup26/index.jsp">Search</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="<%=request.getContextPath() %>/ismgroup26/CustomerJSP/myreviews.jsp">My reviews</a>
						</li>			
						<li class="nav-item">
							<a class="nav-link" href="<%=request.getContextPath() %>/ismgroup26/CustomerJSP/myappointments.jsp">My appointments</a>
						</li>
					</ul>

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
					<img src="<%=request.getContextPath() %>/ismgroup26/imgs/customerAv.png" alt="Avatar" class="avatar rounded-circle" style="width:50px; height:50px; border-radius:50px;" data-toggle="tooltip" title="Signed in as a customer">
				</span>	
			</nav>
			<!-- Search bar -->
			<h1 class="text-center font-weight-lighter" style="color:white; margin-top:5%;">Hello <em style="color:#88B04B;"><%=user.getName() %></em></h1>	
			<div class="search-box">
				<input class="search-txt" type="text" name="" placeholder="Search for barbers in an area">
				<a class="search-btn" href="<%=request.getContextPath() %>/ismgroup26/CustomerJSP/results.jsp">
					<i class="fas fa-search-location" style="color:#6B8E23"></i>
				</a>
			</div>	
			<!-- End of search bar -->
			
		<% }else{ %>
			<jsp:forward page = "BarbershopPage.jsp"/>
		<% }
		} %>

		
		<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>	
		<!-- Bootstrap core JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/ismgroup26/js/custom.js"></script>		
	</body>
</html>

