package com.app.dao;

import com.app.model.TicketBean;
import com.app.util.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class TicketDAO {

    public int save(TicketBean t) {
        int updated = 0;
        try {
            Connection con = ConnectionProvider.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO ticket_booking(" +
                "passenger, age, phone, train_name, num_passengers, source, destination, " +
                "gender, class_type, facilities, total_price, berth) " +
                "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)"
            );
            ps.setString(1, t.getPname());
            ps.setInt(2, t.getAge());
            ps.setString(3, t.getPhone());
            ps.setString(4, t.getTrain());
            ps.setInt(5, t.getPassengers());
            ps.setString(6, t.getSource());
            ps.setString(7, t.getDestination());
            ps.setString(8, t.getGender());
            ps.setString(9, t.getClassType());
            ps.setString(10, t.getFacilities());
            ps.setDouble(11, t.getPrice());
            ps.setString(12, t.getBerth());

            updated = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return updated;
    }
}
