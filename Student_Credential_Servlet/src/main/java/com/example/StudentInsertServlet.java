package com.example;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;

@WebServlet("/insertStudent")
@MultipartConfig(maxFileSize = 5 * 1024 * 1024) // 5MB limit; adjust as needed
public class StudentInsertServlet extends HttpServlet {

    // Change these to your DB values
    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:ORCL"; // example
    private static final String DB_USER = "jdbcdb";
    private static final String DB_PASS = "ankit07";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // read form fields
        String id = req.getParameter("id");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String course = req.getParameter("course");
        String feeStr = req.getParameter("fee");

        if (id == null || id.trim().isEmpty()) {
            sendAlertAndBack(resp, "ID is required");
            return;
        }

        int fee = 0;
        try {
            fee = Integer.parseInt(feeStr);
        } catch (NumberFormatException e) {
            sendAlertAndBack(resp, "Invalid fee value");
            return;
        }

        Part idProofPart = req.getPart("idProof"); 

        String insertSql = "INSERT INTO student_credential (id, first_name, last_name, course, fee, id_proof) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            
            Class.forName("oracle.jdbc.driver.OracleDriver");

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
                 PreparedStatement ps = conn.prepareStatement(insertSql)) {

                ps.setString(1, id);
                ps.setString(2, firstName);
                ps.setString(3, lastName);
                ps.setString(4, course);
                ps.setInt(5, fee);

                if (idProofPart != null && idProofPart.getSize() > 0) {
                    try (InputStream is = idProofPart.getInputStream()) {
                        ps.setBinaryStream(6, is, (int) idProofPart.getSize());
                    }
                } else {
                    ps.setNull(6, java.sql.Types.BLOB);
                }

                ps.executeUpdate();
            }

            // On success, show popup and redirect to fetch form (or wherever)
            resp.setContentType("text/html");
            resp.getWriter().write(
                    "<script>alert('Student credential verified and value inserted');" +
                    "window.location.href='fetch_form.html';</script>");

        } catch (java.sql.SQLIntegrityConstraintViolationException dup) {
            sendAlertAndBack(resp, "A student with this ID already exists.");
        } catch (Exception e) {
            e.printStackTrace();
            sendAlertAndBack(resp, "Error inserting student: " + e.getMessage());
        }
    }

    private void sendAlertAndBack(HttpServletResponse resp, String message) throws IOException {
        resp.setContentType("text/html");
        resp.getWriter().write("<script>alert('" + escapeJs(message) + "'); window.history.back();</script>");
    }

    private String escapeJs(String s) {
        return s == null ? "" : s.replace("'", "\\'").replace("\n", "\\n").replace("\r", "");
    }
}
