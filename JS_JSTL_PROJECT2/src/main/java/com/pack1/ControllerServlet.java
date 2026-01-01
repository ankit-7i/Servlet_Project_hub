package com.pack1;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/dis")
public class ControllerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) 
            throws ServletException, IOException {

        ServletContext context = getServletContext();
        HttpSession session = req.getSession();

        // Setting attributes in all 4 scopes
        context.setAttribute("a", 100);    // applicationScope
        session.setAttribute("b", 200);    // sessionScope
        req.setAttribute("c", 300);        // requestScope
        req.setAttribute("uname", req.getParameter("uname")); // Username input

        // PageScope is not set in servlet (JSP will handle it)

        req.getRequestDispatcher("Display.jsp").forward(req, res);
    }
}
