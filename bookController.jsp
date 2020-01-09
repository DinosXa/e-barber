<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import="login_classes.*"%>

<%@ include file="logincheck.jsp"%>
<%@ include file="ccc.jsp"%>

<%

	UserDAO udao = new UserDAO();
	CustomerUser user = (CustomerUser)session.getAttribute("user");
	BarbershopUserService brbservice = new BarbershopUserService();
	forBookings fb = new forBookings();

	String day = request.getParameter("day");
	String time = request.getParameter("time");
	String service = request.getParameter("service");
	String cuserid = request.getParameter("cid");
	String buserid = request.getParameter("bid");
	int bkid = fb.getbkid();
	int price = 0;
try{
	if(buserid == null){
		request.setAttribute("indexerror","You must go to a barber's profile");
	%>	<jsp:forward page="index.jsp"/>	<%
	}

	/***VALIDATING***/
	//validate barbershop id
	BarbershopUser bid = null;
	bid = udao.getBarbershopID( buserid );	
	//validate customer id
	CustomerUser cid = null;
	cid = udao.getCustomerID( cuserid );

	String errorMessage = "";
	int errors = 0;
	/***CHECKING FOR NULL***/
	if(day == null){
		errorMessage += "<li>You must select a day</li>";
		errors++;
	}
	if(time == null){
		errorMessage += "<li>You must select a time</li>";
		errors++;
	}
	if(service == null){
		errorMessage += "<li>You must select a service</li>";
		errors++;
	}else{
		price = fb.getPrice(service);
	}
	if(errors > 0){
		errorMessage = "<ol>" + errorMessage + "</ol>";
		request.setAttribute( "indexerror", errorMessage);
%>
		<jsp:forward page="index.jsp"/>	
<%		
	}else{
		//create Book object
		Booking booking = new Booking(bkid, day, time, service, price, cid, bid);
		//save book to database
		fb.makeBooking(booking);
		request.setAttribute("success", "You have made your booking!");
%>		<jsp:forward page="index.jsp"/><%
	}
}catch(CustomException e) {

		request.setAttribute("indexerror", e.getMessage());
		
}catch(Exception e) {
	throw new Exception( "Error is " + e.getMessage() );
}%>
