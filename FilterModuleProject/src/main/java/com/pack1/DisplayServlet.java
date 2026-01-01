package com.pack1;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

public class DisplayServlet implements Filter {
	
	FilterConfig fcg;
	@Override
	public void init(FilterConfig cfg) {
		this.fcg = cfg;
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain fc)
			throws IOException, ServletException {
		req.setAttribute("Filtername", fcg.getFilterName());
		req.getRequestDispatcher("Display.jsp").forward(req, res);
		
	}
 
}
