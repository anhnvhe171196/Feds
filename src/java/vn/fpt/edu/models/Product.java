/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.models;

/**
 *
 * @author Trong
 */
public class Product {

    private int Product_id;
    private int Quantity;
    private String Product_name;
    private String Product_img;
    private int User_Id;
    private int Brand_id;
    private String Category_name;
    private float Price;
    private String Size;

    public Product() {
    }

    public Product(int Product_id, int Quantity, String Product_name, String Product_img, int User_Id, int Brand_id, String Category_name, float Price, String Size) {
        this.Product_id = Product_id;
        this.Quantity = Quantity;
        this.Product_name = Product_name;
        this.Product_img = Product_img;
        this.User_Id = User_Id;
        this.Brand_id = Brand_id;
        this.Category_name = Category_name;
        this.Price = Price;
        this.Size = Size;
    }

    public String getCategory_name() {
        return Category_name;
    }

    public void setCategory_name(String Category_name) {
        this.Category_name = Category_name;
    }

    public int getProduct_id() {
        return Product_id;
    }

    public void setProduct_id(int Product_id) {
        this.Product_id = Product_id;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public String getProduct_name() {
        return Product_name;
    }

    public void setProduct_name(String Product_name) {
        this.Product_name = Product_name;
    }

    public String getProduct_img() {
        return Product_img;
    }

    public void setProduct_img(String Product_img) {
        this.Product_img = Product_img;
    }

    public int getUser_Id() {
        return User_Id;
    }

    public void setUser_Id(int User_Id) {
        this.User_Id = User_Id;
    }

    public int getBrand_id() {
        return Brand_id;
    }

    public void setBrand_id(int Brand_id) {
        this.Brand_id = Brand_id;
    }

    public float getPrice() {
        return Price;
    }

    public void setPrice(float Price) {
        this.Price = Price;
    }

    public String getSize() {
        return Size;
    }

    public void setSize(String Size) {
        this.Size = Size;
    }

    
}
