package com.achyuta.registration;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	  private static Connection con=null;
	  static {
		  try {
			  Class.forName(DBInfo.DB_NAME);
			  con = DriverManager.getConnection(DBInfo.URL,DBInfo.USER,DBInfo.PASS);
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
	  }
	  public static Connection getConnection() {
		  return con;
	  }
}
