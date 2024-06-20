/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.models;

/**
 *
 * @author rimok
 */
public class UserDetails1 {
    private Product1 product;
    private int orderQuantity;

    public UserDetails1() {
    }

    
    public UserDetails1(Product1 product, int orderQuantity) {
        this.product = product;
        this.orderQuantity = orderQuantity;
    }

    // Getter cho product và orderQuantity
    public Product1 getProduct() {
        return product;
    }

    public int getOrderQuantity() {
        return orderQuantity;
    }
}
