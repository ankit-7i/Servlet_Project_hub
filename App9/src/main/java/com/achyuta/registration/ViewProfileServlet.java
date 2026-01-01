package com.achyuta.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ViewProfileServlet
 */
@WebServlet("/viewprofile")
public class ViewProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie[] cookies = request.getCookies();
		String fname=null;
		if(cookies==null)
		{
			request.setAttribute("msg","Session expired");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
		else
		{
		   for(Cookie cookie:cookies)
		   {
			   if("ck1".equals(cookie.getName()))
			   {
				   fname=cookie.getValue();
			   }
		   }
		   request.setAttribute("fname", fname);
		   request.getRequestDispatcher("viewprofile.jsp").forward(request, response);
		}
	}

	

}
