package com_student;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/update")
public class UpdateProfileServlet extends HttpServlet
{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Cookie arr[] = req.getCookies();
        String fname = null;

        if(arr == null)
        {
            req.setAttribute("msg","Session Expired");
            req.getRequestDispatcher("Register.jsp").forward(req, resp);
            return;
        }

        ServletContext context = req.getServletContext();
        Userbean ub = (Userbean)context.getAttribute("Userbean");

        	
        ub.setPhone(req.getParameter("phone"));

        int rowcount = new UpdateprofileDAO().updateData(ub);

        if(rowcount > 0)
        {
            req.setAttribute("msg", "Profile Updated");
            for(Cookie c : arr)
            {
                if("ck1".equals(c.getName()))
                {
                    fname = c.getValue();
                    break;
                }
            }

            req.setAttribute("fname", fname);
            req.getRequestDispatcher("updateprofile.jsp").forward(req, resp);
        }
        else
        {
            throw new RuntimeException("Technical Error");
        }
    }
}
