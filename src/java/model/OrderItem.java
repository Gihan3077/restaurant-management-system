package model;

public class OrderItem {
    private int orderItemId;
    private int orderId;
    private int menuItemId;
    private int quantity;
    private String specialRequest;
    private double itemPriceAtOrder; // Price at time of ordering (in case menu prices change)

    // Constructors
    public OrderItem() {}

    public OrderItem(int orderItemId, int orderId, int menuItemId, 
                    int quantity, String specialRequest, double itemPriceAtOrder) {
        this.orderItemId = orderItemId;
        this.orderId = orderId;
        this.menuItemId = menuItemId;
        this.quantity = quantity;
        this.specialRequest = specialRequest;
        this.itemPriceAtOrder = itemPriceAtOrder;
    }

    // Getters and Setters
    public int getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }

    // ... (similar getters/setters for all fields)
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getMenuItemId() {
        return menuItemId;
    }

    public void setMenuItemId(int menuItemId) {
        this.menuItemId = menuItemId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getSpecialRequest() {
        return specialRequest;
    }

    public void setSpecialRequest(String specialRequest) {
        this.specialRequest = specialRequest;
    }

    public double getItemPriceAtOrder() {
        return itemPriceAtOrder;
    }

    public void setItemPriceAtOrder(double itemPriceAtOrder) {
        this.itemPriceAtOrder = itemPriceAtOrder;
    }
}