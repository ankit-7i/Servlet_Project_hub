
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="Error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
	
	<%
		String choice = request.getParameter("choice");
		if(choice.equals("Add"))
		{
	%>
	<jsp:forward page="Addition.jsp">
	
			<jsp:param value="<%= new java.util.Date() %>" name="data"/>
	</jsp:forward>
	<%
		}
		else{
			
	%>
	<jsp:forward page="Subtraction.jsp"></jsp:forward>
	<%
		}
	%>

</body>
</html>