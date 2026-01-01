package com.app.servlet;

import com.app.dao.AdminDAO;
import com.app.model.AdminBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String uname = req.getParameter("uname");
        String pwd   = req.getParameter("pwd");

        AdminBean admin = new AdminDAO().validate(uname, pwd);

        if (admin == null) {
            req.setAttribute("msg", "Invalid username or password");
            req.getRequestDispatcher("login.html").forward(req, res);
        } else {
            HttpSession session = req.getSession(true);
            session.setAttribute("admin", admin);
            req.getRequestDispatcher("booking.html").forward(req, res);
        }
    }
}
