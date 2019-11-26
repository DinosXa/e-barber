<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="../css_docs/menu2.css">
		<title>Give feedback</title>
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
						 <li class="nav-item ">
					<a class="nav-link" href="<%=request.getContextPath() %>/ismgroup26/CustomerJSP/searchforbarbers.jsp">Search</a>
				  </li>
				  
				  <li class="nav-item ">
					<a class="nav-link" href="<%=request.getContextPath() %>/ismgroup26/CustomerJSP/myreviews.jsp">My reviews</a>
				  </li>			
				  <li class="nav-item ">
					<a class="nav-link" href="<%=request.getContextPath() %>/ismgroup26/CustomerJSP/myappointments.jsp">My appointments</a>
				  </li>		
				 

				</ul>
				<!--<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<form class="form-inline" action="/action_page.php">
				 <input class="form-control mr-sm-2" type="text" placeholder="Search">
				 <button class="btn btn-dark" type="submit">Search</button>
				</form>
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
																		
									<a class="dropdown-item" href="<%=request.getContextPath() %>/ismgroup26/logout.jsp">
										<span class="border-0">
											<img src="imgs/logoutAv.jpg" alt="Avatar" class="avatar rounded-circle" style="width:25px; height:25px; border-radius:25px;"> Log out
										</span>
									</a>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
			
			<span class="border-0">
				<img src="imgs/customerAv.png" alt="Avatar" class="avatar rounded-circle" style="width:50px; height:50px; border-radius:50px;">
			</span>	

		</nav>
	<div class="container theme-showcase" role="main">

			<!-- Main jumbotron for a primary marketing message or call to action -->
			<div class="jumbotron">
				<h1>Write a review!</h1>
			</div>

		<div class="container">
			<form action="action_page.php">

				<label for="fname">First Name</label>
				<input type="text" id="fname" name="firstname" placeholder="Your name..">

				<label for="lname">Last Name</label>
				<input type="text" id="lname" name="lastname" placeholder="Your last name..">

				<label for="subject">Review</label>
				<textarea id="subject" name="subject" placeholder="Write something.." style="height:200px"></textarea>
				<p>Rate!</p>
				<p><link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star"></span>
				<span class="fa fa-star"></span></p>

				<input type="submit" value="Submit">

			</form>
		</div> 


		</div>
		<!-- /container -->
		</body>
		
		</html>