<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page isErrorPage="true" %>   
 
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

out.println("Invalid Data <br><br>");
%>

<%= exception %> <!-- Expression Tag -->


</h1>
<%@ include file="index.html" %>
</center>
</body>
</html>