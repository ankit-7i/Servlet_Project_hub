<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>

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
    width:500px;
    background:white;
    padding:35px;
    border-radius:12px;
    box-shadow:0 0 15px rgba(0,0,0,0.3);
    text-align:center;
}

h2{
    margin-bottom:20px;
    color:#007c57;
    font-size:22px;
    font-weight:bold;
}

</style>

</head>
<body>

<div class="box">

<%
  String data = (String) request.getAttribute("msg");
%>

<h2><%= data %></h2>

<jsp:include page="index.html" />

</div>
</body>
</html>
