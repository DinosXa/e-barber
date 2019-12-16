<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="login_classes.*"%>
<%@ page errorPage="error_page.jsp"%>

<% 
	
	String isbarber = request.getParameter("isbarber");
	UserDAO udao = new UserDAO();
	int cid = udao.getcid() + 1;
	
	try{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String surname = request.getParameter("surname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		//create customer object	
		CustomerUser cuser = new CustomerUser(cid, username, password, name, surname, email, phone);
		//save customer to database
		udao.registerCUser(cuser);
		
		request.setAttribute("cuser", cuser);
	%>
		<jsp:forward page="index.jsp"/>
	<% 
	}catch(CustomException e) {
		
		request.setAttribute("cregister-message", e.getMessage());
	%>
		<jsp:forward page="index.jsp"/>
	<%
	}catch(Exception e) {
		
		throw new Exception( e.getMessage() );
	
	}
	%>
