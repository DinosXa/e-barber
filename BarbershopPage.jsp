<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import= "login_classes.*"%>
<%@ page import= "java.util.*, java.text.*, java.time.format.*, java.time.*"%>
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
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/booking.css">		
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
				<a class="nav-link" id="book-tab" data-toggle="tab" href="#book" role="tab" aria-controls="book" aria-selected="false">Book</a>
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
						<h1 class="display-3" style="text-align:center;"><code style="color:#6B8E23;"><%=buser.getUsername()%></code></h1>
						<!--Price-->
						<h4 style="text-align:center;">Prices</h4>
						<table class="table table-hover table-bordered table-responsive-sm">
							<thead class="thead-dark">
								<tr>
									<th>Services</th>
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
									<td>Haircut + Shaving <span class="badge badge-success" style="background-color:#6B8E23;">Best deal</span></td>
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
			
			<!-- Booking -->
			<%
			//For the selection of the day
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yyyy");  
			LocalDateTime now = LocalDateTime.now();  
			String dt = dtf.format(now);  
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			Calendar day = Calendar.getInstance();
			day.setTime(sdf.parse(dt));
			
			//For the selection of the time
			Calendar time = Calendar.getInstance();
			%>
			
		<div class="tab-pane fade" id="book" role="tabpanel" aria-labelledby="book-tab">
			<form style="text-align:center;" id="bookForm" action="<%=request.getContextPath() %>/ismgroup26/bookController.jsp">
				<h1>Make your <text style="color:#8B0000">booking</text></h1><br>
				<!-- One "tab" for each step in the form: -->
				<div class="tab" >
					<h3 style="margin-bottom:3%;">Select day</h3>
					<%	for(int i=0;i<=7;i++){	
							day.add(Calendar.DATE, i);
							dt = sdf.format(day.getTime());%>				
							<div class="form-check-inline">
								<label class="form-check-label" for="day<%=i%>">
									<input type="radio" class="form-check-input" name="day" value="option<%=i%>" oninput="this.className = ''"><%=dt%>
								</label>
							</div>
						<%	day.add(Calendar.DATE, -i);	
						}	%>
				</div>
				<div class="tab">
					<h3>Select time</h3>
					<div class="text-center" id="accordion">
						
						<div class="card">
							<div class="card-header">
								<a class="card-link" data-toggle="collapse" href="#collapseOne">
								FORENOON
								</a>
							</div>
							<div id="collapseOne" class="collapse" data-parent="#accordion">
								<div class="card-body">
								<%	String mtm1 = "08:00";
									String mtm2;
									SimpleDateFormat msdf2 = new SimpleDateFormat("HH:mm");
									time.setTime(msdf2.parse(mtm1));
									for(int j=0;j<=11;j++){
										mtm1 = msdf2.format(time.getTime());
										time.add(Calendar.MINUTE, 20);	
										mtm2 = msdf2.format(time.getTime());%>
										<div class="form-check-inline">
											<label class="form-check-label" for="day<%=j%>">
												<input type="radio" class="form-check-input" name="time" value="timeoption<%=j%>"><%=mtm1%>-<%=mtm2%>
											</label>
										</div>
									<%	}	%>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header">
								<a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">
								NOON
								</a>
							</div>
							<div id="collapseTwo" class="collapse" data-parent="#accordion">
								<div class="card-body">
								<%	String ntm1 = "12:00";
									String ntm2;
									SimpleDateFormat nsdf2 = new SimpleDateFormat("HH:mm");
									time.setTime(nsdf2.parse(ntm1));
									for(int j=12;j<=23;j++){
										ntm1 = nsdf2.format(time.getTime());
										time.add(Calendar.MINUTE, 20);	
										ntm2 = nsdf2.format(time.getTime());%>
										<div class="form-check-inline">
											<label class="form-check-label" for="day<%=j%>">
												<input type="radio" class="form-check-input" name="time" value="timeoption<%=j%>"><%=ntm1%>-<%=ntm2%>
											</label>
										</div>
									<%	}	%>
								</div>
							</div>
						</div>
						<div class="card">
							<div class="card-header">
								<a class="collapsed card-link" data-toggle="collapse" href="#collapseThree">
								AFTERNOON
								</a>
							</div>
							<div id="collapseThree" class="collapse" data-parent="#accordion">
								<div class="card-body">
							<%	String atm1 = "16:00";
								String atm2;
								SimpleDateFormat asdf2 = new SimpleDateFormat("HH:mm");
								time.setTime(asdf2.parse(atm1));
								for(int j=24;j<=29;j++){
									atm1 = asdf2.format(time.getTime());
									time.add(Calendar.MINUTE, 20);	
									atm2 = asdf2.format(time.getTime());%>
									<div class="form-check-inline">
										<label class="form-check-label" for="day<%=j%>">
											<input type="radio" class="form-check-input" name="time" value="timeoption<%=j%>"><%=atm1%>-<%=atm2%>
										</label>
									</div>
								<%	}	%>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="tab">
					<h3>Select service</h3>
						<table class="table table-hover table-responsive-sm">
							<thead class="thead-dark">
								<tr>
									<th>Services</th>
									<th>Under 18</th>
									<th>Man</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Haircut</td>
									<td>
										<div class="form-check-inline">
											<label class="form-check-label" for="srv11">
												7 €<input type="radio" class="form-check-input" name="service" value="srvoption11">
											</label>
										</div>
									</td>
									<td>
										<div class="form-check-inline">
											<label class="form-check-label" for="srv12">
												10 €<input type="radio" class="form-check-input" name="service" value="srvoption12">
											</label>
										</div>
									</td>
								</tr>
								<tr>
									<td>Shaving</td>
									<td>
										<div class="form-check-inline">
											<label class="form-check-label" for="srv21">
												5 €<input type="radio" class="form-check-input" name="service" value="srvoption21">
											</label>
										</div>
									</td>
									
									<td>
										<div class="form-check-inline">
											<label class="form-check-label" for="srv22">
												7 €<input type="radio" class="form-check-input" name="service" value="srvoption22">
											</label>
										</div>									
									</td>
								</tr>
								<tr>
									<td>Trimming</td>
									<td>
										<div class="form-check-inline">
											<label class="form-check-label" for="srv31">
												3 €<input type="radio" class="form-check-input" name="service" value="srvoption31">
											</label>
										</div>
									</td>
									
									<td>
										<div class="form-check-inline">
											<label class="form-check-label" for="srv32">
												5 €<input type="radio" class="form-check-input" name="service" value="srvoption32">
											</label>
										</div>									
									</td>
								</tr>
								<tr>
									<td>Haircut + Shaving <span class="badge badge-success" style="background-color:#6B8E23;">Best deal</span></td>
									<td>10 €</td>
									<td>14 €</td>
								</tr>
								<tr>
									<td>Haircut + Trimming</td>
									<td>8 €</td>
									<td>12 €</td>
								</tr>
							</tbody>
						</table>
				</div>
				
				<div class="tab">
					<h3>checking-testing</h3>
					<p><input placeholder="dd" oninput="this.className = ''" name="dd"></p>
					<p><input placeholder="mm" oninput="this.className = ''" name="nn"></p>
					<p><input placeholder="yyyy" oninput="this.className = ''" name="yyyy"></p>
				</div>
				<div style="overflow:auto; text-align:center; margin-top:5%;">
					  <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
					  <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
				</div>
				<!-- Circles which indicates the steps of the form: -->
				<div style="text-align:center;margin-top:40px;">
					<span class="step"></span>
					<span class="step"></span>
					<span class="step"></span>
					<span class="step"></span>
				</div>
			</form>		
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
										<input name="comment" type="text" class="form-control form-control-sm text-center" style="color:#0c1a00;" id="comment" maxlength="50" size="33" placeholder="..."/>
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
				<%	if(reviews.size() == 0){%>
						<h2 style="color:white; margin-top:5%;"><em class="display-4 font-weight-bolder">No <text style="color:#8B0000;">reviews</text> yet.<br>Post the <text style="color:#FFD700;">first</text> review!</em><h2>
				<%	}else{
						int counter = 0;
						for(Review review: reviews) {	%>						
						<li class="re-container fitem">
							<ul class="inside-cont">
								<li class="idrr">
									<ul class="ii-cont text-center">
										<li class="ii-item">
											<img src="<%=request.getContextPath() %>/ismgroup26/imgs/johnny.jpg" alt="customer" data-toggle="tooltip" title="<%=review.getCustomer().getUsername() %>">
										</li>
										<li class="ii-item">
											<span><b><%=review.getCustomer().getName()%> <%=review.getCustomer().getSurname()%></b></span>
											<p><small>Posted on "dd/mm/yyyy"</small></p>
										</li>
									</ul>
								</li>
								<li class="idrr">
									<em style="background:#5c5c8a;"><%=review.getReview()%></em>
								</li>
								<li class="idrr rating">
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
		BarbershopUser user = (BarbershopUser)session.getAttribute("user");
		forReviews fr = new forReviews();
		List<Review> reviews = fr.getReviews(user.getBID());
%>
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
				<ul class="flex-container">
			<%	if(reviews == null){%>
					<h2 class="color:white"><em>No reviews yet. Post the first review!</em><h2>
			<%	}else{
					int counter = 0;
					for(Review review: reviews) {	%>						
					<li class="re-container fitem">
						<ul class="inside-cont">
							<li class="idrr">
								<ul class="ii-cont">
									<li class="ii-item">
										<img src="<%=request.getContextPath() %>/ismgroup26/imgs/johnny.jpg" alt="customer" data-toggle="tooltip" title="<%=review.getCustomer().getUsername() %>">
									</li>
									<li class="ii-item">
										<span><b><%=review.getCustomer().getName()%> <%=review.getCustomer().getSurname()%></b></span>
										<p><small>Posted on "dd/mm/yyyy"</small></p>
									</li>
								</ul>
							</li>
							<li class="idrr">
								<em style="background:#5c5c8a;"><%=review.getReview()%></em>
							</li>
							<li class="idrr rating">
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

<script>
var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the current tab

function showTab(n) {
  // This function will display the specified tab of the form...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  //... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
    document.getElementById("nextBtn").innerHTML = "Submit";
  } else {
    document.getElementById("nextBtn").innerHTML = "Next";
  }
  //... and run a function that will display the correct step indicator:
  fixStepIndicator(n)
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form...
  if (currentTab >= x.length) {
    // ... the form gets submitted:
    document.getElementById("bookForm").submit();
    return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

function validateForm() {
  // This function deals with validation of the form fields
  var x, y, i, valid = true;
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");
  // A loop that checks every input field in the current tab:
  for (i = 0; i < y.length; i++) {
    // If a field is empty...
    if (y[i].value == "") {
      // add an "invalid" class to the field:
      y[i].className += " invalid";
      // and set the current valid status to false
      valid = false;
    }
  }
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid; // return the valid status
}

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class on the current step:
  x[n].className += " active";
}
</script>