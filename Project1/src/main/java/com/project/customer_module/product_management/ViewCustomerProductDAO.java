package com.project.customer_module.product_management;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.project.dbinfo.DatabaseConnection;
import com.project.product_management.ProductBean;

public class ViewCustomerProductDAO {

    public ArrayList<ProductBean> viewProducts() {

        ArrayList<ProductBean> al = new ArrayList<>();

        try {
            Connection con = DatabaseConnection.connect();
            PreparedStatement pstmt = con.prepareStatement("select * from product121");
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                ProductBean pb = new ProductBean();
                pb.setP_code(rs.getString(1));
                pb.setP_name(rs.getString(2));
                pb.setP_company(rs.getString(3));
                pb.setP_price(rs.getString(4));
                pb.setP_qty(rs.getString(5));

                al.add(pb);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return al;
    }
}
