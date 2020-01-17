<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import="login_classes.*"%>

<%@ include file="logincheck.jsp"%>
<%@ include file="ccc.jsp"%>

<%
try{
	UserDAO udao = new UserDAO();
	CustomerUser user = (CustomerUser)session.getAttribute("user");
	String comment = request.getParameter("comment");
	String stars = request.getParameter("rate");
	String datetime = request.getParameter("reviewDT");
	String cuserid = request.getParameter("cid");
	String buserid = request.getParameter("bid");
	if(buserid == null)
		request.setAttribute("indexerror","You must go to a barber's profile");

	forReviews frev = new forReviews();
	BarbershopUserService brbservice = new BarbershopUserService();
	BarbershopUser buser = brbservice.findBarberByID(buserid);

	int rid = frev.getrid();
	int rating = Integer.parseInt(stars);

	/***VALIDATING***/
	//validate barbershop id
	BarbershopUser bid = null;
	bid = udao.getBarbershopID( buserid );	
	//validate customer id
	CustomerUser cid = null;
	cid = udao.getCustomerID( cuserid );

	if(buser==null)
		request.setAttribute("indexerror","There was not given an id.");

	//create Review object
	Review review = new Review(rid, comment, rating, datetime, cid, bid);
	//save review to database
	frev.writeReview(review);

	request.setAttribute("success","Your review was posted");
%>	<jsp:forward page="index.jsp"/>
<%
	}catch(CustomException e) {

		request.setAttribute("indexerror", e.getMessage());

	}catch(Exception e) {

		throw new Exception( "Error is: " + e.getMessage() );

	}	%>
	<jsp:forward page="index.jsp"/>
