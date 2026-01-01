package com.achyuta.registration;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UserRegisterDAO {
	
	public int insert(UserBean user) {
		int result=0;
		try {
			Connection con = DBConnect.getConnection();
			PreparedStatement pstmt = con.prepareStatement("insert into registration values(?,?,?,?,?,?)");
			pstmt.setString(1, user.getUserName());
			pstmt.setString(2,user.getPassword());
			pstmt.setString(3, user.getFirstName());
			pstmt.setString(4,user.getLastName());
			pstmt.setString(5,user.getMail());
			pstmt.setString(6,user.getPhone());
			result = pstmt.executeUpdate();
		}
		 catch(Exception e)
		{
			e.printStackTrace(); 
		}
		return result;
	}
	

}
