/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.models;

/**
 *
 * @author admin
 */
public class Item {
    public Product1 product;
    public int quantity;
    public double price;

    public Item() {
    }

    public Item(Product1 product, int quantity, double price) {
        this.product = product;
        this.quantity = quantity;
        this.price = price;
    }

    public Product1 getProduct() {
        return product;
    }

    public void setProduct(Product1 product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
}
