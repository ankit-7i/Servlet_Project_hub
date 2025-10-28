package com.example;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/table")
public class TableServlet extends GenericServlet {
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        res.setContentType("text/plain");
        PrintWriter pw = res.getWriter();
        String numStr = req.getParameter("num");

        if (numStr == null || numStr.isEmpty()) {
            pw.println("⚠️ Please provide a number (e.g., ?num=5)");
            return;
        }

        try {
            int num = Integer.parseInt(numStr);
            pw.println("📘 Multiplication Table of " + num + ":");
            for (int i = 1; i <= 10; i++) {
                pw.println(num + " × " + i + " = " + (num * i));
            }
        } catch (NumberFormatException e) {
            pw.println("⚠️ Invalid input!");
        }
    }
}
