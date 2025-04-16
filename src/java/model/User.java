package model;

public class User {
    private int userId;
    private String name;
    private String email;
    private String password;
    private String role;
    
    // Constructors
    public User() {}
    
    public User(String name, String email, String password, String role) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.role = role;
    }
    
    // Getters and Setters
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    // ... (add all other getters/setters)
}