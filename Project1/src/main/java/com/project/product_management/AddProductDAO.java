package com.project.product_management;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.project.dbinfo.DatabaseConnection;

public class AddProductDAO  {
	public int insertProduct(ProductBean pb) throws Exception {
		int rowCount = 0;
		
		try {
			Connection con = DatabaseConnection.connect();
			PreparedStatement pstmt = con.prepareStatement("insert into product121 values(?,?,?,?,?)");
			pstmt.setString(1, pb.getP_code());
			pstmt.setString(2, pb.getP_name());
			pstmt.setString(3, pb.getP_company());
			pstmt.setString(4, pb.getP_price());
			pstmt.setString(5, pb.getP_qty());
			
			rowCount = pstmt.executeUpdate();
			
			
			
		}catch(Exception e) {
			//e.printStackTrace();
			throw e;
		}
		
		
		return rowCount;
	}

}
