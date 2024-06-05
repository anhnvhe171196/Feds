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
public class RelatedProducts extends Price{
    private int rating;

    public RelatedProducts() {
    }

    public RelatedProducts(int rating, double price, Date dateStart, Date dateEnd, int sale, Product1 product) {
        super(price, dateStart, dateEnd, product);
        this.rating = rating;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
    
}
