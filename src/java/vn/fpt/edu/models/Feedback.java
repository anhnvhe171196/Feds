/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.models;

/**
 *
 * @author rimok
 */
public class Feedback {
    private int feedbackId;
    private double totalPrice;
    private String date;
    private int userId;
    private String address;
    private String status;
    private String userName; // Thêm thông tin tên người dùng

    // Constructor không tham số
    public Feedback() {
    }

    // Constructor có tham số
    public Feedback(int feedbackId, double totalPrice, String date, int userId, String address, String status, String userName) {
        this.feedbackId = feedbackId;
        this.totalPrice = totalPrice;
        this.date = date;
        this.userId = userId;
        this.address = address;
        this.status = status;
        this.userName = userName;
    }

    public int getFeedbackId() {
        return feedbackId;
    }

    public void setFeedbackId(int feedbackId) {
        this.feedbackId = feedbackId;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
 
}
