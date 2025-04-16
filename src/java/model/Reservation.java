package model;

import java.util.Date;

public class Reservation {
    private int reservationId;
    private int tableId;
    private int customerId;
    private Date reservationTime;
    private int partySize;
    private String status; // Confirmed, Cancelled, Completed
    private String specialRequests;
    private String customerName;
    private String customerPhone;

    // Constructors
    public Reservation() {}

    public Reservation(int reservationId, int tableId, int customerId, 
                      Date reservationTime, int partySize, String status, 
                      String specialRequests, String customerName, String customerPhone) {
        this.reservationId = reservationId;
        this.tableId = tableId;
        this.customerId = customerId;
        this.reservationTime = reservationTime;
        this.partySize = partySize;
        this.status = status;
        this.specialRequests = specialRequests;
        this.customerName = customerName;
        this.customerPhone = customerPhone;
    }

    // Getters and Setters
    public int getReservationId() {
        return reservationId;
    }

    public void setReservationId(int reservationId) {
        this.reservationId = reservationId;
    }

    // ... (similar getters/setters for all fields)
    public int getTableId() {
        return tableId;
    }

    public void setTableId(int tableId) {
        this.tableId = tableId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public Date getReservationTime() {
        return reservationTime;
    }

    public void setReservationTime(Date reservationTime) {
        this.reservationTime = reservationTime;
    }

    public int getPartySize() {
        return partySize;
    }

    public void setPartySize(int partySize) {
        this.partySize = partySize;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSpecialRequests() {
        return specialRequests;
    }

    public void setSpecialRequests(String specialRequests) {
        this.specialRequests = specialRequests;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }
}