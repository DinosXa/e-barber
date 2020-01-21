<!-- t8170101,t8170192 (κατανόηση όλων) -->

<%
	if(session.getAttribute("user") == null) {
		request.setAttribute("messages", "You are not authorized to access this resource. Please login.");
%>
	<jsp:forward page="index.jsp" />
<%  } %>