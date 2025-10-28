package com.example;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/fibonacci")
public class FibonacciServlet extends GenericServlet {
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        res.setContentType("text/plain");
        PrintWriter pw = res.getWriter();
        String numStr = req.getParameter("num");

        if (numStr == null || numStr.isEmpty()) {
            pw.println("⚠️ Please provide a term count (e.g., ?num=10)");
            return;
        }

        try {
            int n = Integer.parseInt(numStr);
            int a = 0, b = 1;

            pw.println("🔹 Fibonacci Series up to " + n + " terms:");
            for (int i = 1; i <= n; i++) {
                pw.print(a + (i < n ? " " : ""));
                int next = a + b;
                a = b;
                b = next;
            }
        } catch (NumberFormatException e) {
            pw.println("⚠️ Invalid input!");
        }
    }
}
