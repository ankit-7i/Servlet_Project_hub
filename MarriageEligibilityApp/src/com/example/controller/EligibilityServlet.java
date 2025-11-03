package com.example.controller;

import java.io.IOException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/eligible")
public class EligibilityServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        String ageStr = req.getParameter("age");
        String adhar = req.getParameter("adharNumber");
        String country = req.getParameter("country");
        String gender = req.getParameter("gender");

        int age = 0;
        boolean eligible = false;

        try {
            age = Integer.parseInt(ageStr);
        } catch (NumberFormatException e) {
            age = 0;
        }

        if (age > 0) {
            if ("Male".equalsIgnoreCase(gender) && age > 21 && age < 60)
                eligible = true;
            else if ("Female".equalsIgnoreCase(gender) && age > 18 && age < 60)
                eligible = true;
        }

        req.setAttribute("name", name);
        req.setAttribute("age", age);
        req.setAttribute("adhar", adhar);
        req.setAttribute("country", country);
        req.setAttribute("gender", gender);
        req.setAttribute("eligible", eligible);

        RequestDispatcher rd = req.getRequestDispatcher("data.jsp");
        rd.forward(req, res);
    }
}
