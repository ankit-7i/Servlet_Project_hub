package com.app.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
    private static Connection con;

    static {
        try {
            // Oracle JDBC driver (ojdbc11.jar recommended for Java 17)
            Class.forName("oracle.jdbc.OracleDriver");
            con = DriverManager.getConnection(DBInfo.URL, DBInfo.USER, DBInfo.PASS);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private ConnectionProvider() {}

    public static Connection getConnection() {
        return con;
    }
}
