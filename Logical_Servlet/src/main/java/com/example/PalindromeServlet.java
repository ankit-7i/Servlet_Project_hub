package com.example;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/palindrome")
public class PalindromeServlet extends GenericServlet {
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        res.setContentType("text/plain");
        PrintWriter pw = res.getWriter();
        String numStr = req.getParameter("num");

        if (numStr == null || numStr.isEmpty()) {
            pw.println("⚠️ Please provide a number (e.g., ?num=121)");
            return;
        }

        int num;
        try {
            num = Integer.parseInt(numStr);
        } catch (NumberFormatException e) {
            pw.println("⚠️ Invalid input!");
            return;
        }

        int rev = 0, temp = num;
        while (temp > 0) {
            rev = rev * 10 + temp % 10;
            temp /= 10;
        }

        pw.println(rev == num ? num + " is a Palindrome number 🔄" : num + " is not a Palindrome number ❌");
    }
}
