package model;

import java.util.Date;
import java.util.List;

public class Order {
    private int orderId;
    private int tableId;
    private int userId; // Staff who took the order
    private Date orderTime;
    private String status; // Pending, Cooking, Ready, Served, Paid
    private List<OrderItem> items;
    private double totalAmount;
    private String specialInstructions;

    // Constructors
    public Order() {}

    public Order(int orderId, int tableId, int userId, Date orderTime, 
                String status, List<OrderItem> items, double totalAmount, 
                String specialInstructions) {
        this.orderId = orderId;
        this.tableId = tableId;
        this.userId = userId;
        this.orderTime = orderTime;
        this.status = status;
        this.items = items;
        this.totalAmount = totalAmount;
        this.specialInstructions = specialInstructions;
    }

    // Getters and Setters
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    // ... (similar getters/setters for all fields)
    public int getTableId() {
        return tableId;
    }

    public void setTableId(int tableId) {
        this.tableId = tableId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getSpecialInstructions() {
        return specialInstructions;
    }

    public void setSpecialInstructions(String specialInstructions) {
        this.specialInstructions = specialInstructions;
    }
}