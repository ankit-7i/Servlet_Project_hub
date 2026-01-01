package com_student;

import java.io.IOException;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/login")
public class LoginServlet extends HttpServlet 
	{

		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		LoginDAO DAOObj=new LoginDAO();
		Userbean ub=DAOObj.checklogin(req.getParameter("id"),req.getParameter("name"));
		 if(ub==null)
		 {
			 req.setAttribute("msg", "Invalid login Credentials");
			 req.getRequestDispatcher("Register.jsp").forward(req, resp);
		 }
		 else
		 {
			 ServletContext context=req.getServletContext();
			 context.setAttribute("Userbean", ub);
			 Cookie c=new Cookie("ck1",ub.getName());
			 resp.addCookie(c);
			 req.getRequestDispatcher("home.jsp").forward(req, resp);
			 
		 }
		}
	}
