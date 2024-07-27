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
    private int CompletedOrders;
    private List<Order> order;

    public UserDetails() {
    }

    public UserDetails(double totalPrice, User user, int totalOrders,List<Order> order) {
        this.totalPrice = totalPrice;
        this.user = user;
        this.totalOrders = totalOrders;
        this.order = order;
    } 
    public UserDetails(double totalPrice, User user, int totalOrders,int CompletedOrders,List<Order> order) {
        this.totalPrice = totalPrice;
        this.user = user;
        this.totalOrders = totalOrders;
        this.order = order;
        this.CompletedOrders=CompletedOrders;
    }

    public int getCompletedOrders() {
        return CompletedOrders;
    }

    public void setCompletedOrders(int CompletedOrders) {
        this.CompletedOrders = CompletedOrders;
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
