<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import= "login_classes.*"%>
<%@ page import= "java.util.*"%>
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
		<% 	
		AreaSearch areaSearch = new AreaSearch();
		List<Areas> areas = areaSearch.getAreas();

		if(request.getAttribute("logged") == null){
			
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
			<form method="POST" action="<%=request.getContextPath() %>/AvailableBarbershops.jsp">
			<div class="search-box">
				<select class="form-control" name="area" id="area" required>
					<optgroup label="Αθήνα">
						<option value="" disabled selected hidden> Select your area </option>
						<% for(Areas ar:areas) { %>
							<option value="<%=ar.getId() %>"><%=ar.getName() %></option>
						<% } %>
					</optgroup>
				</select>
				<a class="search-btn" href="">
					<i class="fas fa-search-location" style="color:#6B8E23"></i>
				</a>
			</div>
			</form>
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
									<form class="form-horizontal" method="POST" action="<%=request.getContextPath() %>/ismgroup26/registerController.jsp?barber=true">					
										<%
										if(request.getAttribute("bregister-message") != null) { %>
											<div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
										<% 	}	%>						
										<div class="form-group">			
											<label for="name" class="col-sm-2 control-label">Username </label>
										<div class="col-sm-10">
											<input name="busername" type="text" class="form-control" id="bname" placeholder="Enter your barbershop's name">
										</div>
										</div>
										<div class="form-group">
											<label for="password" class="col-sm-2 control-label">Password</label>
											<div class="col-sm-10">
												<input name="password" type="password" class="form-control" id="bpassword" placeholder="Enter your password">
											</div>
										</div>
										<div class="form-group">
											<label for="email" class="col-sm-2 control-label">E-mail</label>
											<div class="col-sm-10">
												<input name="bemail" type="email" class="form-control" id="bemail" placeholder="Enter your email">
											</div>
										</div>	
										<div class="form-group">
											<label for="phone" class="col-sm-2 control-label">Phone</label>
											<div class="col-sm-10">
												<input name="bphone" type="text" class="form-control" id="bphone" placeholder="Enter your phone">
											</div>
										</div>
										<div class="form-group">
											<label for="address" class="col-sm-2 control-label">Address</label>
											<div class="col-sm-10">
												<input name="address" type="text" class="form-control" id="baddress" placeholder="Enter your address">
											</div>
										</div>
										<div class="form-group">
										  <label for="area" class="col-sm-2 control-label" >Area</label>
											<div class="col-sm-10">
												<select class="form-control" name="area" id="area" required>
													<optgroup label="Αθήνα">
														<option value="" disabled selected hidden>-- Select your location --</option>
														<% for(Areas ar:areas) { %>
															<option value="<%=ar.getId() %>"><%=ar.getName() %></option>
														<% } %>
													</optgroup>
												</select>
											</div>
										</div>
										<div class="col-sm-10">
											<input type="submit" class="btn btn-success" value="Register" />
											<input type="reset" class="btn btn-danger"  value="Clear" />
										</div>
									</form>	
								</div>
							</div>
							<div id="creg" class="container tab-pane"><br>	
								<div class="modal-body">			
									<form class="form-horizontal" method="POST" action="<%=request.getContextPath() %>/ismgroup26/registerController.jsp?barber=false">
										<%
										if(request.getAttribute("cregister-message") != null) { %>
											<div class="alert alert-danger text-center" role="alert">error: <%=(String)request.getAttribute("message") %></div>
										<% 	}	%>		
										<div class="form-group">
											<label for="Cusername" class="col-sm-2 control-label">Username</label>
											<div class="col-sm-10">
												<input name="username" type="text" class="form-control" id="cusername" placeholder="Enter your username" >
											</div>
										</div>
										<div class="form-group">
											<label for="Cpassword" class="col-sm-2 control-label">Password</label>
											<div class="col-sm-10">
												<input name="password" type="password" class="form-control" id="cpassword" placeholder="Enter your password" >
											</div>
										</div>
										<div class="form-group">
											<label for="Cname" class="col-sm-2 control-label">Name</label>
											<div class="col-sm-10">
												<input name="name" type="text" class="form-control" id="cname" placeholder="Enter your name" >
											</div>
										</div>
										<div class="form-group">
											<label for="Csurname" class="col-sm-2 control-label">Surname</label>
											<div class="col-sm-10">
												<input name="surname" type="text" class="form-control" id="csurname" placeholder="Enter your surname" >
											</div>
										</div>		
										<div class="form-group">
											<label for="Cemail" class="col-sm-2 control-label">E-mail</label>
											<div class="col-sm-10">
												<input name="email" type="email" class="form-control" id="cemail" placeholder="Enter your email" >
											</div>
										</div>
										<div class="form-group">
											<label for="Cphone" class="col-sm-2 control-label">Phone</label>
											<div class="col-sm-10">
												<input name="phone" type="text" class="form-control" id="cphone" placeholder="Enter your phone">
											</div>
										</div>
										<div class="col-sm-10">
											<input type="submit" class="btn btn-success" value="Register" />
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
						<form class="form-signin" method="POST" action="<%=request.getContextPath() %>/ismgroup26/loginController.jsp">		
							<div id="clog" class="container tab-pane"><br>
								<div class="modal-body">
								<%
								if(request.getAttribute("message") != null) { %>
									<div class="alert alert-danger text-center" role="alert">error: <%=(String)request.getAttribute("message") %></div>
								<% 	}	%>
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
									</div>
									<div class="form-group col-sm-10">
										<label class="form-check-label col-sm-10">
											<input name="ifbarber" type="checkbox" class="form-check-input" value="true">I am a barber
										</label>
									</div>
									<div class="col-sm-10">
										<button type="submit" class="btn btn-success">Log in</button>
										<input type="reset" class="btn btn-danger" value="Clear" />
									</div>
								</div>	
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<% }else{
				
				if((request.getAttribute("ifbarber")).equals("true")) {
					BarbershopUser user = (BarbershopUser)session.getAttribute("user");
		%>			<jsp:forward page="BarbershopPage.jsp"/>
				<%
				}
				if((request.getAttribute("ifbarber")).equals("false")){
					CustomerUser user = (CustomerUser)session.getAttribute("user");
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
							<img src="<%=request.getContextPath() %>/ismgroup26/imgs/customerAv.png" alt="Avatar" class="avatar rounded-circle" style="width:50px; height:50px; border-radius:50px;" data-toggle="tooltip" title="Signed in as a <%=user.getUsername()%>">
						</span>	
					</nav>
					<!-- Search bar -->
					<form method="POST" action="<%=request.getContextPath() %>/AvailableBarbershops.jsp">
						<h1 class="text-center font-weight-lighter" style="color:white; margin-top:5%;">Hello <em style="color:#88B04B;"><%=user.getName().replace("s","")%></em></h1>	
						<div class="search-box">
							<input class="search-txt" type="text" name="" placeholder="Search for barbers in an area">
							<a class="search-btn" href="<%=request.getContextPath() %>/ismgroup26/CustomerJSP/results.jsp">
								<i class="fas fa-search-location" style="color:#6B8E23"></i>
							</a>
						</div>	
					</form>
				<!-- End of search bar -->
		<%		}
			}
		%>

		
		<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>	
		<!-- Bootstrap core JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/ismgroup26/js/custom.js"></script>		
	</body>
</html>

