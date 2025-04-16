package model;

public class Table {
    private int tableId;
    private String status; // Available, Occupied, Reserved
    private int capacity;
    private String location; // Optional: e.g., "Indoor", "Patio", "VIP"

    // Constructors
    public Table() {}

    public Table(int tableId, String status, int capacity, String location) {
        this.tableId = tableId;
        this.status = status;
        this.capacity = capacity;
        this.location = location;
    }

    // Getters and Setters
    public int getTableId() {
        return tableId;
    }

    public void setTableId(int tableId) {
        this.tableId = tableId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
}