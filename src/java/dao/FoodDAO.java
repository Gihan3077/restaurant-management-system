package dao;

import model.Food;
import model.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FoodDAO {
    public List<Food> getAllFoods() {
        List<Food> foods = new ArrayList<>();
        String sql = "SELECT * FROM foods";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                Food food = new Food();
                food.setId(rs.getInt("id"));
                food.setTitle(rs.getString("title"));
                food.setIngredients(rs.getString("ingredients"));
                food.setStatus(rs.getString("status"));
                foods.add(food);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return foods;
    }
    
    public boolean addFood(Food food) {
        String sql = "INSERT INTO foods (title, ingredients, status) VALUES (?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, food.getTitle());
            stmt.setString(2, food.getIngredients());
            stmt.setString(3, food.getStatus());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteFood(int id) {
        String sql = "DELETE FROM foods WHERE id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Add these methods
public List<String> getAllCategories() {
    List<String> categories = new ArrayList<>();
    String sql = "SELECT name FROM categories";
    
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery()) {
        
        while (rs.next()) {
            categories.add(rs.getString("name"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return categories;
}

public List<Food> getFoodsByCategory(String category) {
    List<Food> foods = new ArrayList<>();
    String sql = "SELECT * FROM foods WHERE category = ?";
    
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        
        stmt.setString(1, category);
        
        try (ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Food food = new Food();
                food.setId(rs.getInt("id"));
                food.setTitle(rs.getString("title"));
                food.setIngredients(rs.getString("ingredients"));
                food.setStatus(rs.getString("status"));
                food.setCategory(rs.getString("category"));
                foods.add(food);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return foods;
}

public List<Food> getFoodsPaginated(int page, int recordsPerPage, String category) {
    List<Food> foods = new ArrayList<>();
    String sql;
    
    int start = (page - 1) * recordsPerPage;
    
    if (category == null || category.isEmpty()) {
        sql = "SELECT * FROM foods LIMIT ?, ?";
    } else {
        sql = "SELECT * FROM foods WHERE category = ? LIMIT ?, ?";
    }
    
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        
        if (category == null || category.isEmpty()) {
            stmt.setInt(1, start);
            stmt.setInt(2, recordsPerPage);
        } else {
            stmt.setString(1, category);
            stmt.setInt(2, start);
            stmt.setInt(3, recordsPerPage);
        }
        
        try (ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Food food = new Food();
                food.setId(rs.getInt("id"));
                food.setTitle(rs.getString("title"));
                food.setIngredients(rs.getString("ingredients"));
                food.setStatus(rs.getString("status"));
                food.setCategory(rs.getString("category"));
                foods.add(food);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return foods;
}

public int getFoodCount(String category) {
    String sql;
    if (category == null || category.isEmpty()) {
        sql = "SELECT COUNT(*) FROM foods";
    } else {
        sql = "SELECT COUNT(*) FROM foods WHERE category = ?";
    }
    
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        
        if (category != null && !category.isEmpty()) {
            stmt.setString(1, category);
        }
        
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return 0;
}
}