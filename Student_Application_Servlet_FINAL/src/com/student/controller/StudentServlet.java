package com.student.controller;

import com.student.dao.StudentDAO;
import com.student.model.Student;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/student")
public class StudentServlet extends HttpServlet {
    private StudentDAO dao = new StudentDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action"); if (action==null) action = "list";
        try {
            switch(action) {
                case "edit": {
                    String id = req.getParameter("id"); Student s = dao.getStudentById(id);
                    req.setAttribute("student", s); req.getRequestDispatcher("edit.jsp").forward(req, resp); return;
                }
                case "delete": {
                    String id = req.getParameter("id"); dao.deleteStudent(id);
                    resp.sendRedirect(req.getContextPath()+"/student?action=list"); return;
                }
                case "view": {
                    String id = req.getParameter("id"); Student s = dao.getStudentById(id);
                    req.setAttribute("student", s); req.getRequestDispatcher("view.jsp").forward(req, resp); return;
                }
                case "list": default: {
                    List<Student> list = dao.getAllStudents(); req.setAttribute("students", list);
                    req.getRequestDispatcher("view.jsp").forward(req, resp);
                }
            }
        } catch (SQLException e) { throw new ServletException(e); }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action"); try {
            if ("add".equals(action)) {
                Student s = new Student();
                s.setStudentId(req.getParameter("studentId"));
                s.setFirstName(req.getParameter("firstName"));
                s.setLastName(req.getParameter("lastName"));
                s.setCourse(req.getParameter("course"));
                s.setFees(Double.parseDouble(req.getParameter("fees")));
                s.setEmail(req.getParameter("email"));
                s.setPhone(req.getParameter("phone"));
                boolean ok = dao.addStudent(s);
                if (ok) resp.sendRedirect(req.getContextPath()+"/student?action=list"); else { req.setAttribute("error","Unable to add student"); req.getRequestDispatcher("index.jsp").forward(req, resp); }
            } else if ("update".equals(action)) {
                Student s = new Student();
                s.setStudentId(req.getParameter("studentId"));
                s.setFirstName(req.getParameter("firstName"));
                s.setLastName(req.getParameter("lastName"));
                s.setCourse(req.getParameter("course"));
                s.setFees(Double.parseDouble(req.getParameter("fees")));
                s.setEmail(req.getParameter("email"));
                s.setPhone(req.getParameter("phone"));
                boolean ok = dao.updateStudent(s);
                if (ok) resp.sendRedirect(req.getContextPath()+"/student?action=list"); else { req.setAttribute("error","Unable to update student"); req.getRequestDispatcher("edit.jsp").forward(req, resp); }
            } else { resp.sendRedirect(req.getContextPath()+"/student?action=list"); }
        } catch (SQLException e) { throw new ServletException(e); }
    }
}
