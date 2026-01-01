package com.achyuta.registration;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserLoginDAO {

	public UserBean checkUser(String userName,String password)
	  {
		  UserBean ub=null;
		  try {
			  Connection con = DBConnect.getConnection(); 
			  PreparedStatement pstmt = con.prepareStatement("select * from registration where USERNAME=? and PASSWORD=?");
			  pstmt.setString(1, userName);
			  pstmt.setString(2, password);
			  ResultSet rs = pstmt.executeQuery();
			 
			  
			  while(rs.next()) {
				  ub = new UserBean();
				  ub.setUserName(rs.getString("USERNAME"));
				  ub.setPassword(rs.getString("PASSWORD"));
				  ub.setFirstName(rs.getString("FIRSTNAME"));
				  ub.setLastName(rs.getString("LASTNAME"));
				  ub.setMail(rs.getString("MAILID"));
				  ub.setPhone(rs.getString("PHONE"));
				  
			  }
		  }
		   catch(Exception e)
		  {
			   e.printStackTrace();
		  }
		  
		  return ub;
	  }
}
