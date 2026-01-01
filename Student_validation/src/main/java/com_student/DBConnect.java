package com_student;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect implements DBInfo
{
	private static Connection con=null;
	private DBConnect()
	{
		
	}
	static
	{
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection(DBInfo.url,DBInfo.dbusername,DBInfo.password);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public static Connection connect()
	{
		return con;
	}
}
