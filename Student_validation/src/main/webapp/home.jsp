<%@page import="com_student.Userbean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<style>
*{ margin:0; padding:0; box-sizing:border-box; }

body{
    height:100vh;
    background:linear-gradient(135deg,#09203f,#537895);
    display:flex;
    justify-content:center;
    align-items:center;
    font-family:Arial, sans-serif;
}

.box{
    width:500px;
    background:white;
    padding:35px;
    border-radius:12px;
    text-align:center;
    box-shadow:0 0 15px rgba(0,0,0,0.35);
}

h2{
    margin-bottom:20px;
    color:#09203f;
    font-weight:bold;
}

a{
    display:inline-block;
    text-decoration:none;
    margin:10px;
    padding:10px 22px;
    background:#09203f;
    color:white;
    border-radius:8px;
    font-weight:bold;
}

a:hover{
    background:#165b92;
}
</style>

</head>
<body>

<div class="box">
<%
Userbean ub=(Userbean)application.getAttribute("Userbean");
out.println("<h2>Welcome "+ub.getName()+"<br><br>Login Successful !!!</h2>");
%>

<a href="view">View Profile</a>
<a href="logout">Logout</a>
<a href="edit">Edit PhoneNumber</a>

</div>
</body>
</html>
