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
public class Bill2 {
    private int Bill_id;
    private double Total_price;
    private Date Date;
    private String Address;
    private String Status;
    private String Province;
    private String District;
    private String Country;
    private User user;
    private Order order;
    private Product1 product1;
    

    public Bill2() {
    }

    public Bill2(int Bill_id, double Total_price, Date Date, String Address, String Status, String Province, String District, String Country, User user, Order order, Product1 product1) {
        this.Bill_id = Bill_id;
        this.Total_price = Total_price;
        this.Date = Date;
        this.Address = Address;
        this.Status = Status;
        this.Province = Province;
        this.District = District;
        this.Country = Country;
        this.user = user;
        this.order = order;
        this.product1 = product1;
    }

    public Product1 getProduct1() {
        return product1;
    }

    public void setProduct1(Product1 product1) {
        this.product1 = product1;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }


    public String getProvince() {
        return Province;
    }

    public void setProvince(String Province) {
        this.Province = Province;
    }

    public String getDistrict() {
        return District;
    }

    public void setDistrict(String District) {
        this.District = District;
    }

    public String getCountry() {
        return Country;
    }

    public void setCountry(String Country) {
        this.Country = Country;
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
