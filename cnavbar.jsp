<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import= "login_classes.*"%>
	<%	if(session.getAttribute("user") == null){
			request.setAttribute("message", "Your access to this resource is forbidden. Please login.");
		}
		request.setAttribute("ifbarber","false");
	%>
		<!-- Customer Navbar -->
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="#"><em>e-barber</em></a>
			<div class="collapse navbar-collapse" id="navbarTogglerDemo02">
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
					<li class="nav-item" href="<%= (request.getRequestURI().replace(request.getContextPath() + "/","").equals("ismgroup26 index.jsp") ? "active" : "") %>">
						<a class="nav-link" style="color:#6B8E23" href="<%= request.getContextPath() %>/ismgroup26/index.jsp">
							Search
						</a>
					</li>
					
					<li class="nav-item" href="<%= (request.getRequestURI().replace(request.getContextPath() + "/","").equals("ismgroup26myreviews.jsp") ? "active" : "") %>">
						<a class="nav-link" style="color:#6B8E23" href="<%= request.getContextPath() %>/ismgroup26/myreviews.jsp">
							My reviews
						</a>
					</li>		
					<li class="nav-item" href="<%= (request.getRequestURI().replace(request.getContextPath() + "/","").equals("ismgroup26CustomerJSPmyappointments.jsp") ? "active" : "") %>">
						<a class="nav-link" style="color:#6B8E23" href="<%= request.getContextPath() %>/ismgroup26/myappointments.jsp">
							My appointments
						</a>
					</li>
				</ul>
			</div>
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
			<span class="border-0">
				<img src="<%=request.getContextPath() %>/ismgroup26/imgs/customerAv.png" alt="Avatar" class="avatar rounded-circle" style="width:50px; height:50px; border-radius:50px;" data-toggle="tooltip" title="Signed in as <%=user.getUsername() %>">
			</span>			
		</nav>
		<br>				
					
					