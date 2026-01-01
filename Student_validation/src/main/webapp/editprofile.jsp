<%@page import="com_student.Userbean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Phone</title>

<style>
*{margin:0; padding:0; box-sizing:border-box;}

body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#0e1628,#40597c);
    font-family:Arial, sans-serif;
}

.box{
    width:480px;
    background:white;
    padding:35px;
    border-radius:12px;
    text-align:center;
    box-shadow:0 0 15px rgba(0,0,0,0.35);
}

h2{
    margin-bottom:20px;
    color:#0e1628;
}

input[type="text"]{
    width:80%;
    padding:10px;
    border:1px solid #ddd;
    font-size:15px;
    border-radius:6px;
    margin-bottom:25px;
}

input[type="submit"]{
    padding:10px 25px;
    background:#0e1628;
    color:white;
    border:none;
    border-radius:7px;
    cursor:pointer;
    font-weight:bold;
}

input[type="submit"]:hover{
    background:#1f3452;
}

a{
    display:inline-block;
    margin:10px;
    padding:10px 22px;
    background:#0e1628;
    color:white;
    text-decoration:none;
    border-radius:8px;
    font-weight:bold;
}

a:hover{
    background:#1f3452;
}
</style>

</head>
<body>

<div class="box">

<%
	Userbean ub=(Userbean)application.getAttribute("Userbean");
	String fn=(String)request.getAttribute("fname");
	out.println("<h2>This session belongs to "+fn+"</h2>");
%>

<form action="update" method="post">
<h2>Change Your Mobile Number</h2>
<input type="text" name="phone" value="<%=ub.getPhone()%>">
<br>
<input type="submit" value="update">
</form>

<br><br>

<a href="view">View Profile</a>
<a href="logout">Logout</a>

</div>

</body>
</html>
