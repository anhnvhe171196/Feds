package vn.fpt.edu.models;



/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Trong
 */
public class BillOrder {
    private int Bill_id;
    private String Product_name;
    private double price;
    private String Product_img;
    private String Status;
    private String Payment;

    public BillOrder() {
    }

    public BillOrder(int Bill_id, String Product_name, double price, String Product_img, String Status, String Payment) {
        this.Bill_id = Bill_id;
        this.Product_name = Product_name;
        this.price = price;
        this.Product_img = Product_img;
        this.Status = Status;
        this.Payment = Payment;
    }

    public int getBill_id() {
        return Bill_id;
    }

    public void setBill_id(int Bill_id) {
        this.Bill_id = Bill_id;
    }

    public String getProduct_name() {
        return Product_name;
    }

    public void setProduct_name(String Product_name) {
        this.Product_name = Product_name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getProduct_img() {
        return Product_img;
    }

    public void setProduct_img(String Product_img) {
        this.Product_img = Product_img;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public String getPayment() {
        return Payment;
    }

    public void setPayment(String Payment) {
        this.Payment = Payment;
    }
    
    
    
}
