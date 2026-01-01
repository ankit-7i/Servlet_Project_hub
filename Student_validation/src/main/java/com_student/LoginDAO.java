package com_student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {

    public Userbean checklogin(String id, String name) {
        Userbean ub = null;

        try (Connection con = DBConnect.connect();
             PreparedStatement pstmt = con.prepareStatement(
                 "SELECT * FROM student WHERE id = ? AND name = ?")) {

            pstmt.setString(1, id);
            pstmt.setString(2, name);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                ub = new Userbean();
                ub.setId(rs.getString("id"));
                ub.setName(rs.getString("name"));
                ub.setPhone(rs.getString("phone"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return ub;
    }
}
