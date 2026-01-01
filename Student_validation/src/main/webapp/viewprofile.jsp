<%@page import="com_student.Userbean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body{
    font-family:Arial;
    background:#f3f3f3;
}
.box{
    width:500px;
    margin:80px auto;
    background:white;
    padding:30px;
    border-radius:12px;
    box-shadow:0 0 12px rgba(0,0,0,0.3);
    text-align:center;
}
a{
    display:inline-block;
    margin:10px;
    padding:10px 20px;
    background:#007bff;
    color:white;
    text-decoration:none;
    border-radius:5px;
}
</style>

</head>
<body>

<div class="box">
<%
    Userbean ub=(Userbean)application.getAttribute("Userbean");
    String fn=(String)request.getAttribute("fname");
%>

<h2>This session belongs in <%=fn%></h2>

<div class="details"><%=ub.getId()%> <%=ub.getName()%> <%=ub.getPhone()%></div>

<a href="logout">Logout</a>
<a href="edit">Edit PhoneNumber</a>
</div>

</body>
</html>
