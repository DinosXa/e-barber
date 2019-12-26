<%
	if(session.getAttribute("user") == null) {
		request.setAttribute("errors", "You are not authorized to access this resource. Please login.");
%>
	<jsp:forward page="index.jsp" />
<%  } %>