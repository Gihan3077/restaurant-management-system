package model;

import java.util.Date;

public class Inventory {
    private int inventoryId;
    private String itemName;
    private String category; // Food, Beverage, Cleaning, etc.
    private double quantity;
    private String unit; // kg, liter, packet, etc.
    private double thresholdLevel;
    private Date lastRestocked;
    private String supplier;

    // Constructors
    public Inventory() {}

    public Inventory(int inventoryId, String itemName, String category, 
                    double quantity, String unit, double thresholdLevel, 
                    Date lastRestocked, String supplier) {
        this.inventoryId = inventoryId;
        this.itemName = itemName;
        this.category = category;
        this.quantity = quantity;
        this.unit = unit;
        this.thresholdLevel = thresholdLevel;
        this.lastRestocked = lastRestocked;
        this.supplier = supplier;
    }

    // Getters and Setters
    public int getInventoryId() {
        return inventoryId;
    }

    public void setInventoryId(int inventoryId) {
        this.inventoryId = inventoryId;
    }

    // ... (similar getters/setters for all fields)
    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public double getQuantity() {
        return quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public double getThresholdLevel() {
        return thresholdLevel;
    }

    public void setThresholdLevel(double thresholdLevel) {
        this.thresholdLevel = thresholdLevel;
    }

    public Date getLastRestocked() {
        return lastRestocked;
    }

    public void setLastRestocked(Date lastRestocked) {
        this.lastRestocked = lastRestocked;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }
}