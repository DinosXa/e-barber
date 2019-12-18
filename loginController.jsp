<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="login_classes.*"%>
<%@ page errorPage="error_page.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->	
	
		<title>Log in handler</title>

		<!-- Bootstrap core CSS & JQuery-->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		<!-- Custom styles for this template -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/ismgroup26/css_docs/firstPage.css">
	</head>	
	<body>
		
		<%
			UserDAO udao = new UserDAO();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String ifbarber = request.getParameter("ifbarber");		
		   
		  
			   	try{
					 if(ifbarber == null) {
						session.setAttribute("user", udao.authenticateCU(username, password));		
		%>			
						<jsp:forward page="index.jsp">
							<jsp:param name="logged" value="true"/>
						</jsp:forward>
				<%	}else{	
						session.setAttribute("user", udao.authenticateBU(username,password));
				%>
						barber
			<%		}
				
				}catch(Exception e){
					request.setAttribute("message", e.getMessage());
			%>
					<jsp:forward page="index.jsp">
						<jsp:param name="logged" value=""/>
					</jsp:forward>
					<%=(String)request.getAttribute("message")%>
			<% } %>
			
		<!-- =================== Place all javascript at the end of the document so the pages load faster =================== -->
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<!-- Bootstrap core JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>		
	</body>
</html>
		   
		