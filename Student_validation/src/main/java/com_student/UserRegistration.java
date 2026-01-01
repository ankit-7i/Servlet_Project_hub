package com_student;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/reg")
public class UserRegistration extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 Userbean ub=new Userbean();
	 ub.setId(req.getParameter("id"));
	 ub.setName(req.getParameter("name"));
	 ub.setPhone(req.getParameter("phone"));
	 AddUserDao add=new AddUserDao();
	 int rowcount=add.insertdata(ub);
	 if(rowcount==0)
		{
			req.setAttribute("msg", "Data Not Inserted");
			req.getRequestDispatcher("Register.jsp").forward(req, resp);
		}
		else
		{
			req.setAttribute("msg", "Record inserted in the database");
			req.getRequestDispatcher("Register.jsp").forward(req, resp);
		}
	}

}
