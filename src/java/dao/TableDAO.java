package dao;

import model.Table;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TableDAO {
    private Connection connection;

    public TableDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/restaurant_db", 
                "root", 
                "");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Get all tables
    public List<Table> getAllTables() {
        List<Table> tables = new ArrayList<>();
        String sql = "SELECT * FROM tables";
        
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Table table = new Table();
                table.setTableId(rs.getInt("table_id"));
                table.setStatus(rs.getString("status"));
                table.setCapacity(rs.getInt("capacity"));
                table.setLocation(rs.getString("location"));
                
                tables.add(table);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tables;
    }

    // Get available tables
    public List<Table> getAvailableTables() {
        List<Table> tables = new ArrayList<>();
        String sql = "SELECT * FROM tables WHERE status = 'available'";
        
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Table table = new Table();
                table.setTableId(rs.getInt("table_id"));
                table.setStatus(rs.getString("status"));
                table.setCapacity(rs.getInt("capacity"));
                table.setLocation(rs.getString("location"));
                
                tables.add(table);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tables;
    }

    // Update table status
    public boolean updateTableStatus(int tableId, String status) {
        String sql = "UPDATE tables SET status = ? WHERE table_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setInt(2, tableId);
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get table by ID
    public Table getTableById(int tableId) {
        String sql = "SELECT * FROM tables WHERE table_id = ?";
        
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, tableId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                Table table = new Table();
                table.setTableId(rs.getInt("table_id"));
                table.setStatus(rs.getString("status"));
                table.setCapacity(rs.getInt("capacity"));
                table.setLocation(rs.getString("location"));
                return table;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Close connection
    public void close() {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}