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
<%

String name = (String)request.getParameter("uname");
String msg1 = (String)application.getAttribute("msg1");
String msg2 = (String)application.getInitParameter("msg2");
String msg3 = (String)request.getAttribute("msg3");
String msg4 = (String)request.getAttribute("msg4");



out.println("Welcome "+name+"<br><br>");
out.println("Context data :"+msg1+" (From Servlet) <br><br>");
out.println("Server Name :"+application.getServerInfo() +"<br><br>");
out.println("Context data :"+msg2+" (From web.xml) <br><br>");
out.println("Config data ServletName :"+msg3+"(From Servlet ) <br><br>");
out.println("Config data : "+msg4 +"(From web.xml )<br><br>");

%>
</center>

</body>
</html>