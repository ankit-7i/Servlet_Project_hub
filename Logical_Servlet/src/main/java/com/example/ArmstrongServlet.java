package com.example;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/armstrong")
public class ArmstrongServlet extends GenericServlet {
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        res.setContentType("text/plain");
        PrintWriter pw = res.getWriter();
        String numStr = req.getParameter("num");

        if (numStr == null || numStr.isEmpty()) {
            pw.println("⚠️ Please provide a number (e.g., ?num=153)");
            return;
        }

        int num;
        try {
            num = Integer.parseInt(numStr);
        } catch (NumberFormatException e) {
            pw.println("⚠️ Invalid input!");
            return;
        }

        int temp = num, sum = 0, digits = String.valueOf(num).length();
        while (temp > 0) {
            int d = temp % 10;
            sum += Math.pow(d, digits);
            temp /= 10;
        }

        pw.println(sum == num ? num + " is an Armstrong number 💫" : num + " is not an Armstrong number ❌");
    }
}
