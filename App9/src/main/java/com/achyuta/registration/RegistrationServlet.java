package com.achyuta.registration;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/reg")
public class RegistrationServlet extends HttpServlet {

	  @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		  UserRegisterDAO dao = new UserRegisterDAO();
		  UserBean bean = new UserBean();
		  bean.setUserName(req.getParameter("userName"));
		  bean.setPassword(req.getParameter("password"));
		  bean.setFirstName(req.getParameter("fname"));
		  bean.setLastName(req.getParameter("lname"));
		  bean.setMail(req.getParameter("mail"));
		  bean.setPhone(req.getParameter("phone"));
		  int insert = dao.insert(bean);
		  if(insert>=1) {
			  System.out.println("insrted");
			  req.setAttribute("msg","Register successful");
			  req.getRequestDispatcher("register.jsp").forward(req, resp);
		  }
		  else {
			  System.out.println("Not ");
			  req.setAttribute("msg","Register unsuccessful");
			  req.getRequestDispatcher("register.jsp").include(req, resp);
		  }
	}
}
