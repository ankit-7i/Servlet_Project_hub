package com.project.adminpage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/alog")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        AdminBean abean = new AdminLoginDAO().checkAdminLogin(
                req.getParameter("aname"),
                req.getParameter("apwd")
        );

        if (abean == null) {
            req.getRequestDispatcher("AdminLogin.html").forward(req, res);
        } else {
            HttpSession session = req.getSession(true);
            session.setAttribute("AdminBean", abean);

            req.getRequestDispatcher("AdminHome.jsp").forward(req, res);
        }
    }
}
