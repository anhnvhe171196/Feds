/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.models;

/**
 *
 * @author admin
 */
public class Product_Detail {
    public int Product_id;
    public String RAM;
    public String ROM;
    public String Size;
    public String Battery;
    public String Weight;
    public String Color;
    public String Description;
    public String CPU;
    public String Wattage;
    public String Status;

    public Product_Detail() {
    }

    public Product_Detail(int Product_id, String RAM, String ROM, String Size, String Battery, String Weight, String Color, String Description, String CPU, String Wattage, String Status) {
        this.Product_id = Product_id;
        this.RAM = RAM;
        this.ROM = ROM;
        this.Size = Size;
        this.Battery = Battery;
        this.Weight = Weight;
        this.Color = Color;
        this.Description = Description;
        this.CPU = CPU;
        this.Wattage = Wattage;
        this.Status = Status;
    }

    public int getProduct_id() {
        return Product_id;
    }

    public void setProduct_id(int Product_id) {
        this.Product_id = Product_id;
    }

    public String getRAM() {
        return RAM;
    }

    public void setRAM(String RAM) {
        this.RAM = RAM;
    }

    public String getROM() {
        return ROM;
    }

    public void setROM(String ROM) {
        this.ROM = ROM;
    }

    public String getSize() {
        return Size;
    }

    public void setSize(String Size) {
        this.Size = Size;
    }

    public String getBattery() {
        return Battery;
    }

    public void setBattery(String Battery) {
        this.Battery = Battery;
    }

    public String getWeight() {
        return Weight;
    }

    public void setWeight(String Weight) {
        this.Weight = Weight;
    }

    public String getColor() {
        return Color;
    }

    public void setColor(String Color) {
        this.Color = Color;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getCPU() {
        return CPU;
    }

    public void setCPU(String CPU) {
        this.CPU = CPU;
    }

    public String getWattage() {
        return Wattage;
    }

    public void setWattage(String Wattage) {
        this.Wattage = Wattage;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }
    
    
}
