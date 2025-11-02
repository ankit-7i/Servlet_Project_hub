<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String studentId = (String) request.getAttribute("studentId");
  if (studentId==null) studentId = "";
%>
<!doctype html>
<html><head><meta charset="utf-8"/><meta name="viewport" content="width=device-width,initial-scale=1"/><title>Student Registration</title>
<link rel="stylesheet" href="css/style.css"><script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script></head>
<body><main class="container">
<header class="hero"><h1>Student Registration</h1></header>
<form id="studentForm" class="card" method="post" action="student">
  <input type="hidden" name="action" value="add"><input type="hidden" name="studentId" id="studentId" value="<%= studentId %>">
  <div class="row"><label>First Name</label><input type="text" name="firstName" required></div>
  <div class="row"><label>Last Name</label><input type="text" name="lastName" required></div>
  <div class="row"><label>Course</label><select name="course" id="course"><option>Java Full Stack</option><option>Python Full Stack</option><option>.NET Full Stack</option></select></div>
  <div class="row"><label>Fees (₹)</label><input type="number" name="fees" id="fees" step="0.01" required></div>
  <div class="row"><label>Email</label><input type="email" name="email"></div>
  <div class="row"><label>Phone</label><input type="tel" name="phone"></div>
  <div class="actions"><button class="btn">Save Student</button><a class="btn ghost" href="student?action=list">View Students</a></div>
</form></main><script src="js/app.js"></script><script src="js/gsap-init.js"></script></body></html>
