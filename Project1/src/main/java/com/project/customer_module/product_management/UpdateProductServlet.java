package com.project.customer_module.product_management;



import java.io.IOException;

import com.project.product_management.ProductBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateproduct")
public class UpdateProductServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String pcode = req.getParameter("pcode");
        int reqQty = Integer.parseInt(req.getParameter("reqqty"));

        ProductBean pb = new BuyProductDAO().getProduct(pcode);

        int price = Integer.parseInt(pb.getP_price());
        int totalAmount = price * reqQty;

        int updatedQty = Integer.parseInt(pb.getP_qty()) - reqQty;

        new UpdateProductDAO().updateQuantity(pcode, updatedQty);

        req.setAttribute("pb", pb);
        req.setAttribute("reqqty", reqQty);
        req.setAttribute("totalAmount", totalAmount);

        req.getRequestDispatcher("OrderConfirmed.jsp").forward(req, res);
    }
}
