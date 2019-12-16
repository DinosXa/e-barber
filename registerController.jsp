<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="login_classes.*"%>
<%@ page errorPage="errorpage.jsp"%>

<% 
	
	String isbarber = request.getParameter("isbarber");
	UserDAO udao = new UserDAO();
	
	try{
		if(isbarber=="true"){
			String bid = "1";
			String username = request.getParameter("busername");
			String password = request.getParameter("password");
			String email = request.getParameter("bemail");
			String phone = request.getParameter("bphone");
			String address = request.getParameter("address");
			String area = request.getParameter("area");
			
			Areas ar = null;			
			ar = udao.getValidatedArea(area);
			
			BarbershopUser buser = new BarbershopUser(bid, username, password, email, phone, address, ar);
			udao.registerBUser(buser);
			request.setAttribute("buser", buser);
			%>
			<jsp:forward page="index.jsp"/> 
	<%
		}else{
			String cid = "1";
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String surname = request.getParameter("surname");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			
			CustomerUser cuser = new CustomerUser(cid, username, password, name, surname, email, phone);
			udao.registerCUser(cuser);
			request.setAttribute("cuser", cuser);
			%>
			<jsp:forward page="index.jsp"/>
		<% } 
	}catch(CustomException e) {
		
		request.setAttribute("message", e.getMessage());
		
	}catch(Exception e) {
		
		throw new Exception( e.getMessage() );
	
	}
		%>
