package com.app.dao;

import com.app.model.AdminBean;
import com.app.util.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminDAO {

    public AdminBean validate(String uname, String pwd) {
        AdminBean abean = null;

        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement ps = con.prepareStatement(
                    "SELECT uname, pword, fname, lname, addr, mail, phn " +
                    "FROM admin101 WHERE uname = ? AND pword = ?"
            );
            ps.setString(1, uname);
            ps.setString(2, pwd);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                abean = new AdminBean();
                abean.setUname(rs.getString(1));
                abean.setPword(rs.getString(2));
                abean.setFname(rs.getString(3));
                abean.setLname(rs.getString(4));
                abean.setAddr(rs.getString(5));
                abean.setMail(rs.getString(6));
                abean.setPhn(rs.getString(7));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return abean;
    }
}
