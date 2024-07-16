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
        List<Item> l = new ArrayList<>();
        for (Item item : items) {
            if(item.getUserID() == userid){
                l.add(item);
            }
        }
        return l; 
    } 
    public List<Item> getItems() {
        return items;
    }

    public int getQuantityById(int id) { 
        return getItemById(id).getQuantity();
    }
    
    private Item getItemById(int id) { 
        for (Item i : items) {
            if(i.getProduct().getProduct_id() == id) { 
                return i;
            }
        }
        return null;
    }
    
    public void addItem(Item t) { 
        if(getItemById(t.getProduct().getProduct_id())!=null) { 
            Item m = getItemById(t.getProduct().getProduct_id());
            m.setQuantity(m.getQuantity()+t.getQuantity());
        } else { 
            items.add(t);
        }
    }
    
    public void removeItem(int id) {
        if(getItemById(id) != null) { 
            items.remove(getItemById(id));
        }
    }
    
    public double getTotalMoney() { 
        double t = 0;
        for (Item i : items) {
            t+=(i.getQuantity()*i.getPrice());
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
                    Item i1;
                    i1 = new Item(iduser, p, quantity, price);
                    addItem(i1);
                }
            }
        } catch (NumberFormatException e) {
        }

    }
//    public static void main(String[] args) {
//        Item i = new Item(0, product, 0, 0)
//    }
    
}
