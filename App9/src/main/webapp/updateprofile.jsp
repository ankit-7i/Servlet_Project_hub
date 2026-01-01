<%@page import="com.achyuta.registration.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Session</title>

<style>
  * {
    box-sizing: border-box;
  }

  body {
    margin: 0;
    height: 100vh;
    background: linear-gradient(120deg, #74ebd5, #ACB6E5);
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .container {
    background: #ffffff;
    padding: 45px 60px;
    border-radius: 15px;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
    text-align: center;
    width: 380px;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
  }

  .container:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
  }

  h2 {
    color: #2e7d32;
    margin-bottom: 20px;
    font-size: 22px;
  }

  p {
    color: #555;
    margin-bottom: 25px;
    font-size: 15px;
  }

  a {
    display: inline-block;
    text-decoration: none;
    background-color: #6C63FF;
    color: white;
    padding: 10px 25px;
    border-radius: 8px;
    font-weight: bold;
    margin: 6px;
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.2s ease;
  }

  a:hover {
    background-color: #5548D9;
    transform: scale(1.05);
    box-shadow: 0 4px 12px rgba(108, 99, 255, 0.4);
  }

  @media (max-width: 480px) {
    .container {
      width: 90%;
      padding: 30px 25px;
    }

    h2 {
      font-size: 20px;
    }

    p {
      font-size: 14px;
    }

    a {
      padding: 9px 20px;
      font-size: 14px;
    }
  }
</style>
</head>
<body>

<div class="container">
  <%
    String message = (String) request.getAttribute("msg");
    String data = (String) request.getAttribute("fname");
    UserBean ub = (UserBean) application.getAttribute("userBean");

    out.print("<h2>This session belongs to " + data + "</h2>");
    out.print("<p>" + message + "</p>");
  %>

  <a href="viewprofile">View Profile</a>
  <a href="logout">Logout</a>
</div>

</body>
</html>
