<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import= "login_classes.*"%>
<%@ page import= "java.util.*"%>

<% 
String username=request.getParameter("username");
String old_password=request.getParameter("old_password");
String new_password=request.getParameter("new_password");
UserDAO dao = new UserDAO();
if(session.getAttribute("user").getClass() == CustomerUser.class){	
	dao.changePasswordCU(username, old_password, new_password);
}else {
	dao.changePasswordBU(username, old_password, new_password);
}
response.sendRedirect("index.jsp");
%>


