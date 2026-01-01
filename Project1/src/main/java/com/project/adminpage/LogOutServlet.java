package com.project.adminpage;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogOutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        // If no session → go to login page
        if (session == null) {
            req.getRequestDispatcher("AdminLogin.html").forward(req, res);
            return;
        }

        // If session exists → invalidate & forward to logout page
        session.invalidate();
        req.getRequestDispatcher("Logout.jsp").forward(req, res);
    }
}

