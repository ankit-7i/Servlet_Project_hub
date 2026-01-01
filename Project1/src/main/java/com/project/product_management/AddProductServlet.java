package com.project.product_management;

import java.io.IOError;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/aps")
public class AddProductServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException ,IOException
	{
			try {
				HttpSession session = req.getSession(false);
				
				if(session == null) {
					req.getRequestDispatcher("AdminLogin.html").forward(req, res);
				}
				else {
					ProductBean pb = new ProductBean();
					pb.setP_code(req.getParameter("pcode"));
					pb.setP_name(req.getParameter("pname"));
					pb.setP_company(req.getParameter("pcompany"));
					pb.setP_price(req.getParameter("pprice"));
					pb.setP_qty(req.getParameter("pqty"));
					
					
					int rowCount = new AddProductDAO().insertProduct(pb);
					
					if(rowCount > 0) {
						req.setAttribute("msg", "Products added to the Inventory");
						req.getRequestDispatcher("AddProduct.jsp").forward(req, res);
					}
					/*
					else 
						throw new RuntimeException("Admin ! Product Inventory Not Updated , Please try again ");
					*/
				}
			}
			catch(Exception e) {
				req.setAttribute("msg", "Duplicate productId's are not allowed");
				req.getRequestDispatcher("Error.jsp").forward(req, res);
				
			}
	}

}
