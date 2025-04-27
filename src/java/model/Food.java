package model;

public class Food {
    private int id;
    private String title;
    private String ingredients;
    private String status;
    private String category;
    
    public Food() {}
    
    public Food(int id, String title, String ingredients, String status) {
        this.id = id;
        this.title = title;
        this.ingredients = ingredients;
        this.status = status;
    }
    
    // Getters and Setters
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getIngredients() { return ingredients; }
    public void setIngredients(String ingredients) { this.ingredients = ingredients; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}