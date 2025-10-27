package com.servlet.pack1;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.GenericServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/ls")
public class ThirdServlet extends GenericServlet {
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        PrintWriter pw = res.getWriter();
        res.setContentType("text/html");

        String user_name = req.getParameter("uname");
        String user_password = req.getParameter("upwd");

        pw.println("<!DOCTYPE html>");
        pw.println("<html>");
        pw.println("<head><title>Login Result</title>");
        pw.println("<style>");
        pw.println("body { font-family: Arial, sans-serif; text-align: center; margin-top: 50px; }");
        pw.println("h1 { color: #333; }");
        pw.println("</style>");
        pw.println("</head>");
        pw.println("<body>");

        if ("Ankit".equalsIgnoreCase(user_name) && "ankit123".equals(user_password)) {
            pw.println("<h1>Welcome " + user_name + ", you did the task!</h1>");
        } else {
            pw.println("<h1>Invalid Credentials</h1>");
            pw.println("<p><a href='javascript:history.back()'>Try Again</a></p>");
        }

        pw.println("</body>");
        pw.println("</html>");
    }
}
