package com.pack1;

import java.io.IOException;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/dis")
public class DisplayServlet extends HttpServlet{
	protected void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException ,IOException{
		ServletContext contex = req.getServletContext();
		contex.setAttribute("msg1", "Java is Awesome");
		
		ServletConfig config = this.getServletConfig();
		
		req.setAttribute("msg3", config.getServletName());
		
		req.setAttribute("msg4", config.getInitParameter("msg4"));
		req.getRequestDispatcher("Display.jsp").forward(req, res);
		
		
		
		}

}
