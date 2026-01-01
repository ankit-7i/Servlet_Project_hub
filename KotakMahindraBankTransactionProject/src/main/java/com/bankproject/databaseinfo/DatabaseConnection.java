package com.bankproject.databaseinfo;

import java.sql.Connection;
import java.sql.DriverManager;



public class DatabaseConnection {
	 private static Connection con = null;

	    private DatabaseConnection() { }

	    static
	    {
	        try
	        {
	            Class.forName("oracle.jdbc.driver.OracleDriver");
	            con = DriverManager.getConnection(
	                    DatabaseInfo.dbURL, 
	                    DatabaseInfo.dbUName, 
	                    DatabaseInfo.dbUPwd
	            );
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
