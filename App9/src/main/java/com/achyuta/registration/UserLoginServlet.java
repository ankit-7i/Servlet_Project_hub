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
@WebServlet("/logins")
public class UserLoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//UserBean bean = new UserBean();
		UserLoginDAO dao = new UserLoginDAO();
		
		
		String userName = req.getParameter("loginname");
		UserBean checkUser = dao.checkUser(userName,req.getParameter("passwordlogin"));
		if(checkUser==null)
		{

			req.setAttribute("msg", "Invalid credential");
			req.getRequestDispatcher("register.jsp").forward(req, resp);
			
		}
		else{
			ServletContext context = getServletContext();
			context.setAttribute("userBean", checkUser);
			Cookie c = new Cookie("ck1", checkUser.getFirstName());
			
			resp.addCookie(c);
			
			req.getRequestDispatcher("Home.jsp").forward(req, resp);
		}
		
	}
}
