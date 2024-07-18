/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.models;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class Cart {
    public List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }
    
    public List<Item> getCartbyUserId(int userid) {
        List<Item> userItems = new ArrayList<>();
        for (Item item : items) {
            if(item.getUserID() == userid){
                userItems.add(item);
            }
        }
        return userItems; 
    }
    public Cart getCartbyUserId1(int userid) {
        Cart userItems = new Cart();
        for (Item item : items) {
            if(item.getUserID() == userid){
                userItems.addItem(item);
            }
        }
        return userItems; 
    }
    public List<Item> getItems() {
        return items;
    }

    public int getQuantityById(int id, int userId) { 
        return getItemById(id, userId).getQuantity();
    }
    
    private Item getItemById(int id, int userId) { 
        for (Item i : items) {
            if(i.getProduct().getProduct_id() == id && i.getUserID() == userId) { 
                return i;
            }
        }
        return null;
    }
    
    public void addItem(Item t) { 
        if(getItemById(t.getProduct().getProduct_id(), t.getUserID())!=null) { 
            Item m = getItemById(t.getProduct().getProduct_id(), t.getUserID());
            m.setQuantity(m.getQuantity()+t.getQuantity());
        } else { 
            items.add(t);
        }
    }
    
    public void removeItem(int userId, int id) {
        Item itemToRemove = null;
        for (Item i : items) {
            if(i.getUserID() == userId && i.getProduct().getProduct_id() == id) {
                itemToRemove = i;
                break;
            }
        }
        if(itemToRemove != null) { 
            items.remove(itemToRemove);
        }
    }
    
    public double getTotalMoney(int userId) { 
        double t = 0;
        for (Item i : items) {
            if(i.getUserID() == userId) {
                t+=(i.getQuantity()*i.getPrice());
            }          
        }
        return t;
    }
    
    private Product getProductById(int id, List<Product> list) { 
        for (Product i : list) {
            if(i.getProduct_id() == id) return i;
        }
        return null;
    }
    
    public Cart(String txt, List<Product> list) {
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("/");
                for (String i : s) {
                    String[] n = i.split(":");
                    int iduser = Integer.parseInt(n[0]);
                    int idproduct = Integer.parseInt(n[1]);
                    int quantity = Integer.parseInt(n[2]);
                    double price = Double.parseDouble(n[3]);
                    Product p = getProductById(idproduct, list);
                    if(p != null) {
                        Item i1 = new Item(iduser, p, quantity, price);
                        addItem(i1);
                    }
                    
                    
                }
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

    }
}
