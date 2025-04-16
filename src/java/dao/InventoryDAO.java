package dao;

import model.Inventory;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class InventoryDAO {
    private Connection connection;

    public InventoryDAO() {
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

    // Add new inventory item
    public boolean addInventoryItem(Inventory item) {
        String sql = "INSERT INTO inventory (item_name, category, quantity, unit, threshold_level, supplier) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, item.getItemName());
            ps.setString(2, item.getCategory());
            ps.setDouble(3, item.getQuantity());
            ps.setString(4, item.getUnit());
            ps.setDouble(5, item.getThresholdLevel());
            ps.setString(6, item.getSupplier());
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get all inventory items
    public List<Inventory> getAllInventoryItems() {
        List<Inventory> items = new ArrayList<>();
        String sql = "SELECT * FROM inventory";
        
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Inventory item = new Inventory();
                item.setInventoryId(rs.getInt("inventory_id"));
                item.setItemName(rs.getString("item_name"));
                item.setCategory(rs.getString("category"));
                item.setQuantity(rs.getDouble("quantity"));
                item.setUnit(rs.getString("unit"));
                item.setThresholdLevel(rs.getDouble("threshold_level"));
                item.setLastRestocked(rs.getDate("last_restocked"));
                item.setSupplier(rs.getString("supplier"));
                
                items.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }

    // Get low stock items
    public List<Inventory> getLowStockItems() {
        List<Inventory> items = new ArrayList<>();
        String sql = "SELECT * FROM inventory WHERE quantity < threshold_level";
        
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Inventory item = new Inventory();
                item.setInventoryId(rs.getInt("inventory_id"));
                item.setItemName(rs.getString("item_name"));
                item.setCategory(rs.getString("category"));
                item.setQuantity(rs.getDouble("quantity"));
                item.setUnit(rs.getString("unit"));
                item.setThresholdLevel(rs.getDouble("threshold_level"));
                
                items.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }

    // Update inventory quantity
    public boolean updateInventoryQuantity(int inventoryId, double newQuantity) {
        String sql = "UPDATE inventory SET quantity = ? WHERE inventory_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setDouble(1, newQuantity);
            ps.setInt(2, inventoryId);
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
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