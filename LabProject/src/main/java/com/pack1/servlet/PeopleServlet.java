package com.pack1.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.pack1.PeopleBean;


@WebServlet("/peopleservlet")
public class PeopleServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        String aadhar = req.getParameter("aadhar");
        String address = req.getParameter("addr");

     
        PeopleBean pb = new PeopleBean();
        pb.setName(name);
        pb.setAge(age);
        pb.setAadhar(aadhar);
        pb.setAddress(address);

       
        PeopleDAO dao = new PeopleDAO();
        int result = dao.save(pb);

        if (result > 0) {
          
            req.setAttribute("person", pb);
            req.getRequestDispatcher("Display.jsp").forward(req, res);
        } else {
            res.getWriter().println("<h3>Error: Could not save data.</h3>");
        }
    }
}
