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

String filterName = (String)request.getAttribute("Filtername");
String msg =(String)request.getAttribute("msg");
String uname = (String)request.getParameter("uname");

out.println("WELCOME "+uname+"<br><br>");

out.println("Filter Name : "+filterName+"<br><br>");


out.println("FilterConfig data :"+msg+"<br><br>");

%>

</h1>
</center>

</body>
</html>