<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="login_classes.*"%>
<%@ page errorPage="error_page.jsp"%>

<% 
	String barber = request.getParameter("barber");
	
	if(barber.equals("true")) {	
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
			%>
			<jsp:forward page="index.jsp"/> 
			<%
			
		}catch(CustomException e) {
			
			request.setAttribute("bregister-message", e.getMessage());
			%>
			<jsp:forward page="index.jsp"/>
			<%
		}catch(Exception e) {
			
			throw new Exception( "error: " + e.getMessage() );
		
		}
	}
	if(barber.equals("false")){
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
		%>
			<jsp:forward page="index.jsp"/>
		<% 
		}catch(CustomException e) {
			
			request.setAttribute("cregister-message", e.getMessage());
		%>
			<jsp:forward page="index.jsp"/>
		<%
		}catch(Exception e) {
			
			throw new Exception( "error" + e.getMessage() );
		
		}
	}%>

