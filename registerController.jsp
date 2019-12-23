<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import="login_classes.*"%>


<%
	request.setAttribute("logged","");
	if(request.getParameter("barber").equals("true")) {	
		String isbarber = request.getParameter("isbarber");
		UserDAO udao = new UserDAO();
		int bid = udao.getbid();		
		try{
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String area = request.getParameter("area");

			
			if( (username.length() > 4) && (password.length() > 5) && (phone.length() == 10) && (area != null) ) {
				Areas ar = udao.getValidatedArea(area);
				
				//create barbershop object
				BarbershopUser buser = new BarbershopUser(bid, username, password, email, phone, address, ar);
				//save barbershop to database
				udao.registerBUser(buser);
				%>
				<jsp:forward page="index.jsp"/> 
				<%
			}else{
				int countErrors = 0;
				String inputerrorb = "";	
				
				if(username.length() < 5){
					inputerrorb += "<li>Username should have from 5 (min) to 20 (max) characters.</li>";
					countErrors++;
				}
				if(password.length() < 6){
					inputerrorb += "<li>Password should have from 6 (min) to 20 (max) characters.</li>";
					countErrors++;
				}
				if(phone.length() != 10){
					inputerrorb += "<li>Phone should have 10 characters.</li>";
					countErrors++;
				}
				if (countErrors > 0) {
					inputerrorb = "<ol>" + inputerrorb + "</ol>";
					request.setAttribute( "rbError", inputerrorb);
			%>
					<jsp:forward page="index.jsp"/>	
			<%		
				}
			}
		}catch(CustomException e) {
			
			request.setAttribute("bregister-message", "the prob is:" + e.getMessage());
			%>
			<jsp:forward page="index.jsp"/>
			<%
		}catch(Exception e) {
			
			throw new Exception( "error: " + e.getMessage() );
		
		}
	}
	if(request.getParameter("barber").equals("false")){
		String isbarber = request.getParameter("isbarber");
		UserDAO udao = new UserDAO();
		int cid = udao.getcid();
		
		try{
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String surname = request.getParameter("surname");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
				
			if( (username.length() > 4) && (password.length() > 5) && (name != null) && (surname != null) && (phone.length() == 10)) {	
				//create customer object	
				CustomerUser cuser = new CustomerUser(cid, username, password, name, surname, email, phone);
				//save customer to database
				udao.registerCUser(cuser);
			}else{
				int countErrors = 0;
				String inputerrorc = "";	
				
				if(username.length() < 5){
					inputerrorc += "<li>Username should have from 5 (min) to 20 (max) characters.</li>";
					countErrors++;
				}
				if(password.length() < 6){
					inputerrorc += "<li>Password should have from 6 (min) to 20 (max) characters.</li>";
					countErrors++;
				}
				if(name != null) {
					//For the Greek characters.
					name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
				}
				if(surname != null) {
					//For the Greek characters.
					surname = new String(surname.getBytes("ISO-8859-1"), "UTF-8");
				}					
				if(phone.length() != 10){
					inputerrorc += "<li>Phone should have 10 characters.</li>";
					countErrors++;
				}
				if (countErrors > 0) {
					inputerrorc = "<ol>" + inputerrorc + "</ol>";
					request.setAttribute( "rcError", inputerrorc);
				}
			}
		%>
			<jsp:forward page="index.jsp"/>
		<%
		}catch(CustomException e) {
				
				request.setAttribute("cregister-message", "the prob is: " + e.getMessage());
		%>
				<jsp:forward page="index.jsp"/>
		<%
		}catch(Exception e) {
				
			throw new Exception( "error" + e.getMessage() );
			
		}
	}	%>


