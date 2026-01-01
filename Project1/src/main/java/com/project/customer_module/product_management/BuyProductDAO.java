package com.project.customer_module.product_management;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.project.dbinfo.DatabaseConnection;
import com.project.product_management.ProductBean;

public class BuyProductDAO {

    public ProductBean getProduct(String pcode) {

        ProductBean pb = null;

        try {
            Connection con = DatabaseConnection.connect();
            PreparedStatement pstmt = con.prepareStatement("select * from product121 where pcode=?");
            pstmt.setString(1, pcode);

            ResultSet rs = pstmt.executeQuery();

            if(rs.next()) {
                pb = new ProductBean();
                pb.setP_code(rs.getString(1));
                pb.setP_name(rs.getString(2));
                pb.setP_company(rs.getString(3));
                pb.setP_price(rs.getString(4));
                pb.setP_qty(rs.getString(5));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return pb;
    }
}
