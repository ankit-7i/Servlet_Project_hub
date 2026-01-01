<%@page import="com.achyuta.registration.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Profile</title>

<style>
  * {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
  }

  body {
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #6C63FF, #C850C0, #FFCC70);
    background-size: 300% 300%;
    animation: gradientMove 6s ease infinite;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  @keyframes gradientMove {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
  }

  .edit-container {
    background: rgba(255, 255, 255, 0.15);
    backdrop-filter: blur(15px);
    border-radius: 16px;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.25);
    padding: 40px 35px;
    width: 380px;
    color: #fff;
    animation: fadeIn 1s ease;
  }

  @keyframes fadeIn {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
  }

  h2 {
    text-align: center;
    margin-bottom: 25px;
    letter-spacing: 0.5px;
  }

  form {
    display: flex;
    flex-direction: column;
    gap: 15px;
  }

  label {
    font-weight: 600;
    text-align: left;
    color: #fff;
  }

  input[type="text"],
  input[type="email"],
  input[type="tel"] {
    padding: 12px;
    border-radius: 8px;
    border: none;
    outline: none;
    background: rgba(255,255,255,0.2);
    color: #fff;
    font-size: 15px;
    transition: 0.3s ease;
  }

  input::placeholder {
    color: rgba(255,255,255,0.7);
  }

  input:focus {
    background: rgba(255,255,255,0.35);
    transform: scale(1.02);
  }

  input[type="submit"] {
    background: linear-gradient(45deg, #5B54E7, #FF6584);
    color: #fff;
    font-weight: bold;
    border: none;
    border-radius: 8px;
    padding: 12px;
    cursor: pointer;
    transition: 0.3s ease;
  }

  input[type="submit"]:hover {
    background: linear-gradient(45deg, #4E45E0, #E14E6F);
    transform: scale(1.05);
  }

  /* Responsive */
  @media (max-width: 480px) {
    .edit-container {
      width: 90%;
      padding: 30px 25px;
    }
  }
</style>
</head>

<body>
  <%
    UserBean ub = (UserBean)application.getAttribute("userBean");
    String fname = (String)request.getAttribute("fname");
  %>

  <div class="edit-container">
    <h2>This session belongs to <%= fname %></h2>

    <form action="update" method="post"
          onsubmit="return confirm('Are you sure you want to update your profile?')">

      <label>First Name</label>
      <input type="text" name="fname" value="<%= ub.getFirstName() %>" required>

      <label>Last Name</label>
      <input type="text" name="lname" value="<%= ub.getLastName() %>" required>

      <label>Email</label>
      <input type="email" name="mailid" value="<%= ub.getMail() %>" required>

      <label>Phone</label>
      <input type="tel" name="phone" value="<%= ub.getPhone() %>" required>

      <input type="submit" value="Update Profile">
    </form>
  </div>
</body>
</html>
