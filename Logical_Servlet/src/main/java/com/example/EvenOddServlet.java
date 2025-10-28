package com.example;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/evenodd")
public class EvenOddServlet extends GenericServlet {
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        res.setContentType("text/plain");
        PrintWriter pw = res.getWriter();
        String numStr = req.getParameter("num");

        if (numStr == null || numStr.isEmpty()) {
            pw.println("⚠️ Please provide a number (e.g., ?num=45)");
            return;
        }

        try {
            int num = Integer.parseInt(numStr);
            pw.println(num % 2 == 0 ? num + " is an Even number ⚙️" : num + " is an Odd number 🎯");
        } catch (NumberFormatException e) {
            pw.println("⚠️ Invalid input!");
        }
    }
}
