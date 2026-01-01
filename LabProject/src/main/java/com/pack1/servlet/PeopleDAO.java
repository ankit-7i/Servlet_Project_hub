package com.pack1.servlet;


import java.sql.Connection;
import java.sql.PreparedStatement;

import com.pack1.dbinfo.DatabaseConnection;
import com.pack1.PeopleBean;

public class PeopleDAO {

    public int save(PeopleBean people) {
        int status = 0;

        try {
            Connection con = DatabaseConnection.connect();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO people (name, age, aadhar, address) VALUES (?, ?, ?, ?)"
            );

            ps.setString(1, people.getName());
            ps.setInt(2, people.getAge());
            ps.setString(3, people.getAadhar());
            ps.setString(4, people.getAddress());

            status = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}
