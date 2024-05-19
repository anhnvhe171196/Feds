/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

/**
 *
 * @author admin
 */
public class GoogleAcount {
    private String id;
    private String email;
    private boolean verified_email;
    private String name;

    // Constructors

    public GoogleAcount(String id, String email, boolean verified_email, String name) {
        this.id = id;
        this.email = email;
        this.verified_email = verified_email;
        this.name = name;
    }

    // Getters and setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isVerified_email() {
        return verified_email;
    }

    public void setVerified_email(boolean verified_email) {
        this.verified_email = verified_email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    // toString method
    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", email='" + email + '\'' +
                ", verified_email=" + verified_email +
                ", name='" + name + '\'' +
                '}';
    }
}
