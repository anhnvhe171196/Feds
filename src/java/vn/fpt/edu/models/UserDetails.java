/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.models;

import java.util.List;

/**
 *
 * @author rimok
 */
public class UserDetails {
    private double totalPrice;
    private User user;
    private int totalOrders;
    private List<Order> order;
        
    public UserDetails() {
    }

    public UserDetails(double totalPrice, User user, int totalOrders, List<Order> order) {
        this.totalPrice = totalPrice;
        this.user = user;
        this.totalOrders = totalOrders;
        this.order = order;
    }

    public List<Order> getOrder() {
        return order;
    }

    public void setOrder(List<Order> order) {
        this.order = order;
    }

    

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getTotalOrders() {
        return totalOrders;
    }

    public void setTotalOrders(int totalOrders) {
        this.totalOrders = totalOrders;
    }


    
    
}
