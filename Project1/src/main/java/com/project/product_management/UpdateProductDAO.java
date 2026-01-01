package com.project.product_management;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.project.dbinfo.DatabaseConnection;

public class UpdateProductDAO 
{
	
	 public int updateProduct(ProductBean pb) {

	        int rowCount = 0;

	        try {
	            Connection con = DatabaseConnection.connect();

	            PreparedStatement pstmt = con.prepareStatement(
	                "UPDATE product121 SET pprice = ?, pqty = ? WHERE pcode = ?"
	            );

	            pstmt.setString(1, pb.getP_price());
	            pstmt.setString(2, pb.getP_qty());
	            pstmt.setString(3, pb.getP_code());

	            rowCount = pstmt.executeUpdate();
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }

	        return rowCount;
	    }
}