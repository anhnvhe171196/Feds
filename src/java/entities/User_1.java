/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

/**
 *
 * @author Trong
 */
public class User {
    private int user_Id;
    private String password;
    private String user_name;
    private String email;
    private String phone_number;
    private int role_id;
    private String avarta;

    public User() {
    }

    public User(int User_Id, String Password, String User_name, String Email, String Phone_number, int Role_id, String Avarta) {
        this.user_Id = User_Id;
        this.password = Password;
        this.user_name = User_name;
        this.email = Email;
        this.phone_number = Phone_number;
        this.role_id = Role_id;
        this.avarta = Avarta;
    }

    public int getUser_Id() {
        return user_Id;
    }

    public void setUser_Id(int User_Id) {
        this.user_Id = User_Id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String Password) {
        this.password = Password;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String User_name) {
        this.user_name = User_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String Email) {
        this.email = Email;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String Phone_number) {
        this.phone_number = Phone_number;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int Role_id) {
        this.role_id = Role_id;
    }

    public String getAvarta() {
        return avarta;
    }

    public void setAvarta(String Avarta) {
        this.avarta = Avarta;
    }
    
    
}