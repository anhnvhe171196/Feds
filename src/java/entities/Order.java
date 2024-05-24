/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

import java.util.Date;

/**
 *
 * @author Trong
 */
public class Order {
    private int Order_id;
    private int Product_id;
    private int Order_quantity;
    private int Bill_id;
    private Date Real_time_price;
    private String Payment;

    public Order() {
    }

    public Order(int Order_id, int Product_id, int Order_quantity, int Bill_id, Date Real_time_price, String Payment) {
        this.Order_id = Order_id;
        this.Product_id = Product_id;
        this.Order_quantity = Order_quantity;
        this.Bill_id = Bill_id;
        this.Real_time_price = Real_time_price;
        this.Payment = Payment;
    }

    public int getOrder_id() {
        return Order_id;
    }

    public void setOrder_id(int Order_id) {
        this.Order_id = Order_id;
    }

    public int getProduct_id() {
        return Product_id;
    }

    public void setProduct_id(int Product_id) {
        this.Product_id = Product_id;
    }

    public int getOrder_quantity() {
        return Order_quantity;
    }

    public void setOrder_quantity(int Order_quantity) {
        this.Order_quantity = Order_quantity;
    }

    public int getBill_id() {
        return Bill_id;
    }

    public void setBill_id(int Bill_id) {
        this.Bill_id = Bill_id;
    }

    public Date getReal_time_price() {
        return Real_time_price;
    }

    public void setReal_time_price(Date Real_time_price) {
        this.Real_time_price = Real_time_price;
    }

    public String getPayment() {
        return Payment;
    }

    public void setPayment(String Payment) {
        this.Payment = Payment;
    }
    
    
}
