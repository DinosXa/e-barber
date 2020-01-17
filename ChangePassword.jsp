<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import= "login_classes.*"%>
<%@ page import= "java.util.*"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
		
		<title>e-barber</title>

		<!-- Bootstrap core CSS & JQuery-->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<!-- Custom styles for this template -->	
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/firstPage.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/navbar.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/gifs.css">
		<script src="https://kit.fontawesome.com/3781654338.js" crossorigin="anonymous"></script>
	</head>
	<style>
		body {
			background-image: url("<%=request.getContextPath() %>/ismgroup26/imgs/barberBG1.jpg");
			background-size: cover;		
			}
		#AccountsBnC{
			margin-right:5%;
			color:black;
			}
	</style>
	<body>

		<%	
			if(session.getAttribute("user") == null){
		%>
				
						<div class="alert alert-danger text-center allert-dismissible fade show errormsg" role="alert"> You can not access this page. Please login
							<button type="button" class="close" data-dismiss="alert">&times;</button>
						</div>
	

					
	
			<%	}else{	%>
					
					
							
								
									<center><h4 class="modal-title" style="color:white;">Change Password</h4></center>
								

								<!-- Modal body -->
								<div class="container">
									<form class="form-signin" method="POST" action="<%=request.getContextPath() %>/ismgroup26/ChangeController.jsp">		
										<div id="clog" class="container tab-pane"><br>
											<div class="modal-body">
												<div class="form-group">
													
													<div class="col-sm-10">
														<input name="username" type="text" class="form-control" id="username" placeholder="Enter your username" required>
													</div>
												</div>
												<div class="form-group">
													
													<div class="col-sm-10">
														<input name="old_password" type="password" class="form-control" id="password" placeholder="Enter your old password" required>
													</div>
												</div>
												<div class="form-group">
													
													<div class="col-sm-10">
														<input name="new_password" type="password" class="form-control" id="password" placeholder="Enter your new password" required>
													</div>
												</div>
												
												<div class="col-sm-10">
													<button type="submit" class="btn btn-success">Update</button>
													<input type="reset" class="btn btn-danger" value="Clear" />
												</div>
											</div>	
										</div>
									</form>
								</div>
						
			<% } %>
		
		<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/ismgroup26/js/custom.js"></script>
	</body>
</html>
