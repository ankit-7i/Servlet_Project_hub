package com.pack1.dbinfo;



import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {

    private DatabaseConnection() {}

    public static Connection connect() {
        Connection con = null;

        try {
            Class.forName(DBConfig.get("db.driver"));

            con = DriverManager.getConnection(
                    DBConfig.get("db.url"),
                    DBConfig.get("db.username"),
                    DBConfig.get("db.password")
            );

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}
