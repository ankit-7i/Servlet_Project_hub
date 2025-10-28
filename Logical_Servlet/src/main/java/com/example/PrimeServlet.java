package com.example;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/prime")
public class PrimeServlet extends GenericServlet {
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        res.setContentType("text/plain");
        PrintWriter pw = res.getWriter();
        String numStr = req.getParameter("num");

        if (numStr == null || numStr.trim().isEmpty()) {
            pw.println("⚠️ Please provide a number (e.g., ?num=17)");
            return;
        }

        int num;
        try {
            num = Integer.parseInt(numStr);
        } catch (NumberFormatException e) {
            pw.println("⚠️ Invalid input! Please enter a valid number.");
            return;
        }

        boolean isPrime = num > 1;
        for (int i = 2; i <= num / 2 && isPrime; i++) {
            if (num % i == 0) isPrime = false;
        }

        pw.println(isPrime ? num + " is a Prime number ✅" : num + " is not a Prime number ❌");
    }
}
