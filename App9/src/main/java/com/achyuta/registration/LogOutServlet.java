package com.achyuta.registration;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@SuppressWarnings("serial")
@WebServlet("/logout")
public class LogOutServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Cookie[] cookies = req.getCookies();
		if(cookies==null) {
			req.setAttribute("msg","Session Expired");
			req.getRequestDispatcher("register.jsp").forward(req, resp);
		}
		else {
			ServletContext context = req.getServletContext();
			context.removeAttribute("userBean");
			cookies[0].setMaxAge(0);
			resp.addCookie(cookies[0]);
			req.setAttribute("msg","user logged out sussessfully");
			req.getRequestDispatcher("register.jsp").forward(req, resp);
			
			
			
		}
		
	}
}
