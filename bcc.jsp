<!-- t8170101 (κατανόηση όλων) -->

<!-- This is a jsp page to check the type of user when being on a barbershop's page. B.C.C. stands for Barbershop Class Check. -->
<%	if(session.getAttribute("user").getClass() != BarbershopUser.class){	
		request.setAttribute("wrong-page","Permission denied");	%>
		<jsp:forward page="index.jsp"/>
<%	}	%>