<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>e-barber</title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css_docs/firstPage.css">
		<link rel="stylesheet" href=<%=request.getContextPath() %>/"https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>	
		<script src="https://kit.fontawesome.com/3781654338.js" crossorigin="anonymous"></script>		
	
		<style>
			body {
				background-image: url("imgs/barberBG1.jpg"); 
				background-size: cover;		
			}
		</style>
	</head>
	<body>
	
		<h1 class="text-center font-weight-lighter" style="color:white; margin-top:5%;"><em>e-barber</em></h1><h3 class="text-center font-weight-lighter" style="color:#6B8E23;">for <b>men</b></h3>
	
		<div class="container" id=dropdown>	
			<div class="dropdown dropup float-right">
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
								<a class="nav-link" data-toggle="tab" href="#breg">Register as a barber</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" data-toggle="tab" href="#creg">Register as a customer</a>
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
									
										
										
									</form>					
								</div>	
							</div>
						</div>	
					</div>
					<!-- Modal footer -->
					<div class="modal-footer justify-content-start">
						<input type="submit" name="submit" id="button" value="Submit" class="btn btn-success"/>
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	
	
		<!--Log In Pop-up-->
		<div class="modal fade" id="LogInModal">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">

				  <!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">Log in</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

				  <!-- Modal body -->
					<div class="container">
						
<!-- <div class="container" role="main">

		<% if(request.getAttribute("message") != null) { %>		
			<div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
		<% } %>

		<form class="form-signin" method="post" action="<%=request.getContextPath() %>/loginController_ex1_b_8170107.jsp">
			<h2 class="form-signin-heading text-center">Please sign in</h2>
			<label for="inputusername" class="sr-only">Username</label> 
			<input type="text" name="username" id="inputusername" class="form-control" placeholder="username" required>
			<label for="inputpassword" class="sr-only">Password</label>
			<input name="password" type="password" id="inputpassword" class="form-control" placeholder="password" required>

			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
		</form>
-->
						
		<form class="form-signin" method="post" action="<%=request.getContextPath() %>/loginController.jsp">	
							
							<div id="clog" class="container tab-pane"><br>
								<div class="modal-body">
									<div class="form-group">			
										<label for="username" class="col-sm-2 control-label text-center">Username </label>
										<div class="col-sm-10">
											<input name="username" type="text" class="form-control" id="username" placeholder="Enter your username">
										</div>
									</div>
									<div class="form-group">
										<label for="password" class="col-sm-2 control-label">Password</label>
										<div class="col-sm-10">
											<input name="password1" type="password" class="form-control" id="password1" placeholder="Enter your password">
										</div>
									</div>
								</div>
							</div>
					
					</div>

					  <!-- Modal footer -->
					<div class="modal-footer justify-content-start">
						<!--<input type="submit" name="submit" id="button" value="Log in" class="btn btn-success" href="CustomerHTML/searchforbarbers.html">-->
						<a class="btn btn-success" href="<%=request.getContextPath() %>/CustomerHTML/searchforbarbers.jsp">Log in</a>
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
		 </form>
				</div>
			</div>
		</div>
	</body>
</html>
