<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="login_classes.*"%>
<%@ page errorPage="error_page.jsp"%>

<% 
	
	String isbarber = request.getParameter("isbarber");
	UserDAO udao = new UserDAO();
	int bid = udao.getbid() + 1;
	
	try{
		String username = request.getParameter("busername");
		String password = request.getParameter("password");
		String email = request.getParameter("bemail");
		String phone = request.getParameter("bphone");
		String address = request.getParameter("address");
		String area = request.getParameter("area");

		Areas ar = null;
		ar = udao.getValidatedArea(area);
		
		//create barbershop object
		BarbershopUser buser = new BarbershopUser(bid, username, password, email, phone, address, ar);
		//save barbershop to database
		udao.registerBUser(buser);
		
		request.setAttribute("buser", buser);
		%>
		<jsp:forward page="index.jsp"/> 
		<%
		
	}catch(CustomException e) {
		
		request.setAttribute("bregister-message", e.getMessage());
		%>
		<jsp:forward page="index.jsp"/>
		<%
	}catch(Exception e) {
		
		throw new Exception( e.getMessage() );
	
	}
		%>
