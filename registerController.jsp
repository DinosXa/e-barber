<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import="login_classes.*"%>


<%
	String ifbarber = request.getParameter("barber");
	UserDAO udao = new UserDAO();
	RegisterValidator rv = new RegisterValidator();
	if(ifbarber.equals("true")) {		
		try{
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String area = request.getParameter("area");
			int bid = udao.sumbid();

			int countErrors = 0;
			String inputerrorb = "";

			if(username == null || username.length() < 5 || username.length() > 26){
				inputerrorb += "<li>Username should have from 5 (min) to 25 (max) characters.</li>";
				countErrors++;
			}
			if(password == null || password.length() < 6){
				inputerrorb += "<li>Password should have from 6 (min) to 20 (max) characters.</li>";
				countErrors++;
			}
			if( !rv.isValidEmailAddress(email) ) {
				inputerrorb += "<li>Email is not valid</li>";
				countErrors++;
			}
			if( !rv.isValidPhoneNumber(phone) ) {
				inputerrorb += "<li>Phone is not valid (must start with 21 or 22 or 69 and have 10 total digits)</li>";
				countErrors++;
			}
			if (countErrors > 0) {
				inputerrorb = "<ol>" + inputerrorb + "</ol>";
				request.setAttribute( "rbError", inputerrorb);
			%>	<jsp:forward page="index.jsp"/>	<%
			}
			Areas ar = rv.getValidatedArea(area);
			//create barbershop object
			BarbershopUser user = new BarbershopUser(bid, username, password, email, phone, address, ar);
			//save barbershop to database
			udao.registerBUser(user);
			request.setAttribute("success","Your registration was succesfull");	
		%>	<jsp:forward page="index.jsp"/>	<%
		
		}catch(CustomException e) {
			request.setAttribute("bregister-message", "1st Problem: " + e.getMessage());%>
			<jsp:forward page="index.jsp"/><%
		}catch(Exception e) {
			throw new Exception("bregister-message" + "2nd Problem: " + e.getMessage() );
		}
	}
	if(ifbarber.equals("false")){
		try{
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String surname = request.getParameter("surname");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone");
			int cid = udao.sumcid();
			
			int countErrors = 0;
			String inputerrorc = "";	
			
			if(username.length() < 5 || username.length() > 25){
				inputerrorc += "<li>Username should have from 5 (min) to 25 (max) characters.</li>";
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
			if( !rv.isValidEmailAddress( email ) ) {
				inputerrorc += "<li>Email is not valid</li>";
				countErrors++;
			}
			if( !rv.isValidPhoneNumber( phone ) ) {
				inputerrorc += "<li>Phone is not valid (must start with 21 or 22 or 69 and have 10 total digits)</li>";
				countErrors++;
			}
			if (countErrors > 0) {
				inputerrorc = "<ol>" + inputerrorc + "</ol>";
				request.setAttribute( "rcError", inputerrorc);
			%>	<jsp:forward page="index.jsp"/>	<%			
			}
			//create customer object	
			CustomerUser user = new CustomerUser(cid, username, password, name, surname, email, phone);
			//save customer to database
			udao.registerCUser(user);
			request.setAttribute("success","Your registration was succesfull");
		%>	<jsp:forward page="index.jsp"/>	<%
		}catch(CustomException e) {
			request.setAttribute("cregister-message", "1st Problem: " + e.getMessage() );%>
			<jsp:forward page="index.jsp"/><%
		}catch(Exception e) {
			throw new Exception("2nd Problem: " + e.getMessage() );
		}
	}	%>


