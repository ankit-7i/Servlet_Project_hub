package com.pack1;

import java.sql.Connection;
import java.sql.DriverManager;



public class DBConnect {
	 private DBConnect() {}

	    public static Connection connect() 
	    {
	        Connection con = null;
	        try {
	            Class.forName("oracle.jdbc.driver.OracleDriver");

	            con = DriverManager.getConnection(
	                    DBInfo.dbURL,
	                    DBInfo.dbUName,
	                    DBInfo.dbUPwd
	            );

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return con;
	    }

}
