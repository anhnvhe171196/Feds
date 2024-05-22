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
    private int User_Id;
    private String Password;
    private String User_name;
    private String Email;
    private String Phone_number;
    private int Role_id;
    private String Avarta;

    public User() {
    }

    public User(int User_Id, String Password, String User_name, String Email, String Phone_number, int Role_id, String Avarta) {
        this.User_Id = User_Id;
        this.Password = Password;
        this.User_name = User_name;
        this.Email = Email;
        this.Phone_number = Phone_number;
        this.Role_id = Role_id;
        this.Avarta = Avarta;
    }

    public int getUser_Id() {
        return User_Id;
    }

    public void setUser_Id(int User_Id) {
        this.User_Id = User_Id;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getUser_name() {
        return User_name;
    }

    public void setUser_name(String User_name) {
        this.User_name = User_name;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPhone_number() {
        return Phone_number;
    }

    public void setPhone_number(String Phone_number) {
        this.Phone_number = Phone_number;
    }

    public int getRole_id() {
        return Role_id;
    }

    public void setRole_id(int Role_id) {
        this.Role_id = Role_id;
    }

    public String getAvarta() {
        return Avarta;
    }

    public void setAvarta(String Avarta) {
        this.Avarta = Avarta;
    }
    
    
}
