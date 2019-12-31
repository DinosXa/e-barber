
<!-- This is a jsp page to check the type of user when being on a customer's page. C.C.C. stands for Customer Class Check. -->
<%	if(session.getAttribute("user").getClass() != CustomerUser.class){	
		request.setAttribute("wrong-page","Permission denied");	%>
		<jsp:forward page="BarbershopPage.jsp"/>
<%	}	%>

