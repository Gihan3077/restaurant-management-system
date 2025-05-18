package model;

/**
 * Food model representing a menu item in the system.
 */


public class Food {
    private int id;
    private String title;
    private String ingredients;
    private String status;

    public Food() {}
    
    public Food(int id, String title, String ingredients, String status) {
        this.id = id;
        this.title = title;
        this.ingredients = ingredients;
        this.status = status;
    }


    // Getters and Setters
    public int getId() {
        return id; 
    }
    public void setId(int id) {
        this.id = id; 
    }
    public String getTitle() {
        return title; 
    }
    public void setTitle(String title) {
        this.title = title; 
    }
    public String getIngredients() {
        return ingredients; 
    }
    public void setIngredients(String ingredients) {
        this.ingredients = ingredients; 
    }
    public String getStatus() {
        return status; 
    }
    public void setStatus(String status) {
        this.status = status; 
    }


    public String toString() {
        return "Food{" +
                "id=" + id +
                 ", title='" + title + '\'' +
                ", ingredients='" + ingredients + '\'' +
                ", status='" + status + '\'' +
                '}';
}

}