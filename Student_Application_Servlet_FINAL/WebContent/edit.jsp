<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.student.model.Student" %>
<% Student s = (Student) request.getAttribute("student"); if (s==null) { response.sendRedirect("student?action=list"); return;} %>
<!doctype html><html><head><meta charset="utf-8"/><meta name="viewport" content="width=device-width,initial-scale=1"/><title>Edit Student</title>
<link rel="stylesheet" href="css/style.css"><script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script></head>
<body><main class="container"><header class="hero"><h1>Edit Student</h1></header>
<form class="card" method="post" action="student">
  <input type="hidden" name="action" value="update"><input type="hidden" name="studentId" value="<%= s.getStudentId()%>">
  <div class="row"><label>First Name</label><input type="text" name="firstName" required value="<%= s.getFirstName()%>"></div>
  <div class="row"><label>Last Name</label><input type="text" name="lastName" required value="<%= s.getLastName()%>"></div>
  <div class="row"><label>Course</label><select name="course" id="course"><option <%= "Java Full Stack".equals(s.getCourse())?"selected":""%>>Java Full Stack</option><option <%= "Python Full Stack".equals(s.getCourse())?"selected":""%>>Python Full Stack</option><option <%= ".NET Full Stack".equals(s.getCourse())?"selected":""%>>.NET Full Stack</option></select></div>
  <div class="row"><label>Fees (₹)</label><input type="number" name="fees" id="fees" step="0.01" required value="<%= s.getFees()%>"></div>
  <div class="row"><label>Email</label><input type="email" name="email" value="<%= s.getEmail()%>"></div>
  <div class="row"><label>Phone</label><input type="tel" name="phone" value="<%= s.getPhone()%>"></div>
  <div class="actions"><button class="btn">Update Student</button><a class="btn ghost" href="student?action=list">Cancel</a></div>
</form></main><script src="js/app.js"></script><script src="js/gsap-init.js"></script></body></html>
