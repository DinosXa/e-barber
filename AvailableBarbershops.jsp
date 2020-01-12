<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import= "login_classes.*"%>
<%@ page import= "java.util.*"%>

<%	
	if(request.getParameter("area") == null) {
		request.setAttribute("messages", "You have to select an area");
		request.setAttribute("indexerror","You have to select an area");
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
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/navbar.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/av_rating.css">
		<script src="https://kit.fontawesome.com/3781654338.js" crossorigin="anonymous"></script>	
	</head>
	<style>
		body {
			background-image: url("<%=request.getContextPath() %>/ismgroup26/imgs/barberBG1.jpg"); 
			background-size: cover;		
		}
	</style>
	<body>
		<% 	if(session.getAttribute("user") != null) {	%>
				<%@ include file="ccc.jsp"%>
				<!-- Available Barbershops for customers -->
			<%	CustomerUser user = (CustomerUser)session.getAttribute("user");	%>
				<%@ include file="cnavbar.jsp"%>	
			<%	BarbershopUserService brbservice = new BarbershopUserService();
				String area_id = request.getParameter("area");
				int id = Integer.parseInt(area_id);
				List<BarbershopUser> busers = brbservice.getBarbershops(id);

				if(busers.size() == 0) {
					request.setAttribute("messages", "The are no barbershops at this area yet");
					request.setAttribute("indexerror", "The are no barbershops at this area yet");					%>	
					<jsp:forward page="index.jsp"/>
			<%	}else{	%>		
					<ul class="container responsive">
						<div class="jumbotron">
							<h1>Available barbershops: <span class="text-info"><%=busers.size()%></span> / <%=brbservice.convertIntToArea(id)%></h1>
						</div>
					<%	int counter = 0;
						for(BarbershopUser buser: busers) {	%>	
							<li class="flex-item">
								<ul class="barber-container responsive">
									<!--<li class="bflex-item">
										<span class="heading">User Rating</span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star"></span>
										<p>4.1 average based on 254 reviews.</p>
										<hr style="border:3px solid #f1f1f1">

										<div class="row">
										  <div class="side">
											<div>5 star</div>
										  </div>
										  <div class="middle">
											<div class="bar-container">
											  <div class="bar-5"></div>
											</div>
										  </div>
										  <div class="side right">
											<div>150</div>
										  </div>
										  <div class="side">
											<div>4 star</div>
										  </div>
										  <div class="middle">
											<div class="bar-container">
											  <div class="bar-4"></div>
											</div>
										  </div>
										  <div class="side right">
											<div>63</div>
										  </div>
										  <div class="side">
											<div>3 star</div>
										  </div>
										  <div class="middle">
											<div class="bar-container">
											  <div class="bar-3"></div>
											</div>
										  </div>
										  <div class="side right">
											<div>15</div>
										  </div>
										  <div class="side">
											<div>2 star</div>
										  </div>
										  <div class="middle">
											<div class="bar-container">
											  <div class="bar-2"></div>
											</div>
										  </div>
										  <div class="side right">
											<div>6</div>
										  </div>
										  <div class="side">
											<div>1 star</div>
										  </div>
										  <div class="middle">
											<div class="bar-container">
											  <div class="bar-1"></div>
											</div>
										  </div>
										  <div class="side right">
											<div>20</div>
										  </div>
										</div>
															
									</li>-->
									<li class="bflex-item" style="flex-grow:3;">
										<dl>
											<dt><h1><%=buser.getUsername()%></h1></dt>
											<dd><%=buser.getAddress()%></dd>
											<dd><%=buser.getPhone()%></dd>
										</dl>
									</li>
									<li class="bflex-item" style="flex-grow:1;">
										<ul class="combine-cont">
											<li class="comb-item">
												<img src="<%=request.getContextPath() %>/ismgroup26/imgs/barbr.jpg" alt="barbershop" class="img-fluid" width="220px"  style="border=5px; border-radius:10px; height:160px;">
											</li>
											<li class="comb-item">
												<ul class="barber-btn-container">
													<li $activetabbook class="btn-item"><a class="btn btn-success" style="color:white;" href="<%=request.getContextPath() %>/ismgroup26/BarbershopPage.jsp?bid=<%=buser.getBID()%>&active=book">Make reservation</a></li>
													<li $activetabinfo class="btn-item"><a class="btn btn-info" style="color:white;" href="<%=request.getContextPath() %>/ismgroup26/BarbershopPage.jsp?bid=<%=buser.getBID()%>&active=info">More information</a></li>
													<li $activetabreview class="btn-item"><a class="btn btn-warning" style="color:white;" href="<%=request.getContextPath() %>/ismgroup26/BarbershopPage.jsp?bid=<%=buser.getBID()%>&active=reviews">Review the barber</a></li>
												</ul>
											</li>
										</ul>
									</li>

								</ul>
							</li>
					<%	}	%>
					</ul>
					<!-- /container -->
			<%	}
			}else{	%>
				<!-- Available Barbershops for guests -->
			<%	Areas area = null;
				BarbershopUserService brbservice = new BarbershopUserService();
				String area_id = request.getParameter("area");
				int id = Integer.parseInt(area_id);
				List<BarbershopUser> busers = brbservice.getBarbershops(id);
				
				if(busers.size() == 0) {
					request.setAttribute("messages", "The are no barbershops at this area yet.");
				%>	<jsp:forward page="index.jsp"/>	<%
				}else{
				%>		
					<ul class="container responsive">
						<div class="jumbotron">
							<h1>Available barbershops: <span class="text-info"><%=busers.size()%></span> / <%=brbservice.convertIntToArea(id)%></h1>
						</div>
						<a type="button" class="btn btn-light btn-block" style="background-color:#8B0000; color:white;" href="<%=request.getContextPath() %>/ismgroup26/index.jsp">Back to menu</a>
					<%	int counter = 0;
						for(BarbershopUser buser: busers) {	%>	
							<li class="flex-item">
								<ul class="barber-container responsive">
									<li class="bflex-item" style="flex-grow:3; align-self:center;">
										<dl>
											<dt><h1><%=buser.getUsername()%></h1></dt>
											<dd><%=buser.getAddress()%></dd>
											<dd><%=buser.getPhone()%></dd>
										</dl>
									</li>
									<li class="bflex-item" style="flex-grow:1;">
										<ul class="combine-cont">
											<li class="comb-item">
												<img src="<%=request.getContextPath() %>/ismgroup26/imgs/barbr.jpg" alt="barbershop" class="img-fluid" width="220px"  style="border=5px; border-radius:10px; height:160px;">
											</li>
											<li class="comb-item">
												<ul class="barber-btn-container">
													<li class="btn-item"><a class="btn btn-success" style="color:white;" href="<%=request.getContextPath() %>/ismgroup26/BarbershopPage.jsp?bid=<%=buser.getBID()%>">Make reservation</a></li>
													<li class="btn-item"><a class="btn btn-info" style="color:white;" href="<%=request.getContextPath() %>/ismgroup26/BarbershopPage.jsp?bid=<%=buser.getBID()%>">More information</a></li>
													<li class="btn-item"><a class="btn btn-warning" style="color:white;" href="<%=request.getContextPath() %>/ismgroup26/BarbershopPage.jsp?bid=<%=buser.getBID()%>">Review the barber</a></li>
												</ul>
											</li>
										</ul>
									</li>
								</ul>
							</li>
					<%	}	%>
					</ul>
					<!-- /container -->

			<%	}	
			}	%>
	
		<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/ismgroup26/js/custom.js"></script>	
	
	</body>
</head>












