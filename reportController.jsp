<!-- t8170101 t8170192 (κατανόηση όλων) -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import= "login_classes.*"%>
<%@ page import= "java.util.*"%>

<%@ include file="logincheck.jsp"%>
<%@ include file="bcc.jsp"%>

<%
try{	
	BarbershopUser user = (BarbershopUser)session.getAttribute("user");
	forReports fr = new forReports();
	UserDAO udao = new UserDAO();
	
	String subject = request.getParameter("subject");
	String report = request.getParameter("report");
	String buserid = request.getParameter("bid");	
	int rpid = fr.getrpid();
	
	if(buserid == null){
		request.setAttribute("wrong-page","Error with your id!");
	%>	<jsp:forward page="BarbershopPage.jsp"/>	<%
	}
	/***VALIDATING***/
	//validate barbershop id
	BarbershopUser bid = null;
	bid = udao.getBarbershopID( buserid );

	String errorContact = "";
	int errors = 0;	
	
	if(subject == null){
		errorContact += "<li>You must select a subject</li>";
		errors++;
	}
	if(report.length() < 25 || report == null){
		errorContact += "<li>Your report must have 25(min) with 75(max) characters.</li>";
		errors++;
	}	
	if(errors > 0){
		errorContact= "<ol>" + errorContact + "</ol>";
		request.setAttribute( "reportmsg", errorContact);
	%>	<jsp:forward page="contactwithus.jsp"/>	<%		
	}else{
		//create Report object
		Report rep = new Report(rpid, subject, report, bid);
		//save report to database
		fr.sendReport(rep);
		request.setAttribute("success", "We will consider your report! Thank you!");
	%>	<jsp:forward page="BarbershopPage.jsp"/>	<%
	}
}catch(CustomException e) {
	request.setAttribute("reportmsg", "Problem with report: " + e.getMessage() );
%>	<jsp:forward page="contactwithus.jsp"/>	<%
}catch(Exception e) {
	throw new Exception("Contact Problem: " + e.getMessage() );
}
%>