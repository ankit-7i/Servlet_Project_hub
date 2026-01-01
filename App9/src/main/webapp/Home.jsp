<%@page import="com.achyuta.registration.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Dashboard</title>

<style>
  body {
    font-family: "Segoe UI", Roboto, sans-serif;
    background-color: #f5f6fa;
    margin: 0;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .card {
    background: #fff;
    border-radius: 12px;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
    padding: 40px 50px;
    width: 380px;
    text-align: center;
    transition: 0.3s ease;
  }

  .card:hover {
    box-shadow: 0 10px 28px rgba(0, 0, 0, 0.12);
  }

  h2 {
    color: #2f3640;
    margin-bottom: 25px;
    font-weight: 600;
  }

  .btn-group {
    display: flex;
    flex-direction: column;
    gap: 12px;
  }

  a {
    text-decoration: none;
    color: #fff;
    background-color: #4a67ff;
    padding: 12px;
    border-radius: 6px;
    font-weight: 600;
    transition: background-color 0.3s ease, transform 0.2s;
  }

  a:hover {
    background-color: #3b54d4;
    transform: translateY(-1px);
  }

  .footer {
    margin-top: 25px;
    font-size: 13px;
    color: #666;
  }

  @media (max-width: 480px) {
    .card {
      width: 90%;
      padding: 30px 20px;
    }

    h2 {
      font-size: 20px;
    }

    a {
      padding: 10px;
    }
  }
</style>
</head>

<body>
  <%
      UserBean bean = (UserBean)application.getAttribute("userBean");
      if(bean == null){
          response.sendRedirect("index.html");
      }
  %>

  <div class="card">
    <h2>Welcome, <%= bean.getFirstName() %>!</h2>

    <div class="btn-group">
      <a href="viewprofile">View Profile</a>
      <a href="editprofile">Edit Profile</a>
      <a href="logout">Logout</a>
    </div>

    <div class="footer">
      Logged in as <strong><%= bean.getUserName() %></strong>
    </div>
  </div>
</body>
</html>
