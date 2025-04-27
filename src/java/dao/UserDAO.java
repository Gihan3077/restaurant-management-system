package dao;

import model.User;
import model.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.PasswordUtil;

public class UserDAO {
    public User validateUser(String username, String password) {
    User user = null;
    String sql = "SELECT * FROM users WHERE username = ?";
    
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        
        stmt.setString(1, username);
        
        try (ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                String storedHash = rs.getString("password");
                if (PasswordUtil.checkPassword(password, storedHash)) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUsername(rs.getString("username"));
                    user.setPassword(storedHash);
                    user.setRole(rs.getString("role"));
                }
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return user;
}
     public boolean registerUser(User user) {
    String sql = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";
    
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement stmt = conn.prepareStatement(sql)) {
        
        stmt.setString(1, user.getUsername());
        stmt.setString(2, PasswordUtil.hashPassword(user.getPassword()));
        stmt.setString(3, user.getRole());
        
        return stmt.executeUpdate() > 0;
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
} 
}