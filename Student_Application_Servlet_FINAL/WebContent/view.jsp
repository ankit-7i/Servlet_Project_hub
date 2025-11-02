<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.student.model.Student" %>
<html><head><meta charset="utf-8"/><meta name="viewport" content="width=device-width,initial-scale=1"/><title>Students</title>
<link rel="stylesheet" href="css/style.css"><script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.2/gsap.min.js"></script></head>
<body><main class="container"><header class="hero small"><h1>Students</h1><a href="index.jsp" class="btn ghost">Add New</a></header>
<section class="table-card"><table><thead><tr><th>ID</th><th>Name</th><th>Course</th><th>Fees</th><th>Contact</th><th>Action</th></tr></thead><tbody>
<%
  List<Student> students = (List<Student>) request.getAttribute("students");
  if (students != null) {
      for (Student s : students) {
%>
  <tr>
    <td><%=s.getStudentId()%></td>
<td><%= s.getFirstName() + " " + s.getLastName() %></td>

    <td><%=s.getCourse()%></td>
    <td><%=s.getFees()%></td>
    
<td><%= s.getEmail() + " / " + s.getPhone() %></td>
    
    
    <td><a class="link" href="student?action=edit&id=<%=s.getStudentId()%>">Edit</a> | <a class="link" href="student?action=delete&id=<%=s.getStudentId()%>" onclick="return confirm('Delete?')">Delete</a></td>
  </tr>
<%
      }
  }
%>
</tbody></table></section></main><script src="js/gsap-init.js"></script></body></html>
