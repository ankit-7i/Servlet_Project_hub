package com.achyuta.registration;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UpdateProfileDAO {

	public int updateDate(UserBean bean)
	{
		int result=0;
		try {
		Connection con = DBConnect.getConnection();
		PreparedStatement pstmt = con.prepareStatement("update registration set firstname=?,lastname=?,mailid=?,phone=? where username=? ");
		
		pstmt.setString(1,bean.getFirstName());
		pstmt.setString(2,bean.getLastName());
		pstmt.setString(3,bean.getMail());
		pstmt.setString(4,bean.getPhone());
		pstmt.setString(5,bean.getUserName());
		result = pstmt.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return result;
	}
}
