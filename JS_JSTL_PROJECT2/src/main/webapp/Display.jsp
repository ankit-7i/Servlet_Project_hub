<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="https://jakarta.ee/taglibs/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>
<center>
<h1>Display Page</h1>

<c:set var="msg" value="Java is Awesome" />

<c:set var="name" value="${param.uname}" />
WELCOME : <c:out value="${name}" /><br><br>

<c:set var="a" value="${applicationScope.a}" />
<c:set var="b" value="${sessionScope.b}" />
<c:set var="c" value="${requestScope.c}" />
<c:set var="d" value="${pageScope.d}" />

Application : <c:out value="${a}" /><br><br>
Session     : <c:out value="${b}" /><br><br>
Request     : <c:out value="${c}" /><br><br>
Page        : <c:out value="${d}" /><br><br>

</center>
</body>
</html>
