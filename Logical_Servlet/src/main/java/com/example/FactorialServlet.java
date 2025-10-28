package com.example;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/factorial")
public class FactorialServlet extends GenericServlet {
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        res.setContentType("text/plain");
        PrintWriter pw = res.getWriter();
        String numStr = req.getParameter("num");

        if (numStr == null || numStr.isEmpty()) {
            pw.println("⚠️ Please provide a number (e.g., ?num=6)");
            return;
        }

        try {
            int num = Integer.parseInt(numStr);
            long fact = 1;
            for (int i = 1; i <= num; i++) fact *= i;

            pw.println("Factorial of " + num + " is " + fact + " 🧠");
        } catch (NumberFormatException e) {
            pw.println("⚠️ Invalid input!");
        }
    }
}
