<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="com.pack1.PeopleBean" %>

<%
    PeopleBean pb = (PeopleBean) request.getAttribute("person");
%>

<h2>Person Details Saved Successfully</h2>

<p><b>Name:</b> <%= pb.getName() %></p>
<p><b>Age:</b> <%= pb.getAge() %></p>
<p><b>Aadhar:</b> <%= pb.getAadhar() %></p>
<p><b>Address:</b> <%= pb.getAddress() %></p>

</body>
</html>