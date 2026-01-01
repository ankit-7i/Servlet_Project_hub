package com.project.customer_module.product_management;



import java.sql.Connection;
import java.sql.PreparedStatement;

import com.project.dbinfo.DatabaseConnection;

public class UpdateProductDAO {

    public int updateQuantity(String pcode, int newQty) {

        int rowCount = 0;

        try {
            Connection con = DatabaseConnection.connect();
            PreparedStatement pstmt = con.prepareStatement(
                    "update product121 set pqty=? where pcode=?");

            pstmt.setInt(1, newQty);
            pstmt.setString(2, pcode);

            rowCount = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rowCount;
    }
}
