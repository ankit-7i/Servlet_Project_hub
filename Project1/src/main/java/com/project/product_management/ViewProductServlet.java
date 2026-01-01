package com.project.product_management;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/view1")
public class ViewProductServlet extends HttpServlet {
	
	
	@Override
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException{
		HttpSession session = req.getSession(false);
		if (session == null) {
			req.getRequestDispatcher("AdminLogin.html").forward(req, res);
		}
		else {
			ArrayList<ProductBean> al = new ViewProductDAO().viewProducts();
			session.setAttribute("ProductList", al);
			req.getRequestDispatcher("ViewProduct.jsp").forward(req, res);
		}
	}

}
