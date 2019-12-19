<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>

		
		<% 	
			if(request.getAttribute("ifbarber").equals("false")) {
				CustomerUser user = (CustomerUser)session.getAttribute("user");
			}else{
		%>		<jsp:forward page="index.jsp"/>
		<%	}
			if(request.getAttribute("ifbarber").equals("true")) {
				BarbershopUser user = (BarbershopUser)session.getAttribute("user");
			}else{
		%>		<jsp:forward page="index.jsp"/>		
		<%}

			if(session.getAttribute("user") == null){
				request.setAttribute("message", "Your access to this resource is forbidden. Please login.");
		%>		<jsp:forward page="index.jsp"/>
		<%	}	%>
		
		<% 	
			if(request.getAttribute("ifbarber").equals("false")) {
				CustomerUser user = (CustomerUser)session.getAttribute("user");
			%>
				<!-- Customer Navbar -->
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
					<br>
		<%		
			}
			if(request.getAttribute("ifbarber").equals("true")) {
				BarbershopUser user = (BarbershopUser)session.getAttribute("user");
		%>
				<!-- Barber Navbar -->
				<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
					<a class="navbar-brand" href="#"><em>e-barber</em></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
						<ul class="navbar-nav mr-auto mt-2 mt-lg-0">	
							<li class="nav-item active">
								<a class="nav-link" href="<%=request.getContextPath() %>/ismgroup26/BarbershopPage.jsp">My Barbershop<a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="<%=request.getContextPath() %>/ismgroup26/BarberJSP/bookings.jsp">Bookings</a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="<%=request.getContextPath() %>/ismgroup26/BarberJSP/availability.jsp">Availability</a>
							</li>							
							<li class="nav-item">
								<a class="nav-link" href="<%=request.getContextPath() %>/ismgroup26/BarberJSP/contactwithus.jsp">Help</a>
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
		<%	}	%>
			