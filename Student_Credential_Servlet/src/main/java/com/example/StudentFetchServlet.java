package com.example;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.*;
import java.util.Base64;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/fetchStudent")
public class StudentFetchServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:ORCL";
    private static final String DB_USER = "your_db_user";
    private static final String DB_PASS = "your_db_password";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        if (id == null || id.trim().isEmpty()) {
            sendAlertAndBack(resp, "Please provide an ID");
            return;
        }

        String sql = "SELECT first_name, last_name, course, fee, id_proof FROM students WHERE id = ?";

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                ps.setString(1, id);
                try (ResultSet rs = ps.executeQuery()) {
                    if (!rs.next()) {
                        sendAlertAndBack(resp, "No student found with ID: " + id);
                        return;
                    }

                    String firstName = rs.getString("first_name");
                    String lastName = rs.getString("last_name");
                    String course = rs.getString("course");
                    int fee = rs.getInt("fee");

                    Blob blob = rs.getBlob("id_proof");
                    String base64Image = null;
                    String mimeType = "image/*";
                    if (blob != null) {
                        try (InputStream is = blob.getBinaryStream();
                             ByteArrayOutputStream os = new ByteArrayOutputStream()) {

                            byte[] buffer = new byte[8192];
                            int bytesRead;
                            while ((bytesRead = is.read(buffer)) != -1) {
                                os.write(buffer, 0, bytesRead);
                            }
                            byte[] bytes = os.toByteArray();
                            base64Image = Base64.getEncoder().encodeToString(bytes);
                            // Optionally guess mime type from bytes; we'll assume image/* for now
                        }
                    }

                    // produce HTML
                    resp.setContentType("text/html; charset=UTF-8");
                    StringBuilder html = new StringBuilder();
                    html.append("<!doctype html><html><head><meta charset='utf-8'/><title>Student Detail</title></head><body>");
                    html.append("<h2>Student Detail</h2>");
                    html.append("<p><b>ID:</b> ").append(escapeHtml(id)).append("</p>");
                    html.append("<p><b>Name:</b> ").append(escapeHtml(firstName)).append(" ").append(escapeHtml(lastName)).append("</p>");
                    html.append("<p><b>Course:</b> ").append(escapeHtml(course)).append("</p>");
                    html.append("<p><b>Fee:</b> ").append(fee).append("</p>");
                    if (base64Image != null) {
                        html.append("<p><b>ID Proof:</b><br/><img src='data:").append(mimeType).append(";base64,").append(base64Image)
                            .append("' alt='ID Proof' style='max-width:400px; height:auto; border:1px solid #ccc;' /></p>");
                    } else {
                        html.append("<p><b>ID Proof:</b> Not uploaded</p>");
                    }
                    html.append("<p><a href='fetch_form.html'>Back</a></p>");
                    html.append("</body></html>");

                    resp.getWriter().write(html.toString());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            sendAlertAndBack(resp, "Error fetching student: " + e.getMessage());
        }
    }

    private void sendAlertAndBack(HttpServletResponse resp, String message) throws IOException {
        resp.setContentType("text/html");
        resp.getWriter().write("<script>alert('" + escapeJs(message) + "'); window.history.back();</script>");
    }

    private String escapeJs(String s) {
        return s == null ? "" : s.replace("'", "\\'").replace("\n", "\\n").replace("\r", "");
    }

    private String escapeHtml(String s) {
        if (s == null) return "";
        return s.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
                .replace("\"", "&quot;").replace("'", "&#x27;");
    }
}
