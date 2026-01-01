package com.app.servlet;

import com.app.dao.TicketDAO;
import com.app.model.TicketBean;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        TicketBean t = new TicketBean();
        t.setPname(req.getParameter("pname"));
        t.setAge(Integer.parseInt(req.getParameter("age")));
        t.setPhone(req.getParameter("phn"));
        t.setTrain(req.getParameter("tname"));
        t.setPassengers(Integer.parseInt(req.getParameter("num")));
        t.setSource(req.getParameter("src"));
        t.setDestination(req.getParameter("dest"));
        t.setGender(req.getParameter("gender"));
        t.setClassType(req.getParameter("ctype"));

        // Facilities
        StringBuilder fac = new StringBuilder();
        if (req.getParameter("food")   != null) fac.append("Food Veg, ");
        if (req.getParameter("foodnv") != null) fac.append("Food Non-Veg, ");
        if (req.getParameter("blanket")!= null) fac.append("Blanket, ");
        if (req.getParameter("snacks") != null) fac.append("Snacks, ");
        String facilities = fac.length() > 0 ? fac.substring(0, fac.length()-2) : "None";
        t.setFacilities(facilities);

        // Price by class
        double price = switch (t.getClassType()) {
            case "General" -> 100;
            case "Sleeper" -> 500;
            case "3rd AC"  -> 1500;
            case "2nd AC"  -> 2000;
            case "1st AC"  -> 4000;
            default -> 0;
        };
        t.setPrice(price);

        // Random berth — adjust max by class type if you want
        int maxSeats = switch (t.getClassType()) {
            case "General" -> 100;
            case "Sleeper" -> 72;
            case "3rd AC"  -> 72;
            case "2nd AC"  -> 54;
            case "1st AC"  -> 24;
            default -> 60;
        };
        t.setBerth("B" + (1 + (int)(Math.random() * maxSeats)));

        // Save to DB
        new TicketDAO().save(t);

        // Forward to result page
        req.setAttribute("ticket", t);
        req.getRequestDispatcher("result.jsp").forward(req, res);
    }
}
