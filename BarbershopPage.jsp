<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import= "login_classes.*"%>
<%@ page import= "java.util.*"%>
<%
	if(session.getAttribute("user") == null) {
		request.setAttribute("messages", "To access this page you must first register");
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
		
		<title>BarbershopPage</title>
		
		<!-- Bootstrap core CSS & JQuery-->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<!-- Custom styles for this template -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/BarbershopPage.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/navbar.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/rating.css">		
		<script src="https://kit.fontawesome.com/3781654338.js" crossorigin="anonymous"></script>
	</head>
	<style>
		body {
			background-image: url("<%=request.getContextPath() %>/ismgroup26/imgs/barberBG1.jpg"); 
			background-size: cover;		
		}
	</style>
	<body>
	
<%	BarbershopUserService brbservice = new BarbershopUserService();
	
	if(session.getAttribute("user").getClass() == CustomerUser.class){	
		String bid = request.getParameter("bid");
		if(bid == null)
			request.setAttribute("indexerror","You have to select an area.");
		
		CustomerUser user = (CustomerUser)session.getAttribute("user");	%>
	<%@ include file="cnavbar.jsp"%>			
	<%	BarbershopUser buser = brbservice.findBarberByID(bid);
		String areaname = buser.getArea().getName();
		if(buser == null){
			request.setAttribute("indexerror","No barbers found at " + areaname);%>
			<jsp:forward page="index.jsp"/>
	<%	}	
		int intbid = Integer.parseInt(bid);
		forReviews fr = new forReviews();
		List<Review> reviews = fr.getReviews(intbid);
	%>

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
						<h1 class="display-3" style="text-align:center;"><code style="color:#6B8E23;"><%=buser.getUsername()%></code></h1>
						<!--Price-->
						<h4 style="text-align:center;">Prices</h4>
						<table class="table table-hover table-bordered table-responsive-sm">
							<thead class="thead-dark">
								<tr>
									<th style="width:50%">Services</th>
									<th>Under 18</th>
									<th>Man</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Haircut</td>
									<td>7 €</td>
									<td>10 €</td>
								</tr>
								<tr>
									<td>Shaving</td>
									<td>5 €</td>
									<td>7 €</td>
								</tr>
								<tr>
									<td>Trimming</td>
									<td>3 €</td>
									<td>5 €</td>
								</tr>
								<tr>
									<td>Haircut + Shaving<span class="badge badge-success" style="background-color:#6B8E23;">Best deal</span></td>
									<td>10 €</td>
									<td>14 €</td>
								</tr>
								<tr>
									<td>Haircut + Trimming</td>
									<td>8 €</td>
									<td>12 €</td>
								</tr>
							</tbody>
						</table><br>
						<!--Contact info-->
						<h4 style="text-align:center;">Contact info</h4>            		
						<table class="table table-hover table-bordered">
							<thead class="thead-dark">
								<tr>
									<th>Phone</th>
									<th>Business email</th>
									<th>Address</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>+<%=buser.getPhone()%></td>
									<td><%=buser.getEmail()%></td>
									<td><%=buser.getAddress()%></td>
								</tr>
							</tbody>
						</table><br>
						<div class="page-header">
							<h3>Photos</h3>
						</div>
						<img src="<%=request.getContextPath() %>/ismgroup26/imgs/barberProf.jpg" alt="barber" style="width:200px;">
					</div>
					<!-- end of info_container -->
				</div>
			</div>
			<!-- Reviews -->
			<div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
			
				<ul class="flex-container">
					<li class="re-container">
						<form action="<%=request.getContextPath() %>/ismgroup26/reviewController.jsp?">	
							<ul class="inside-cont">
								<li class="idrr">
									<ul class="ii-cont text-center">
										<li class="ii-item ii-img">
											<img src="<%=request.getContextPath() %>/ismgroup26/imgs/johnny.jpg" alt="Avatar" data-toggle="tooltip" title="<%=user.getUsername() %>">
											<img src="<%=request.getContextPath() %>/ismgroup26/imgs/bpoleAv.jpg" style="height:80px;" alt="Avatar" data-toggle="tooltip" title="<%=buser.getUsername() %>">
										</li>
			
									</ul>
								</li>
								<li class="idrr">
									<div class="form-group text-center">
										<small><label for="usr">Post your review for <%=buser.getUsername()%></label></small>
										<input name="comment" type="text" class="form-control form-control-sm form-control-plaintext text-center" style="color:#0c1a00;" id="comment" maxlength="50" size="33" placeholder="..."/>
									</div>								
								</li>
								<li class="idrr">
									<div class="slidecontainer">
									  <input type="range" min="1" max="5" value="2.5" name="rate" class="slider" id="myRange">
									  <p class="text-center"><sup><span id="demo"></span>-star rating</sup></p>
									</div>
								</li>
								<li class="iddr">
									<button type="submit" class="btn btn-dark btn-sm btn-block">Post</button>
								</li>
								<input type="hidden" name="bid" value="<%=buser.getBID()%>"/>
								<input type="hidden" name="cid" value="<%=user.getCID()%>"/>
							</ul>
						</form>
					</li>
				<%	if(reviews == null){%>
						<h2 class="color:white"><em>No reviews yet. Post the first review!</em><h2>
				<%	}else{
						int counter = 0;
						for(Review review: reviews) {	%>						
						<li class="re-container fitem">
							<ul class="inside-cont">
								<li class="idrr">
									<ul class="ii-cont text-center">
										<li class="ii-item">
											<img src="<%=request.getContextPath() %>/ismgroup26/imgs/johnny.jpg" alt="Avatar">
										</li>
										<li class="ii-item">
											<span><b>1234567890123456789012345.</b></span>
											<p><small>Posted on "dd/mm/yyyy"</small></p>
										</li>
									</ul>
								</li>
								<li class="idrr">
									<em style="background:#5c5c8a;"><%=review.getReview()%></em>
								</li>
								<li class="idrr">
									<%
									int stars = review.getRating();
									if(stars == 1){%>
										<i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
									<%}else if(stars == 2){%>
										<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
									<%}else if(stars == 3){%>
										<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
									<%}else if(stars == 4){%>
										<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>
									<%}else{%>
										<i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
									<%}%>
								</li>
							</ul>
						</li>			
					<%	}	%>
				</ul>
				<%	}	%>
			</div>
			<!-- Βοοκ -->
			<div class="tab-pane fade show" id="book" role="tabpanel" aria-labelledby="book-tab">
				<div class="flex-container">
					



				</div>
			</div>			
		</div>
<%	}
	if(session.getAttribute("user").getClass() == BarbershopUser.class){			
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
					<!-- info_container -->
					<div class="info_container theme-showcase" role="main">
						<h1 class="display-3" style="text-align:center;"><code style="color:#6B8E23;"><%=user.getUsername()%></code></h1>
						<!--Price-->
						<h4 style="text-align:center;">Prices</h4>
						<table class="table table-hover table-bordered table-responsive-sm">
							<thead class="thead-dark">
								<tr>
									<th style="width:50%">Services</th>
									<th>Under 18</th>
									<th>Man</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Haircut</td>
									<td>7 €</td>
									<td>10 €</td>
								</tr>
								<tr>
									<td>Shaving</td>
									<td>5 €</td>
									<td>7 €</td>
								</tr>
								<tr>
									<td>Trimming</td>
									<td>3 €</td>
									<td>5 €</td>
								</tr>
								<tr>
									<td>Haircut + Shaving<span class="badge badge-success" style="background-color:#6B8E23;">Best deal</span></td>
									<td>10 €</td>
									<td>14 €</td>
								</tr>
								<tr>
									<td>Haircut + Trimming</td>
									<td>8 €</td>
									<td>12 €</td>
								</tr>
							</tbody>
						</table><br>
						<!--Contact info-->
						<h4 style="text-align:center;">Contact info</h4>            		
						<table class="table table-hover table-bordered">
							<thead class="thead-dark">
								<tr>
									<th>Phone</th>
									<th>Business email</th>
									<th>Address</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>+<%=user.getPhone()%></td>
									<td><%=user.getEmail()%></td>
									<td><%=user.getAddress()%></td>
								</tr>
							</tbody>
						</table><br>
						<h4 style="text-align:center;">Photos</h4>
						<img src="<%=request.getContextPath() %>/ismgroup26/imgs/barberProf.jpg" alt="barber" style="width:200px;">
					</div>
					<!-- end of info container -->
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

<script>
var slider = document.getElementById("myRange");
var output = document.getElementById("demo");
output.innerHTML = slider.value;

slider.oninput = function() {
  output.innerHTML = this.value;
}
</script>
