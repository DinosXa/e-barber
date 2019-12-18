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
		<script src="https://kit.fontawesome.com/3781654338.js" crossorigin="anonymous"></script>	
	</head>	
	<style>





<!-- Page Title -->
			<div class="page-header">	
				
				<h1>Welcome <code>
				</div>
                <%
                        BarbershopUserService brbservice = new BarbershopUserService();
                        List<BarbershopUser> barbershops = brbservice.getBarbershops();
                        %>
				<h3>Available Barbershops <a href="#"><span class="badge"><%=barbershops.size()%></span></a> </h3>
				<table class="table table-bordered">
				    <thead  style="background-color: blanchedalmond">
                        <tr>
                            <th>A/A</th>
                             
                            <th>Username</th>
                            <th>Email</th>
                            <th>Phone</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <%
                           for (int i = 0; i< barbershops.size(); i++) {   %>
                            <tr>
                                <td><b><%=(i + 1)%></b></td>
                    
                                <td><a href ="profile_ex2_8170192.jsp?uname=<%=barbershops.get(i).getUsername()%></a></td>
                                <td><%=barbershops.get(i).getEmail()%></td>
                                <td><%=barbershops.get(i).getPhone()%></td>
                                
                            </tr>
                        <% 
                        } %>
                    </tbody>
				</table>
			
			</div>
		</div>
		<!-- /container -->
















