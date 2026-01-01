<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Message</title>
<style>
  body {
    height: 100vh;
    margin: 0;
    font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(120deg, #74ebd5, #ACB6E5);
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }

  .message-box {
    background-color: #ffffff;
    padding: 30px 50px;
    border-radius: 12px;
    box-shadow: 0 6px 25px rgba(0, 0, 0, 0.15);
    text-align: center;
    margin-bottom: 25px;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
  }

  .message-box:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
  }

  .message-box h3 {
    color: #2e7d32;
    font-size: 20px;
    margin: 0;
    letter-spacing: 0.5px;
  }

  .login-container {
    width: 100%;
    max-width: 420px;
    background-color: #ffffff;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    padding: 20px 25px;
  }

  @media (max-width: 480px) {
    .message-box, .login-container {
      width: 90%;
      padding: 20px;
    }

    .message-box h3 {
      font-size: 17px;
    }
  }
</style>
</head>
<body>
  <div class="message-box">
    <%
      String msg = (String) request.getAttribute("msg");
      if (msg != null) {
          out.print("<h3>" + msg + "</h3>");
      }
    %>
  </div>

  <div class="login-container">
    <jsp:include page="index.html"></jsp:include>
  </div>
</body>
</html>
