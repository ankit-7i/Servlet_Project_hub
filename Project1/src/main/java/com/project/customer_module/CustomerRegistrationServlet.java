package com.project.customer_module;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cusreg")
public class CustomerRegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        CustomerBean bean = new CustomerBean();

        bean.setCusuname(req.getParameter("cusuname"));
        bean.setCuspwd(req.getParameter("cuspwd"));
        bean.setCusfname(req.getParameter("cusfname"));
        bean.setCuslname(req.getParameter("cuslname"));
        bean.setCusaddr(req.getParameter("cusaddr"));
        bean.setCusmail(req.getParameter("cusmail"));
        bean.setCusmob(req.getParameter("cusmob"));

        CustomerRegisterDAO dao = new CustomerRegisterDAO();
        int result = dao.addCustomer(bean);

        if (result >= 1) {
            req.setAttribute("msg", "Registration Successful!");
            req.getRequestDispatcher("CustomerLogin.html").forward(req, res);
        } else {
            req.setAttribute("msg", "Registration Failed!");
            req.getRequestDispatcher("CustomerRegister.html").include(req, res);
        }
    }
}
