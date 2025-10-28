package com.example;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/neon")
public class NeonServlet extends GenericServlet {
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        res.setContentType("text/plain");
        PrintWriter pw = res.getWriter();
        String numStr = req.getParameter("num");

        if (numStr == null || numStr.isEmpty()) {
            pw.println("⚠️ Please provide a number (e.g., ?num=9)");
            return;
        }

        try {
            int num = Integer.parseInt(numStr);
            int sq = num * num, sum = 0;
            while (sq > 0) {
                sum += sq % 10;
                sq /= 10;
            }

            pw.println(sum == num ? num + " is a Neon number 💡" : num + " is not a Neon number ❌");
        } catch (NumberFormatException e) {
            pw.println("⚠️ Invalid input!");
        }
    }
}
