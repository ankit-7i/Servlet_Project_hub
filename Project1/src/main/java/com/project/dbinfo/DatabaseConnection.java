package com.project.dbinfo;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {

    private DatabaseConnection() { }

    public static Connection connect() 
    {
        Connection con = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            con = DriverManager.getConnection(
                    DatabaseInformation.dbURL,
                    DatabaseInformation.dbUName,
                    DatabaseInformation.dbUPwd
            );

        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
