<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		
		<title>My appointments</title>
		
		<!-- Bootstrap core CSS & JQuery-->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<!-- Custom styles for this template -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/menu2.css">

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
					<li class="nav-item ">
						<a class="nav-link" href="<%=request.getContextPath() %>/ismgroup26/index.jsp">Search</a>
					</li>				
					<li class="nav-item ">
						<a class="nav-link" href="<%=request.getContextPath() %>/ismgroup26/CustomerJSP/myreviews.jsp">My reviews</a>
					</li>			
					<li class="nav-item active">
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





		<div class="container theme-showcase" role="main">

			<!-- Main jumbotron for a primary marketing message or call to action -->
			<div class="jumbotron">
				<h1>My appointments</h1>
			</div>

			<div class="container">
				<div class="card" style="width:250px;">
					<img class="card-img-top" src="../imgs/bpoleAv.jpg" alt="Card image" style="width:250px; height:200px;">
					<div class="card-body">
						<h4 class="card-title">Barber01</h4>
						<p class="card-text">phone: 2109999999</p>
						<p class="card-text">email: barber01@gmail.com</p>
						<p class="card-text">date: 21/11/2019</p>
						<p class="card-text">time: 18:00pm</p>
						<a href="#" class="btn btn-primary">Change</a>
						<button type="button" class="btn btn-danger">Cancel</button>  
					</div>
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

