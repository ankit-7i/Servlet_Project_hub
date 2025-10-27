package com.servlet.pack1;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.GenericServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/gh")
public class FirstServlet extends GenericServlet {

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        
        res.setContentType("text/html");
        PrintWriter pw = res.getWriter();

      
        String user_name = req.getParameter("uname");
        String user_email = req.getParameter("uemail");
        String user_phone = req.getParameter("uphone");
        String user_password = req.getParameter("upwd");
        String user_date = req.getParameter("udate");

        
        System.out.println("Full Name : " + user_name);
        System.out.println("Email : " + user_email);
        System.out.println("Phone Number : " + user_phone);
        System.out.println("Password : " + user_password);
        System.out.println("Date of Birth : " + user_date);

        
        pw.println("<html><body style='font-family:Poppins, sans-serif; text-align:center; background:linear-gradient(135deg,#43cea2,#185a9d); color:white;'>");
        pw.println("<div style='background-color:rgba(0,0,0,0.5); padding:30px; border-radius:20px; display:inline-block; margin-top:50px;'>");
        pw.println("<h2>Registration Successful!</h2>");
        pw.println("<p><b>Full Name:</b> " + user_name + "</p>");
        pw.println("<p><b>Email:</b> " + user_email + "</p>");
        pw.println("<p><b>Phone Number:</b> " + user_phone + "</p>");
        pw.println("<p><b>Password:</b> " + user_password + "</p>");
        pw.println("<p><b>Date of Birth:</b> " + user_date + "</p>");
        pw.println("</div></body></html>");
        
    }
}
