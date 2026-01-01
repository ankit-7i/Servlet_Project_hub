<%@page import="com.achyuta.registration.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Profile</title>

<style>
  * {
    box-sizing: border-box;
  }

  body {
    margin: 0;
    height: 100vh;
    background: linear-gradient(135deg, #89f7fe, #66a6ff);
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .container {
    background: #ffffff;
    padding: 40px 50px;
    border-radius: 15px;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
    width: 420px;
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
  }

  .container:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
  }

  h3 {
    color: #2c3e50;
    margin-bottom: 25px;
  }

  .info {
    color: #333;
    font-size: 16px;
    line-height: 1.8;
    background: #f9f9f9;
    border-radius: 10px;
    padding: 15px;
    margin-bottom: 25px;
  }

  a {
    display: inline-block;
    text-decoration: none;
    background-color: #3498db;
    color: white;
    padding: 10px 25px;
    border-radius: 8px;
    margin: 5px;
    font-weight: bold;
    transition: background-color 0.3s, transform 0.2s;
  }

  a:hover {
    background-color: #217dbb;
    transform: scale(1.05);
  }

  @media (max-width: 480px) {
    .container {
      width: 90%;
      padding: 25px 20px;
    }
  }
</style>
</head>

<body>
  <div class="container">
    <%
      UserBean ub = (UserBean) application.getAttribute("userBean");
      String firstName = (String) request.getAttribute("fname");

      if (ub != null) {
          out.print("<h3>This session belongs to " + firstName + "</h3>");
          out.print("<div class='info'>");
          out.print("Username: " + ub.getUserName() + "<br>");
          out.print("First Name: " + ub.getFirstName() + "<br>");
          out.print("Last Name: " + ub.getLastName() + "<br>");
          out.print("Email: " + ub.getMail() + "<br>");
          out.print("Phone: " + ub.getPhone() + "<br>");
          out.print("</div>");
      } else {
          out.print("<h3 style='color:red;'>Session expired or user not found!</h3>");
          out.print("<a href='login.jsp'>Login Again</a>");
      }
    %>

    <a href="editprofile">Edit</a>
    <a href="logout">Logout</a>
  </div>
</body>
</html>
