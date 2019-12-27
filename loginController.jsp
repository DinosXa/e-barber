<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="login_classes.*"%>
<%@ page errorPage="error_page.jsp"%>
		
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
String ifbarber2 = request.getParameter("ifbarber2");		
UserDAO udao = new UserDAO();

	try{
		if(ifbarber2 == null) {
			session.setAttribute("user", udao.authenticateCU(username, password));
			request.setAttribute("ifbarber","");	%>
			<jsp:forward page="index.jsp"/>
	<%	}else{	
			session.setAttribute("user", udao.authenticateBU(username,password));
			request.setAttribute("ifbarber","true");	%>
			<jsp:forward page="BarbershopPage.jsp"/>
	<%	}
	}catch(Exception e){
		request.setAttribute("errors", e.getMessage());
%>
		<jsp:forward page="index.jsp"/>
		<%=(String)request.getAttribute("errors")%>
<% } %>