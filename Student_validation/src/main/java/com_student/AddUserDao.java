package com_student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddUserDao
{
public int insertdata(Userbean ub)
{
	int rowcount=0;
	Connection con=DBConnect.connect();
	try {
		PreparedStatement pstmt= con.prepareStatement(" insert into student_session values(?,?,?)");
		pstmt.setString(1,ub.getId());
		pstmt.setString(2, ub.getName());
		pstmt.setString(3,ub.getPhone());
		rowcount=pstmt.executeUpdate();
	} 
	catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return rowcount;
	
}
}
