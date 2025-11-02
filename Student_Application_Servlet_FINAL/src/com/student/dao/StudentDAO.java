package com.student.dao;

import com.student.model.Student;
import com.student.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    public boolean addStudent(Student s) throws SQLException {
        String sql = "INSERT INTO STUDENTS (ID, FIRST_NAME, LAST_NAME, COURSE, FEES, EMAIL, PHONE) VALUES (?,?,?,?,?,?,?)";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, s.getStudentId());
            ps.setString(2, s.getFirstName());
            ps.setString(3, s.getLastName());
            ps.setString(4, s.getCourse());
            ps.setDouble(5, s.getFees());
            ps.setString(6, s.getEmail());
            ps.setString(7, s.getPhone());
            int r = ps.executeUpdate();
            return r > 0;
        }
    }

    public boolean updateStudent(Student s) throws SQLException {
        String sql = "UPDATE STUDENTS SET FIRST_NAME=?, LAST_NAME=?, COURSE=?, FEES=?, EMAIL=?, PHONE=? WHERE ID=?";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, s.getFirstName());
            ps.setString(2, s.getLastName());
            ps.setString(3, s.getCourse());
            ps.setDouble(4, s.getFees());
            ps.setString(5, s.getEmail());
            ps.setString(6, s.getPhone());
            ps.setString(7, s.getStudentId());
            int r = ps.executeUpdate();
            return r > 0;
        }
    }

    public boolean deleteStudent(String id) throws SQLException {
        String sql = "DELETE FROM STUDENTS WHERE ID = ?";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, id);
            int r = ps.executeUpdate();
            return r > 0;
        }
    }

    public Student getStudentById(String id) throws SQLException {
        String sql = "SELECT * FROM STUDENTS WHERE ID = ?";
        try (Connection con = DBUtil.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Student s = new Student();
                    s.setStudentId(rs.getString("ID"));
                    s.setFirstName(rs.getString("FIRST_NAME"));
                    s.setLastName(rs.getString("LAST_NAME"));
                    s.setCourse(rs.getString("COURSE"));
                    s.setFees(rs.getDouble("FEES"));
                    s.setEmail(rs.getString("EMAIL"));
                    s.setPhone(rs.getString("PHONE"));
                    return s;
                }
            }
        }
        return null;
    }

    public List<Student> getAllStudents() throws SQLException {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM STUDENTS ORDER BY ID";
        try (Connection con = DBUtil.getConnection(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Student s = new Student();
                s.setStudentId(rs.getString("ID"));
                s.setFirstName(rs.getString("FIRST_NAME"));
                s.setLastName(rs.getString("LAST_NAME"));
                s.setCourse(rs.getString("COURSE"));
                s.setFees(rs.getDouble("FEES"));
                s.setEmail(rs.getString("EMAIL"));
                s.setPhone(rs.getString("PHONE"));
                list.add(s);
            }
        }
        return list;
    }
}
