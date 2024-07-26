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
    private String status;
    private Bill2 bill;
    public UserDetails1() {
    }

    
    public UserDetails1(Product1 product, int orderQuantity,String status,Bill2 bill) {
        this.product = product;
        this.orderQuantity = orderQuantity;
        this.status=status;
        this.bill=bill;
    }

    public Bill2 getBill() {
        return bill;
    }

    public void setBill(Bill2 bill) {
        this.bill = bill;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    // Getter cho product và orderQuantity
    public Product1 getProduct() {
        return product;
    }

    public int getOrderQuantity() {
        return orderQuantity;
    }
}
