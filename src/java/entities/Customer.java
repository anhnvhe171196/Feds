/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

/**
 *
 * @author admin
 */
public class Customer {
    private String username;
    private String pass;
    private String email;
    private String phone;
    private int role;
    private String avarta;

    public Customer() {
    }

    public Customer(String user, String pass, String email, String phone, int role, String avarta) {
        this.username = user;
        this.pass = pass;
        this.email = email;
        this.phone = phone;
        this.role = role;
        this.avarta = avarta;
    }

    public String getUser() {
        return username;
    }

    public void setUser(String user) {
        this.username = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getAvarta() {
        return avarta;
    }

    public void setAvarta(String avarta) {
        this.avarta = avarta;
    }

    @Override
    public String toString() {
        return username ;
    }
    
}
