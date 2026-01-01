package com.pack1;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;


@WebFilter("/log")
public class LoginFilter  implements Filter{

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain fc)
			throws IOException, ServletException {
		UserBean  ub  = new UserLoginDAO().retriveData(req.getParameter("uname"), req.getParameter("upwd"));
		if(ub==null) {
			throw new RuntimeException("Invalid Log in Credentials");
		}
		else {
			req.setAttribute("ubean", ub);
			fc.doFilter(req, res);
		}
		
	}

}
