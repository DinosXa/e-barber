<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import= "login_classes.*"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		
		<title>BarbershopPage</title>
		
		<!-- Bootstrap core CSS & JQuery-->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<!-- Custom styles for this template -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/BarbershopPage.css">
		<script src="https://kit.fontawesome.com/3781654338.js" crossorigin="anonymous"></script>
	</head>
	<style>
		body {
			background-image: url("<%=request.getContextPath() %>/ismgroup26/imgs/barberBG1.jpg"); 
			background-size: cover;		
		}
	</style>
	<body>
		<%
		if(request.getAttribute("ifbarber").equals("false")) {
			CustomerUser user = (CustomerUser)session.getAttribute("user");	%>
			<%@ include file="cnavbar.jsp"%>	
						
			<ul class="nav nav-pills nav-justified mb-3" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" id="info-tab" data-toggle="tab" href="#info" role="tab" aria-controls="info" aria-selected="true">Information</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="booktab" data-toggle="tab" href="#book" role="tab" aria-controls="book" aria-selected="false">Book</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="reviewstab" data-toggle="tab" href="#reviews" role="tab" aria-controls="reviews" aria-selected="false">Reviews</a>
				</li>
			</ul>

			<div class="tab-content" id="myTabContent">
				<!-- Info -->
				<div class="tab-pane fade show active" id="info" role="tabpanel" aria-labelledby="info-tab">
					<div class="flex-container">							
						<!-- info_container -->
						<div class="info_container theme-showcase" role="main">
							<!-- Page Title -->
							<div class="page-header">
								<h3>Prices</h3>
							</div>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Service</th>
										<th>Price</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Haircut</td>
										<td>10&#8364</td>
									</tr>
									<tr>
										<td>Shaving</td>
										<td>5&#8364</td>
									</tr>
								</tbody>
							</table>
							
							<div class="page-header">
								<h3>Availability</h3>
							</div>
							<p></p>                 		
							<table class="table table-dark table-hover">
								<thead>
									<tr>
										<th>date</th>
										<th>time</th>
									</tr>
								</thead>
								<tbody>
									<tr>
									
									<td>21/11/2019</td>
									<td>18:00</td>
										</tr>
									</tbody>
							</table>
							<div class="page-header">
								<h3>Phone / Business email / Address</h3>
							</div>
							+2101010101 / barber01@gmail.com / Patision 26, Athens
							<br><br>
							
							<div class="page-header">
								<h3>Photos</h3>
								<img src="<%=request.getContextPath() %>/ismgroup26/imgs/barberProf.jpg" alt="barber" style="width:200px;">
							</div>
						</div>
						<!-- end of info_container -->
					</div>
				</div>
				<!-- Reviews -->
				<div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
					<ul class="flex-container wrap">	
						<li class="re-container fitem">
							<img src="<%=request.getContextPath() %>/ismgroup26/imgs/johnny.jpg" alt="Avatar" style="width:80px">
							<span><b>Chris Fox.</b><br></span>
							<p><small><i>Posted on February 15, 2019</i></small></p><br>
							<em>John Doe saved us from a web disaster.</em><br>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="far fa-star"></i>
							<i class="far fa-star"></i>
						</li>
						<li class="re-container fitem">
							<img src="<%=request.getContextPath() %>/ismgroup26/imgs/johnny.jpg" alt="Avatar" style="width:80px">
							<span><b>Chris Fox.</b><br></span>
							<p><small><i>Posted on February 15, 2019</i></small></p><br>
							<em>John Doe saved us from a web disaster.</em><br>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="far fa-star"></i>
							<i class="far fa-star"></i>
						</li>
						<li class="re-container fitem">
							<img src="<%=request.getContextPath() %>/ismgroup26/imgs/johnny.jpg" alt="Avatar" style="width:80px">
							<span><b>Chris Fox.</b><br></span>
							<p><small><i>Posted on February 15, 2019</i></small></p><br>
							<em>John Doe saved us from a web disaster.</em><br>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="far fa-star"></i>
							<i class="far fa-star"></i>
						</li>
					</ul>
				</div>
			
				<!-- Βοοκ -->
				<div class="tab-pane fade show" id="book" role="tabpanel" aria-labelledby="book-tab">
					<div class="flex-container">

					</div>
				</div>			
			</div>
<% 		}
		if(request.getAttribute("ifbarber").equals("true")){ 
			BarbershopUser user = (BarbershopUser)session.getAttribute("user");%>
			<%@ include file="bnavbar.jsp"%>
				
			<ul class="nav nav-pills nav-justified mb-3" id="myTab" role="tablist">
				<li class="nav-item">
					<a class="nav-link active" id="info-tab" data-toggle="tab" href="#info" role="tab" aria-controls="info" aria-selected="true">Information</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" id="reviews-tab" data-toggle="tab" href="#reviews" role="tab" aria-controls="reviews" aria-selected="false">Reviews</a>
				</li>
			</ul>

			<div class="tab-content" id="myTabContent">
				<!-- Info -->
				<div class="tab-pane fade show active" id="info" role="tabpanel" aria-labelledby="info-tab">
					<div class="flex-container">
						<div class="info_container theme-showcase" role="main">
							<div class="page-header">
								<h3>Prices</h3>
							</div>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>Service</th>
										<th>Price</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>Haircut</td>
										<td>10&#8364</td>
									</tr>
									<tr>
										<td>Shaving</td>
										<td>5&#8364</td>
									</tr>
								</tbody>
							</table>
							
							<div class="page-header">
								<h3>Phone / Business email / Address </h3>
							</div>
							+2101010101 / barber01@gmail.com / Patision 26, Athens
							<br><br>
						
							<div class="page-header">
								<h3>Photos</h3>
								<img src="<%=request.getContextPath() %>/ismgroup26/imgs/barberProf.jpg" alt="barber" style="width:200px;">
							</div>
						</div>
					</div>
				</div>
				
				<!-- Reviews -->
				<div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
					<ul class="flex-container wrap">	
						<li class="re-container fitem">
							<img src="<%=request.getContextPath() %>/ismgroup26/imgs/johnny.jpg" alt="Avatar" style="width:80px">
							<span><b>Chris Fox.</b><br></span>
							<p><small><i>Posted on February 15, 2019</i></small></p><br>
							<em>John Doe saved us from a web disaster.</em><br>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="far fa-star"></i>
							<i class="far fa-star"></i>
							<button type="button" class="btn btn-info btn-rounded">Answer</button>
						</li>
						<li class="re-container fitem">
							<img src="<%=request.getContextPath() %>/ismgroup26/imgs/johnny.jpg" alt="Avatar" style="width:80px">
							<span><b>Chris Fox.</b><br></span>
							<p><small><i>Posted on February 15, 2019</i></small></p><br>
							<em>John Doe saved us from a web disaster.</em><br>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="far fa-star"></i>
							<i class="far fa-star"></i>
							<button type="button" class="btn btn-info btn-rounded">Answer</button>
						</li>
						<li class="re-container fitem">
							<img src="<%=request.getContextPath() %>/ismgroup26/imgs/johnny.jpg" alt="Avatar" style="width:80px">
							<span><b>Chris Fox.</b><br></span>
							<p><small><i>Posted on February 15, 2019</i></small></p><br>
							<em>John Doe saved us from a web disaster.</em><br>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="fas fa-star"></i>
							<i class="far fa-star"></i>
							<i class="far fa-star"></i>
							<button type="button" class="btn btn-info btn-rounded">Answer</button>
						</li>
					</ul>
				</div>			
			</div>		
	<% 	}	%>

		<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/ismgroup26/js/custom.js"></script>
	</body>
</html>

