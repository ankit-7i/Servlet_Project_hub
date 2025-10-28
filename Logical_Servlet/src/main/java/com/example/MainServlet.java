package com.example;

import java.io.IOException;
import jakarta.servlet.GenericServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/main")
public class MainServlet extends GenericServlet {
    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            res.getWriter().println("No action provided");
            return;
        }

        RequestDispatcher rd = null;
        switch (action) {
            case "prime": rd = req.getRequestDispatcher("/prime"); break;
            case "armstrong": rd = req.getRequestDispatcher("/armstrong"); break;
            case "palindrome": rd = req.getRequestDispatcher("/palindrome"); break;
            case "evenodd": rd = req.getRequestDispatcher("/evenodd"); break;
            case "table": rd = req.getRequestDispatcher("/table"); break;
            case "factorial": rd = req.getRequestDispatcher("/factorial"); break;
            case "neon": rd = req.getRequestDispatcher("/neon"); break;
            case "fibonacci": rd = req.getRequestDispatcher("/fibonacci"); break;
            default:
                res.getWriter().println("Unknown action: " + action);
                return;
        }

        rd.forward(req, res);
    }
}
