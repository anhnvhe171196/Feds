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
    private User user;
    private String email;
    private String suject;
    private String phone;
    private String message;

    public Contact() {
    }

    public Contact(User user, String email, String suject, String phone, String message) {
        this.user = user;
        this.email = email;
        this.suject = suject;
        this.phone = phone;
        this.message = message;
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
