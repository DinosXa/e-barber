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
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/navbar.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/gifs.css">
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

		<%	AreaSearch areaSearch = new AreaSearch();
			List<Areas> areas = areaSearch.getAreas();

			if(session.getAttribute("user") == null){
		%>
				<%	if(request.getAttribute("messages") != null) { %>
						<div class="alert alert-danger text-center allert-dismissible fade show errormsg" role="alert"><%=(String)request.getAttribute("messages") %>
							<button type="button" class="close" data-dismiss="alert">&times;</button>
						</div>
				<% 	}	
				if(request.getAttribute("success") != null) {	%>
					<div class="alert alert-success text-center errormsg alert-dismisible fade show" role="alert"><%=(String)request.getAttribute("success") %>
						<!--<button type="button" class="close" data-dismiss="alert">&times;</button>			-->
					</div>
					<img class="gif-congrats" src="https://media.giphy.com/media/f6DrLe7roeIRnNjhfI/giphy.gif"></img>
			<%	}	%>
					<!--Index Gif -->
					<img style="width:50px;" class="gif-index" src="https://media.giphy.com/media/dC3oDqOspb8mriSZk7/giphy.gif"></img>
					
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

					<form action="<%=request.getContextPath() %>/ismgroup26/AvailableBarbershops.jsp">
						<div class="search-box">
							<div class="input-group">
								<button class="search-btn" href="">
									<i class="fas fa-search-location" style="color:#6B8E23"></i>
								</button>
								<select class="form-control" name="area" id="area" required>
									<optgroup label="Αθήνα">
										<option value="" disabled selected hidden> Select your area </option>
										<% for(Areas ar:areas) { %>
											<option value="<%=ar.getId() %>"><%=ar.getName() %></option>
										<% } %>
									</optgroup>
								</select>
							</div>
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
												<%	if(request.getAttribute("bregister-message") != null) { %>
														<div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("bregister-message") %></div>
													<% 	}	%>						
													<div class="form-group">			
														<label for="name" class="col-sm-2 control-label">Username </label>
													<div class="col-sm-10">
														<input name="username" type="text" class="form-control" id="bname" placeholder="Enter your barbershop's name">
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
															<input name="email" type="email" class="form-control" id="bemail" placeholder="Enter your email">
														</div>
													</div>
													<div class="form-group">
														<label for="phone" class="col-sm-2 control-label">Phone</label>
														<div class="col-sm-10">
															<input name="phone" type="text" class="form-control" id="bphone" placeholder="Enter your phone">
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
														<% if(request.getAttribute("rbError") != null) { %>
															<button type="button" class="errorb btn btn-warning" data-toggle="errorb" data-placement="right" title="Insuficcient inputs" data-content="<%=(String)request.getAttribute("rbError") %>">Insuficcient input</button>
														<% 	}	%>
													</div>
												</form>	
											</div>
										</div>
										<div id="creg" class="container tab-pane"><br>	
											<div class="modal-body">			
												<form class="form-horizontal" method="POST" action="<%=request.getContextPath() %>/ismgroup26/registerController.jsp?barber=false">
													<%
													if(request.getAttribute("cregister-message") != null) { %>
														<div class="alert alert-danger text-center" role="alert">error: <%=(String)request.getAttribute("cregister-message") %></div>
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
														<% if(request.getAttribute("rcError") != null) { %>
															<button type="button" class="errorc btn btn-warning">Insuficcient</button>
														<% 	}	%>
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
												<div class="form-group custom-control custom-switch col-sm-10">
													<input name="ifbarber2" id="ifbarber2" type="checkbox" class="form-check-input custom-control-input" value="true">
													<label for="ifbarber2" class="form-check-label custom-control-label">I am a barber</label>
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
	<%		}else{	%>
			<%@	include file="ccc.jsp"%>	
			<%	CustomerUser user = (CustomerUser)session.getAttribute("user");%>
			<%@	include file="cnavbar.jsp"%>
				<h1 class="text-center font-weight-lighter" style="color:white; margin-top:5%;">Hello <em class="text-capitalize" style="color:#88B04B;"><%=user.getName()%></em></h1>
				<!-- Search bar -->
				<form method="POST" action="<%=request.getContextPath() %>/ismgroup26/AvailableBarbershops.jsp">
					<div class="search-box">
						<div class="input-group">
							<button class="search-btn" href="">
								<i class="fas fa-search-location" style="color:#6B8E23"></i>
							</button>
							<select class="form-control" name="area" id="area" required>
								<optgroup label="Αθήνα">
									<option value="" disabled selected hidden> Select your area </option>
									<% for(Areas ar:areas) { %>
										<option value="<%=ar.getId() %>"><%=ar.getName() %></option>
									<% } %>
								</optgroup>
							</select>
						</div>
					</div>
				</form>
				<!-- End of search bar -->
			<%	if(request.getAttribute("indexerror") != null) { %>
					<div class="alert alert-danger errormsg" style="" role="alert"><%=(String)request.getAttribute("indexerror") %></div>
			<% 	}
				if(request.getAttribute("success") != null) { %>
					<div class="alert alert-success text-center errormsg alert-dismisible fade show" role="alert"><%=(String)request.getAttribute("success") %>
						<button type="button" class="close" data-dismiss="alert">&times;</button>			
					</div>
					<img class="gif-congrats" src="https://media.giphy.com/media/JTW1eFMgGbuNmlbEwZ/giphy.gif"></img>	
			<!--	<img class="gif-congrats2" style="width:15%; height:20%;" src="https://media.giphy.com/media/ZFcZaNW9YMKDjR7gCe/giphy.gif | https://media.giphy.com/media/xT8qBepJQzUjXpeWU8/giphy.gif"></img>-->
			<%	}
			}	%>
		<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/ismgroup26/js/custom.js"></script>
	</body>
</html>
<script>
$(document).ready(function(){
  $('.errorb').popover({title: "Wrong barbershop inputs", content: "<%=request.getAttribute("rbError")%>", trigger:"focus", html: true, placement: "right"});
});
$(document).ready(function(){
  $('.errorc').popover({title: "Wrong customer inputs", content: "<%=request.getAttribute("rcError")%>", trigger:"focus", html: true, placement: "right"});
});
</script>