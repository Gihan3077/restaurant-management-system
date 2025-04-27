package dao;

import model.Reservation;
import model.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {
    public boolean addReservation(Reservation reservation) {
        String sql = "INSERT INTO reservations (customer_name, customer_phone, food_id) VALUES (?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, reservation.getCustomerName());
            stmt.setString(2, reservation.getCustomerPhone());
            stmt.setInt(3, reservation.getFoodId());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public List<Reservation> getAllReservations() {
        List<Reservation> reservations = new ArrayList<>();
        String sql = "SELECT r.*, f.title as food_title FROM reservations r JOIN foods f ON r.food_id = f.id";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                Reservation reservation = new Reservation();
                reservation.setId(rs.getInt("id"));
                reservation.setCustomerName(rs.getString("customer_name"));
                reservation.setCustomerPhone(rs.getString("customer_phone"));
                reservation.setFoodId(rs.getInt("food_id"));
                reservation.setReservationDate(rs.getTimestamp("reservation_date"));
                reservations.add(reservation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reservations;
    }
}