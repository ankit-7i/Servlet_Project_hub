package com_student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateprofileDAO {
	public int updateData(Userbean ub)
	{
		int rowcount=0;
		Connection con=DBConnect.connect();
		try {
			PreparedStatement pstmt=con.prepareStatement("update  student_session set phone=? where id=?");
			
			pstmt.setString(1, ub.getPhone());
			pstmt.setString(2,ub.getId());
			rowcount=pstmt.executeUpdate();
		} catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rowcount;
		
	}
}
