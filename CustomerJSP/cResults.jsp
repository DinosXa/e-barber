<!DOCTYPE html>
<html>
	<head>
	
	
		<title>Results</title>
		<link rel="stylesheet" type="text/css" href="../css_docs/menu2.css">
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>	
		
		<style>
			body {
				background-image: url("../imgs/barberBG1.jpg"); 
				background-size: cover;		
			}
			
			#AccountsBnC{
				margin-right:5%;
				color:black;
			}
		
			.button {
				background-color: #4CAF50; /* Green */
				border: none;
				color: white;
				padding: 10px 10px;
				text-align: center;
				text-decoration: none;
				display: inline-block;
				font-size: 16px;
			}
		</style>

	</head>
	
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
						<a class="nav-link" href="<%=request.getContextPath() %>/ismgroup26/CustomerJSP/searchforbarbers.jsp">Search</a>
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

									<a class="dropdown-item" href="<%=request.getContextPath() %>/ismgroup26/logout.jsp">
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
		<div class="container">
			<div class="jumbotron">
				<h1>Results</h1>    
			</div>    
		</div>


		<div class="container">
			<div class="media border p-3">
				<img src="../imgs/barbr.jpg" alt="barbershop" class="mr-3 mt-3 rounded-circle">
				<div class="media-body">
					<h4>Barbershop 1</h4>
					<p>Shaving is our speciality.</p>
					<a class="btn btn-success" <!--href="cBarbershopPage.html#book"-->Book</a>				
					<a class="btn btn-info" href="<%=request.getContextPath() %>/ismgroup26/CustomerJSP/cBarbershopPage.jsp#info">More Info</a>
					<a class="btn btn-warning" href="<%=request.getContextPath() %>/ismgroup26/CustomerJSP/writereview.jsp">Post a Review</a>
				</div>
			</div>
			<div class="media border p-3">
				<img src="../imgs/barbr.jpg" alt="barbershop" class="mr-3 mt-3 rounded-circle">
				<div class="media-body">
					<h4>Barbershop 2</h4>
					<p>We do expecrt trimming.</p>
					<a class="btn btn-success" <!--href="cBarbershopPage.html#book"-->Book</a>				
					<a class="btn btn-info" href="<%=request.getContextPath() %>/ismgroup26/CustomerJSP/cBarbershopPage.jsp#info">More Info</a>
					<a class="btn btn-warning" href="<%=request.getContextPath() %>/ismgroup26/CustomerJSP/writereview.jsp">Post a Review</a>
				</div>
			</div>
		</div>
		<!-- /container -->
	
		<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
		<!-- jQuery library -->
		<script src="../js/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script	src="../js/bootstrap.min.js"></script>
		<script type="text/javascript" src="../js/custom.js"></script>
	</body>
</html>

