package model;

import java.sql.Timestamp;

public class Reservation {
    private int id;
    private String customerName;
    private String customerPhone;
    private int foodId;
    private Timestamp reservationDate;
    
    public Reservation() {}
    
    public Reservation(int id, String customerName, String customerPhone, int foodId, Timestamp reservationDate) {
        this.id = id;
        this.customerName = customerName;
        this.customerPhone = customerPhone;
        this.foodId = foodId;
        this.reservationDate = reservationDate;
    }
    
    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getCustomerName() { return customerName; }
    public void setCustomerName(String customerName) { this.customerName = customerName; }
    public String getCustomerPhone() { return customerPhone; }
    public void setCustomerPhone(String customerPhone) { this.customerPhone = customerPhone; }
    public int getFoodId() { return foodId; }
    public void setFoodId(int foodId) { this.foodId = foodId; }
    public Timestamp getReservationDate() { return reservationDate; }
    public void setReservationDate(Timestamp reservationDate) { this.reservationDate = reservationDate; }
}