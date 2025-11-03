package com.example.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/validate")
public class ValidationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        String ageStr = req.getParameter("age");
        String adhar = req.getParameter("adharNumber");
        String country = req.getParameter("country");
        String gender = req.getParameter("gender");

        String message = null;
        boolean valid = true;

        if (name == null || name.trim().isEmpty()) {
            valid = false;
            message = "Name cannot be empty.";
        } else if (adhar == null || !adhar.matches("\\\\d{12}") || adhar.equals("000000000000")) {
            valid = false;
            message = "Aadhar number must be 12 digits and not all zeros.";
        }

        if (!valid) {
            res.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = res.getWriter()) {
                out.println("<div style='font-family:Arial, sans-serif; color:#b71c1c; text-align:center;'>");
                out.println("<h3>" + message + "</h3>");
                out.println("<p><a href='PersonData.html'>Go back to form</a></p>");
                out.println("</div>");
            }
            RequestDispatcher rd = req.getRequestDispatcher("PersonData.html");
            rd.include(req, res);
            return;
        }

        // forward to eligibility servlet
        RequestDispatcher rd = req.getRequestDispatcher("eligible");
        rd.forward(req, res);
    }
}
