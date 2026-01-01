package com.project.customer_module.product_management;



import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.project.product_management.ProductBean;

@WebServlet("/viewcustomerproducts")
public class ViewCustomerProductsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if (session == null) {
            req.getRequestDispatcher("CustomerLogin.html").forward(req, res);
        } else {

            ArrayList<ProductBean> list =
                    new ViewCustomerProductDAO().viewProducts();

            req.setAttribute("CustomerProductList", list);

            req.getRequestDispatcher("ViewProduct(customer).jsp").forward(req, res);
        }
    }
}
