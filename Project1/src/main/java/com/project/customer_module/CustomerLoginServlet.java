package com.project.customer_module;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/customerlogin")
public class CustomerLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String uname = req.getParameter("cusname");   
        String pword = req.getParameter("cuspwd");    

        CustomerLoginDAO dao = new CustomerLoginDAO();
        CustomerBean cb = dao.checkCustomer(uname, pword);

        if (cb == null) {
            req.setAttribute("msg", "Invalid Credentials");
            req.getRequestDispatcher("CustomerLogin.html").forward(req, resp);
        } 
        else {
            ServletContext context = getServletContext();
            context.setAttribute("customerBean", cb);

            Cookie ck = new Cookie("customerCookie", cb.getCusfname());
            resp.addCookie(ck);

            req.getRequestDispatcher("CustomerHome.jsp").forward(req, resp);
        }
    }
}


