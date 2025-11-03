<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Marriage Eligibility Result</title>
<style>
body { font-family: Arial, sans-serif; background: linear-gradient(to right, #c8e6c9, #a5d6a7); text-align: center; }
.card { display: inline-block; background: white; padding: 20px; margin-top: 40px; border-radius: 12px; box-shadow: 0 0 10px rgba(0,0,0,0.12); text-align:left; width:360px; }
.card h2 { text-align:center; }
.label { font-weight:600; }
</style>
</head>
<body>
<div class="card">
    <h2>Valid User Data</h2>
    <p><span class="label">Name:</span> ${name}</p>
    <p><span class="label">Age:</span> ${age}</p>
    <p><span class="label">Country:</span> ${country}</p>
    <p><span class="label">Aadhar Number:</span> ${adhar}</p>
    <hr/>
    <%
        Boolean eligible = (Boolean) request.getAttribute("eligible"); 
        String gender = (String) request.getAttribute("gender"); 
        String prefix = "";
        if (gender != null) prefix = gender.equalsIgnoreCase("Male") ? "Mr." : "Ms.";
    %>
    <h3 style="text-align:center;">
    <% if (eligible != null && eligible) { %>
        <%= prefix %> <%= request.getAttribute("name") %> is <b>Eligible</b> for marriage.<br/>
        Think one more time before taking the decision!
    <% } else { %>
        <%= prefix %> <%= request.getAttribute("name") %> is <b>Not Eligible</b> for marriage.<br/>
        Stay happy! Don’t be in a hurry.
    <% } %>
    </h3>
    <p style="text-align:center;"><a href="PersonData.html">Back to form</a></p>
</div>
</body>
</html>
