package com.pack1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserLoginDAO {
	
	public UserBean retriveData(String uname , String upwd) {
		UserBean ub = null;
		Connection con = DBConnect.connect();
		try {
			PreparedStatement pstmt = con.prepareStatement("Select * from registration where username =? and password =?");
			
			pstmt.setString(1 ,uname);
			pstmt.setString(2, upwd);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ub= new UserBean();
				ub.setU_Name(rs.getString(1));
				ub.setU_Pwd(rs.getString(2));
				ub.setU_Fname(rs.getString(3));
				ub.setU_Lname(rs.getString(4));
				ub.setU_Mail(rs.getString(5));
				ub.setU_ph(rs.getString(6));
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return ub;
	}

}
