<!-- t8170101 (κατανόηση όλων) -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import= "login_classes.*"%>
<%@ page import= "java.util.*"%>


<% 
	try	{
		String username = request.getParameter("username");
		String realUsername = request.getParameter("realUsern");
		String old_password = request.getParameter("old_password");
		String new_password = request.getParameter("new_password");
		UserDAO dao = new UserDAO();
		String oldPWD = request.getParameter("oldPWD");
		
		int countErrors = 0;
		String pwd_errors = "";
		if(!username.equals(realUsername)){
			pwd_errors += "<li>Username is wrong!</li>";
			countErrors++;
		}		
		if(!old_password.equals(oldPWD)){
			pwd_errors += "<li>Old password is not correct!</li>";
			countErrors++;
		}		
		if(new_password.length() < 6){
			pwd_errors += "<li>Password must have at least 6 (min) characters!</li>";
			countErrors++;
		}
		if(new_password.equals(oldPWD)){
			pwd_errors += "<li>New password is the same with the old password!</li>";
			countErrors++;
		}	
		if (countErrors > 0) {
			pwd_errors = "<ol>" + pwd_errors + "</ol>";
			request.setAttribute( "pwd_errors", pwd_errors);
		%>	<jsp:forward page="ChangePassword.jsp"/>	<%
		}
		
		if(session.getAttribute("user").getClass() == CustomerUser.class){
			dao.changePasswordCU(username, old_password, new_password);
			request.setAttribute("success", "You have succesfully changed your password! Now login with the new one!");
			session.invalidate();
		%>	<jsp:forward page="index.jsp"/>	<%
		}
		if(session.getAttribute("user").getClass() == CustomerUser.class){
			dao.changePasswordBU(username, old_password, new_password);
			request.setAttribute("success", "You have succesfully changed your password! Now login with the new one!");	
			session.invalidate();
		%>	<jsp:forward page="index.jsp"/>	<%
		}

	}catch(Exception e){
		request.setAttribute("messages", e.getMessage());%>
		<jsp:forward page="ChangePassword.jsp"/>
<%	}	%>