<%@page import="com.pack1.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
UserBean ub = (UserBean)request.getAttribute("ubean");

out.println("UserName : "+ub.getU_Name() +"<br><br>");
out.println("UserName : "+ub.getU_Pwd() +"<br><br>");
out.println("UserName : "+ub.getU_Fname() +"<br><br>");
out.println("UserName : "+ub.getU_Lname() +"<br><br>");
out.println("UserName : "+ub.getU_Mail() +"<br><br>");
out.println("UserName : "+ub.getU_ph() +"<br><br>");



%>

</h1>
</center>

</body>
</html>