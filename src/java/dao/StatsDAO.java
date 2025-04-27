package dao;

import model.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class StatsDAO {
    public int getTotalFoods() {
        String sql = "SELECT COUNT(*) FROM foods";
        return getCount(sql);
    }
    
    public int getAvailableFoods() {
        String sql = "SELECT COUNT(*) FROM foods WHERE status = 'Available'";
        return getCount(sql);
    }
    
    public int getTotalReservations() {
        String sql = "SELECT COUNT(*) FROM reservations";
        return getCount(sql);
    }
    
    public int getTodayReservations() {
        String sql = "SELECT COUNT(*) FROM reservations WHERE DATE(reservation_date) = CURDATE()";
        return getCount(sql);
    }
    
    private int getCount(String sql) {
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}