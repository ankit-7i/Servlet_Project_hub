package com.project.customer_module;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.project.dbinfo.DatabaseConnection;

public class CustomerRegisterDAO {

    public int addCustomer(CustomerBean cusb) {
        int rowCount = 0;

        try (Connection con = DatabaseConnection.connect();
             PreparedStatement pstmt = con.prepareStatement(
                 "INSERT INTO customer (UNAME, PWORD, FNAME, LNAME, ADDR, MID, PHNO) VALUES (?,?,?,?,?,?,?)"
             )) 
        {
            pstmt.setString(1, cusb.getCusuname());
            pstmt.setString(2, cusb.getCuspwd());
            pstmt.setString(3, cusb.getCusfname());
            pstmt.setString(4, cusb.getCuslname());
            pstmt.setString(5, cusb.getCusaddr());
            pstmt.setString(6, cusb.getCusmail());
            pstmt.setString(7, cusb.getCusmob());

            rowCount = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rowCount;
    }
}
