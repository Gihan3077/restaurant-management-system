package model;

public class MenuItem {
    private int itemId;
    private String name;
    private String description;
    private String category; // Starter, Main, Dessert, Drink
    private double price;
    private boolean available;
    private String imagePath; // For storing menu item images

    // Constructors
    public MenuItem() {}

    public MenuItem(int itemId, String name, String description, String category, 
                   double price, boolean available, String imagePath) {
        this.itemId = itemId;
        this.name = name;
        this.description = description;
        this.category = category;
        this.price = price;
        this.available = available;
        this.imagePath = imagePath;
    }

    // Getters and Setters
    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

    // ... (similar getters/setters for all fields)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
}