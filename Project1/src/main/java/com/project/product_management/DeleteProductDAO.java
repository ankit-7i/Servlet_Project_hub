package com.project.product_management;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.project.dbinfo.DatabaseConnection;

public class DeleteProductDAO {

    public int deleteProduct(String pcode) {

        int rowCount = 0;

        try {
            Connection con = DatabaseConnection.connect();
            PreparedStatement pstmt = con.prepareStatement(
                    "DELETE FROM product121 WHERE pcode = ?"
            );

            pstmt.setString(1, pcode);

            rowCount = pstmt.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }

        return rowCount;
    }
}

