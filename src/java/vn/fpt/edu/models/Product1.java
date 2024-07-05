/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.models;

/**
 *
 * @author admin
 */
public class Product1 {

    private int product_id;
    private int quantity;
    private String product_name;
    private String product_img;
    private User user;
    private Brand brand;
    private Price price;
    private Category category;
    private ProductDetail detail;
    private String status;
    public Product1() {
    }

    public Product1(int Product_id, int Quantity, String Product_name, String Product_img, User user, Brand brand) {
        this.product_id = Product_id;
        this.quantity = Quantity;
        this.product_name = Product_name;
        this.product_img = Product_img;
        this.user = user;
        this.brand = brand;
    }
    public Product1(int Product_id, int Quantity, String Product_name, String Product_img, User user, Brand brand, String status) {
        this.product_id = Product_id;
        this.quantity = Quantity;
        this.product_name = Product_name;
        this.product_img = Product_img;
        this.user = user;
        this.brand = brand;
        this.status = status;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int Product_id) {
        this.product_id = Product_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int Quantity) {
        this.quantity = Quantity;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String Product_name) {
        this.product_name = Product_name;
    }

    public String getProduct_img() {
        return product_img;
    }

    public void setProduct_img(String Product_img) {
        this.product_img = Product_img;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public Price getPrice() {
        return price;
    }

    public void setPrice(Price price) {
        this.price = price;
    }
    public void setCategory(Category category) {
        this.category = category;
    }
    public Category getCategory(){
        return category;
    }

    public ProductDetail getDetail() {
        return detail;
    }

    public void setDetail(ProductDetail detail) {
        this.detail = detail;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
}
