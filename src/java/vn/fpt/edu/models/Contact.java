/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.models;

/**
 *
 * @author admin
 */
public class Contact {
    
    private String username;
    private User user;
    private String email;
    private String suject;
    private String phone;
    private String message;
    private String date;
    public Contact() {
    }

    public Contact(User user, String email, String suject, String phone, String message) {
        this.user = user;
        this.email = email;
        this.suject = suject;
        this.phone = phone;
        this.message = message;
    }

    public Contact(String username, String email, String suject, String phone, String message, String date) {
        this.username = username;
        this.email = email;
        this.suject = suject;
        this.phone = phone;
        this.message = message;
        this.date = date;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
   
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSuject() {
        return suject;
    }

    public void setSuject(String suject) {
        this.suject = suject;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
}
