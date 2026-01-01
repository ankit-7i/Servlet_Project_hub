package com.achyuta.registration;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/update")
public class UserUpdateServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		  Cookie[] cookies = req.getCookies();
		  String fname=null;
		  if(cookies==null)
		  {
			  req.setAttribute("msg","Session Expired");
			  req.getRequestDispatcher("register.jsp").forward(req, resp);
		  }
		  else
		  {
			  ServletContext context = req.getServletContext();
			  UserBean userBean =(UserBean)context.getAttribute("userBean");
			  // userBean.setUserName(req.getParameter("uname"));
			  userBean.setFirstName(req.getParameter("fname"));
			  userBean.setLastName(req.getParameter("lname"));
			  userBean.setMail(req.getParameter("mailid"));
			  userBean.setPhone(req.getParameter("phone"));
			  int row = new UpdateProfileDAO().updateDate(userBean);
			  if(row>0)
			  {
				  req.setAttribute("msg","Profile updated" );
				  for(Cookie c :cookies)
				  {
					  if("ck1".equals(c.getName()))
					  {
						  fname=c.getValue();
					  }
				  }
				  req.setAttribute("fname", fname);
				  req.getRequestDispatcher("updateprofile.jsp").forward(req, resp);;
			  }
			  else
			  {
				  
			  }
			  
			  
		  }
	}
}
