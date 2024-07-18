/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import vn.fpt.edu.dals.Category_DAO;
import vn.fpt.edu.dals.Product_DAO;
import vn.fpt.edu.models.Cart;
import vn.fpt.edu.models.Item;
import vn.fpt.edu.models.User;

/**
 *
 * @author admin
 */
public class CustomerHomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Category_DAO d = new Category_DAO();
        Product_DAO data = new Product_DAO();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }

        Cart cart = new Cart(txt, data.getAllProductinCart());
        User u = (User) session.getAttribute("account");
        List<Item> listItem;
        if (u != null) {
            listItem = cart.getCartbyUserId(u.getUser_Id());
        } else {
            listItem = cart.getCartbyUserId(0);
        }
        int n;
        if(u != null){
            n = cart.getCartbyUserId(u.getUser_Id()).size();
        }else{
            n = cart.getCartbyUserId(0).size();
        }
        session.setAttribute("size", n);
        session.setAttribute("data", data.getAllProductinCart());

        session.setAttribute("cates", d.getAllCate());
        session.setAttribute("list", data.getSellingProduct());
        session.setAttribute("phone", data.getProductByPrice());
        session.setAttribute("tivi", data.getTiviByPrice());
        session.setAttribute("newproduct", data.getNewProduct());
        session.setAttribute("mtb", data.getMTB());
        session.setAttribute("ml", data.getML());
        session.setAttribute("hdd", data.getHDD());
        session.setAttribute("hc", data.getHC());
        request.getRequestDispatcher("UserHome.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
