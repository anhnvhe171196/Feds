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
public class Price {
    private double price;
    private Date dateStart;
    private Date dateEnd;
    private Product1 product;

    public Price() {
    }

    public Price(double price, Date dateStart, Date dateEnd, Product1 product) {
        this.price = price;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.product = product;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getDateStart() {
        return dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }

    public Product1 getProduct() {
        return product;
    }

    public void setProduct(Product1 product) {
        this.product = product;
    }
    
    
}
