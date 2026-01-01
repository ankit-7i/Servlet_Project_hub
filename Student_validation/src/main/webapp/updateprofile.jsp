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
    background:linear-gradient(135deg,#00b09b,#96c93d);
    display:flex;
    justify-content:center;
    align-items:center;
    font-family:Arial, sans-serif;
}

.box{
    width:550px;
    background:white;
    padding:40px;
    border-radius:12px;
    box-shadow:0 0 15px rgba(0,0,0,0.3);
    text-align:center;
}

h2{
    margin-bottom:12px;
    color:#007c57;
}

p{
    margin-bottom:25px;
    font-size:18px;
    font-weight:bold;
}

a{
    display:inline-block;
    margin:5px 10px;
    padding:10px 15px;
    text-decoration:none;
    background:#00b09b;
    color:white;
    border-radius:6px;
    font-weight:bold;
}

a:hover{
    background:#007c57;
}

</style>

</head>
<body>

<div class="box">
<%
    String data=(String)request.getAttribute("msg");
    String fn=(String)request.getAttribute("fname");
    Userbean ub=(Userbean)application.getAttribute("Userbean");

    out.println("<h2>This session belongs to "+fn+"</h2>");
    out.println("<p>"+data+"</p>");
%>

    <a href="view">View Profile</a>
    <a href="edit">Edit Profile</a>
    <a href="logout">Logout</a>
</div>

</body>
</html>
