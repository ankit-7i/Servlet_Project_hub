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

<h1>
<%
int x = Integer.parseInt(request.getParameter("num1"));
int y = Integer.parseInt(request.getParameter("num2"));

String date = request.getParameter("data");
out.println("Additon :"+(x-y)+"<br><br>");
out.println("Today's Date :"+date+"<br><br>");


%>

</h1>
<%@ include file="index.html" %>

</body>
</html>