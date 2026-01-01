package com.project.customer_module;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.project.dbinfo.DatabaseConnection;

public class CustomerLoginDAO {

    public CustomerBean checkCustomer(String uname, String pword) {

        CustomerBean cb = null;

        String query = "SELECT * FROM customer WHERE UNAME = ? AND PWORD = ?";

        try (Connection con = DatabaseConnection.connect();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setString(1, uname);
            pstmt.setString(2, pword);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    cb = new CustomerBean();
                    cb.setCusuname(rs.getString("UNAME"));
                    cb.setCuspwd(rs.getString("PWORD"));
                    cb.setCusfname(rs.getString("FNAME"));
                    cb.setCuslname(rs.getString("LNAME"));
                    cb.setCusaddr(rs.getString("ADDR"));
                    cb.setCusmail(rs.getString("MID"));
                    cb.setCusmob(rs.getString("PHNO"));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return cb;
    }
}
