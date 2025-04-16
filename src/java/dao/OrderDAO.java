package dao;

import model.Order;
import model.OrderItem;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    private Connection connection;

    public OrderDAO() {
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

    // Create new order
    public int createOrder(Order order) {
        String sql = "INSERT INTO orders (table_id, user_id, order_time, status, total_amount, special_instructions) " +
                     "VALUES (?, ?, NOW(), ?, ?, ?)";
        
        try (PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, order.getTableId());
            ps.setInt(2, order.getUserId());
            ps.setString(3, order.getStatus());
            ps.setDouble(4, order.getTotalAmount());
            ps.setString(5, order.getSpecialInstructions());
            
            int affectedRows = ps.executeUpdate();
            if (affectedRows == 0) {
                return -1;
            }
            
            try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    // Add order items
    public boolean addOrderItems(int orderId, List<OrderItem> items) {
        String sql = "INSERT INTO order_items (order_id, menu_item_id, quantity, special_request, item_price_at_order) " +
                     "VALUES (?, ?, ?, ?, ?)";
        
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            for (OrderItem item : items) {
                ps.setInt(1, orderId);
                ps.setInt(2, item.getMenuItemId());
                ps.setInt(3, item.getQuantity());
                ps.setString(4, item.getSpecialRequest());
                ps.setDouble(5, item.getItemPriceAtOrder());
                ps.addBatch();
            }
            
            int[] results = ps.executeBatch();
            for (int result : results) {
                if (result <= 0) {
                    return false;
                }
            }
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get orders by status
    public List<Order> getOrdersByStatus(String status) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE status = ?";
        
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, status);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getInt("order_id"));
                order.setTableId(rs.getInt("table_id"));
                order.setUserId(rs.getInt("user_id"));
                order.setOrderTime(rs.getTimestamp("order_time"));
                order.setStatus(rs.getString("status"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setSpecialInstructions(rs.getString("special_instructions"));
                
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    // Update order status
    public boolean updateOrderStatus(int orderId, String newStatus) {
        String sql = "UPDATE orders SET status = ? WHERE order_id = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, newStatus);
            ps.setInt(2, orderId);
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get order items
    public List<OrderItem> getOrderItems(int orderId) {
        List<OrderItem> items = new ArrayList<>();
        String sql = "SELECT oi.*, mi.name FROM order_items oi " +
                     "JOIN menu_items mi ON oi.menu_item_id = mi.item_id " +
                     "WHERE oi.order_id = ?";
        
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                OrderItem item = new OrderItem();
                item.setOrderItemId(rs.getInt("order_item_id"));
                item.setOrderId(rs.getInt("order_id"));
                item.setMenuItemId(rs.getInt("menu_item_id"));
                item.setQuantity(rs.getInt("quantity"));
                item.setSpecialRequest(rs.getString("special_request"));
                item.setItemPriceAtOrder(rs.getDouble("item_price_at_order"));
                
                items.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
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