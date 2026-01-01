<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Train Ticket Booking Details</title>
  <style>
    body{font-family:Arial;margin:30px}
    table{border-collapse:collapse;width:600px}
    td,th{border:1px solid #ddd;padding:10px}
    th{background:#f5f5f5}
  </style>
</head>
<body>
  <h2>Train Ticket Booking Details</h2>
  <table>
    <tr><th>Detail</th><th>Value</th></tr>
    <tr><td>Passenger</td><td>${ticket.pname}</td></tr>
    <tr><td>Age</td><td>${ticket.age}</td></tr>
    <tr><td>Phone</td><td>${ticket.phone}</td></tr>
    <tr><td>Train Name</td><td>${ticket.train}</td></tr>
    <tr><td>No. of Passengers</td><td>${ticket.passengers}</td></tr>
    <tr><td>Source</td><td>${ticket.source}</td></tr>
    <tr><td>Destination</td><td>${ticket.destination}</td></tr>
    <tr><td>Gender</td><td>${ticket.gender}</td></tr>
    <tr><td>Class Type</td><td>${ticket.classType}</td></tr>
    <tr><td>Facilities</td><td>${ticket.facilities}</td></tr>
    <tr><td>Berth</td><td>${ticket.berth}</td></tr>
    <tr><th>Total Price</th><th>Rs. ${ticket.price}</th></tr>
  </table>

  <p style="margin-top:20px;">
    <a href="booking.html">Book another ticket</a>
  </p>
</body>
</html>
