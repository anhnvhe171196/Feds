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
    
}
