<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.pack1.UserBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center><h1>

<jsp:useBean id="ub" class="com.pack1.UserBean" scope="session"></jsp:useBean>
<jsp:setProperty property="userName" param="uname" name="ub"/>
<jsp:setProperty property="userMail" param="umid" name="ub"/>
<jsp:setProperty property="userMob" param="umob" name="ub"/>

Details Added to Bean Successfully!!! <br><br>

<a href="View.jsp"> View Details</a>






</h1>

</body>
</html>