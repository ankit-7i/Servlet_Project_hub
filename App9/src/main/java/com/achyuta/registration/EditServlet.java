package com.achyuta.registration;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/editprofile")
public class EditServlet extends HttpServlet {
    
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Cookie[] cookies = req.getCookies();
		String fname=null;
		if(cookies==null)
		{
			req.setAttribute("msg", "Session Expired");
			req.getRequestDispatcher("register.jsp").forward(req, resp);
		}
		else
		{
			for(Cookie c:cookies)
			{
				if("ck1".equals(c.getName()))
				{
					fname = c.getValue();
				}
			}
			req.setAttribute("fname", fname);
			req.getRequestDispatcher("EditProfile.jsp").forward(req, resp);
		}
	}
}
