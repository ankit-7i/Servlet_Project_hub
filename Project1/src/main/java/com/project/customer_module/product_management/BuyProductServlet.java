package com.project.customer_module.product_management;



import java.io.IOException;

import com.project.product_management.ProductBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/buyproduct")
public class BuyProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String pcode = req.getParameter("pcode");

        ProductBean pb = new BuyProductDAO().getProduct(pcode);

        req.setAttribute("ProductInfo", pb);

        req.getRequestDispatcher("buyproduct.jsp").forward(req, res);
    }
}
