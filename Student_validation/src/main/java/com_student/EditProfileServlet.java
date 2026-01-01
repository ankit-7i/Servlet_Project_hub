package com_student;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/edit")
public class EditProfileServlet extends HttpServlet
{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cookie arr[]=req.getCookies();
		String fname=null;
		
		if(arr==null)
		{
			req.setAttribute("msg","Session Expired");
			req.getRequestDispatcher("Register.jsp").forward(req, resp);
		}
		else
		{
			for(Cookie c:arr)
			{
				if("ck1".equals(c.getName()))
				{
					fname=c.getValue();
				}
				req.setAttribute("fname",fname);
				req.getRequestDispatcher("editprofile.jsp").forward(req, resp);;
			}
		}
	}

}
