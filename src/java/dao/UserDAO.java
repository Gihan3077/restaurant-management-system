package dao;

import model.User;
import java.sql.*;

public class UserDAO {
    private Connection connection;
    
    public UserDAO() {
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
    
    public User getUser(String email, String password) {
        User user = null;
        try {
            PreparedStatement ps = connection.prepareStatement(
                "SELECT * FROM users WHERE email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, password);
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUserId(rs.getInt("user_id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getString("role"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
}