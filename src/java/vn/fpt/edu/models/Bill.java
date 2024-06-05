/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.models;

import java.util.Date;

/**
 *
 * @author admin
 */
public class Bill {
    private int Bill_id;
    private double Total_price;
    private Date Date;
    private String Address;
    private String Status;
    private User user;

    public Bill() {
    }

    public Bill(int Bill_id, double Total_price, Date Date, String Address, String Status, User user) {
        this.Bill_id = Bill_id;
        this.Total_price = Total_price;
        this.Date = Date;
        this.Address = Address;
        this.Status = Status;
        this.user = user;
    }

    public int getBill_id() {
        return Bill_id;
    }

    public void setBill_id(int Bill_id) {
        this.Bill_id = Bill_id;
    }

    public double getTotal_price() {
        return Total_price;
    }

    public void setTotal_price(double Total_price) {
        this.Total_price = Total_price;
    }

    public Date getDate() {
        return Date;
    }

    public void setDate(Date Date) {
        this.Date = Date;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    
}
