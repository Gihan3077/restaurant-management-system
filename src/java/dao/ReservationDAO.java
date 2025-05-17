/package dao;

import model.Reservation;
import util.DatabaseUtil;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {
    public boolean addReservation(Reservation reservation) {
        String sql = "INSERT INTO reservations (customer_name, customer_phone, food_id) VALUES (?, ?, ?)";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, reservation.getCustomerName());
            stmt.setString(2, reservation.getCustomerPhone());
            stmt.setInt(3, reservation.getFoodId());
            
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }  
    public List<Reservation> getAllReservations() {
    List<Reservation> reservations = new ArrayList<>();
    // Include status in the query
    String sql = "SELECT r.*, f.title as food_title, f.status as food_status FROM reservations r JOIN foods f ON r.food_id = f.id";
    
    try (Connection conn = DatabaseUtil.getConnection();
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery(sql)) {
        
        while (rs.next()) {
            Reservation reservation = new Reservation();
            reservation.setId(rs.getInt("id"));
            reservation.setCustomerName(rs.getString("customer_name"));
            reservation.setCustomerPhone(rs.getString("customer_phone"));
            reservation.setFoodId(rs.getInt("food_id"));
            reservation.setReservationDate(rs.getString("reservation_date"));
            reservation.setStatus(rs.getString("status")); // Add this line
            reservations.add(reservation);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return reservations;
    }

    
    public boolean cancelReservation(int reservationId, int foodId) {
        try (Connection conn = DatabaseUtil.getConnection()) {
            // Start transaction
            conn.setAutoCommit(false);

            // 1. Update reservation status to Cancelled
            String updateReservation = "UPDATE reservations SET status = 'Cancelled' WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(updateReservation)) {
                stmt.setInt(1, reservationId);
                stmt.executeUpdate();
            }

            // 2. Update food status back to Available
            String updateFood = "UPDATE foods SET status = 'Available' WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(updateFood)) {
                stmt.setInt(1, foodId);
                stmt.executeUpdate();
            }

            // Commit transaction
            conn.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}