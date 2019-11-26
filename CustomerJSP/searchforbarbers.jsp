<!DOCTYPE html>
<html>
	<head>
	<link rel="stylesheet" type="text/css" href="../css_docs/firstPage.css">
	
		<title>Search</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>	
		<script src="https://kit.fontawesome.com/3781654338.js" crossorigin="anonymous"></script>	
		
		<style>
			body {
				background-image: url("../imgs/barberBG1.jpg"); 
				background-size: cover;		
			}
			#AccountsBnC{
				margin-right:5%;
				color:black;
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



		<div class="container theme-showcase" role="main">
			<div class="search-box">
				<input class="search-txt" type="text" name="" placeholder="Search for barbers in an area">
				<a class="search-btn" href="<%=request.getContextPath() %>/ismgroup26/CustomerJSP/cResults.jsp">
					<i class="fas fa-search-location" style="color:#6B8E23"></i>
				</a>
			</div>
		</div>
		<!-- /container -->

	</body>
</html>

