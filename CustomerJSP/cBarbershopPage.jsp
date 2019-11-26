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
				background-image: url("../imgs/barberBG1.jpg"); 
				background-size: cover;		
			}
	</style>
	<body>

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
																			
									<a class="dropdown-item" href="<%=request.getContextPath() %>/logout.jsp">
										<span class="border-0">
											<img src="../imgs/logoutAv.jpg" alt="Avatar" class="avatar rounded-circle" style="width:25px; height:25px; border-radius:25px;"> Log out
										</span>
									</a>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<span class="border-0">
				<img src="../imgs/customerAv.png" alt="Avatar" class="avatar rounded-circle" style="width:50px; height:50px; border-radius:50px;">
			</span>	
		</nav>
		<br>
			
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
							<img src="../imgs/barberProf.jpg" alt="barber" style="width:200px;">
						</div>
					</div>
					<!-- end of info_container -->
				</div>
			</div>
			
			<!-- Reviews -->
			<div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
				<ul class="flex-container wrap">	
					<li class="re-container fitem">
						<img src="../imgs/johnny.jpg" alt="Avatar" style="width:80px">
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
						<img src="../imgs/johnny.jpg" alt="Avatar" style="width:80px">
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
						<img src="../imgs/johnny.jpg" alt="Avatar" style="width:80px">
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
						<img src="../imgs/johnny.jpg" alt="Avatar" style="width:80px">
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
						<img src="../imgs/johnny.jpg" alt="Avatar" style="width:80px">
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
						<img src="../imgs/johnny.jpg" alt="Avatar" style="width:80px">
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
						<img src="../imgs/johnny.jpg" alt="Avatar" style="width:80px">
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
						<img src="../imgs/johnny.jpg" alt="Avatar" style="width:80px">
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
						<img src="../imgs/johnny.jpg" alt="Avatar" style="width:80px">
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
						<img src="../imgs/johnny.jpg" alt="Avatar" style="width:80px">
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

		<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/ismgroup26/js/custom.js"></script>
	</body>
</html>

