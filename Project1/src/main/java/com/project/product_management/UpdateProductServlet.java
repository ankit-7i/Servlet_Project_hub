package com.project.product_management;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update")
public class UpdateProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) 
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        // Check if admin is logged in
        if (session == null) {
            req.getRequestDispatcher("AdminLogin.html").forward(req, res);
            return;
        }

        // Get product code to update
        String pcode = req.getParameter("pcode");

        // Retrieve product list from session
        ArrayList<ProductBean> al =
                (ArrayList<ProductBean>) session.getAttribute("ProductList");

        Iterator<ProductBean> i = al.iterator();
        ProductBean pb = null;

        // Find matching product
        while (i.hasNext()) {
            pb = i.next();
            if (pcode.equals(pb.getP_code())) {
                break;
            }
        }

        // Update modified fields
        pb.setP_price(req.getParameter("pprice"));
        pb.setP_qty(req.getParameter("pqty"));

        // DAO update call
        int rowCount = new UpdateProductDAO().updateProduct(pb);

        if (rowCount > 0) {
            req.setAttribute("msg", "Product inventory updated!!!!");
            req.getRequestDispatcher("UpdateProduct.jsp").forward(req, res);
        } else {
            throw new RuntimeException("Product inventory updation failed");
        }
    }
}
