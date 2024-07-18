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
    private String Ram, Rom, Size, Color;
    private int Order_quantity;
    private String user_name, phone, email, address;
    private String Province, District, Country;
    public BillOrder() {
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public BillOrder(int Bill_id, String Product_name, double price, String Product_img, String Status, String Payment, String Ram, String Rom, String Size, String Color, int Order_quantity, String user_name, String phone, String email, String address, String Province, String District, String Country) {
        this.Bill_id = Bill_id;
        this.Product_name = Product_name;
        this.price = price;
        this.Product_img = Product_img;
        this.Status = Status;
        this.Payment = Payment;
        this.Ram = Ram;
        this.Rom = Rom;
        this.Size = Size;
        this.Color = Color;
        this.Order_quantity = Order_quantity;
        this.user_name = user_name;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.Province = Province;
        this.District = District;
        this.Country = Country;
    }

    public BillOrder(int Bill_id, String Product_name, double price, String Product_img, String Status, String Payment, String Ram, String Rom, String Size, String Color, int Order_quantity) {
        this.Bill_id = Bill_id;
        this.Product_name = Product_name;
        this.price = price;
        this.Product_img = Product_img;
        this.Status = Status;
        this.Payment = Payment;
        this.Ram = Ram;
        this.Rom = Rom;
        this.Size = Size;
        this.Color = Color;
        this.Order_quantity = Order_quantity;
    }

    public String getProvince() {
        return Province;
    }

    public void setProvince(String Province) {
        this.Province = Province;
    }

    public String getDistrict() {
        return District;
    }

    public void setDistrict(String District) {
        this.District = District;
    }

    public String getCountry() {
        return Country;
    }

    public void setCountry(String Country) {
        this.Country = Country;
    }

    public int getOrder_quantity() {
        return Order_quantity;
    }

    public void setOrder_quantity(int Order_quantity) {
        this.Order_quantity = Order_quantity;
    }

    public String getRam() {
        return Ram;
    }

    public void setRam(String Ram) {
        this.Ram = Ram;
    }

    public String getRom() {
        return Rom;
    }

    public void setRom(String Rom) {
        this.Rom = Rom;
    }

    public String getSize() {
        return Size;
    }

    public void setSize(String Size) {
        this.Size = Size;
    }

    public String getColor() {
        return Color;
    }

    public void setColor(String Color) {
        this.Color = Color;
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
