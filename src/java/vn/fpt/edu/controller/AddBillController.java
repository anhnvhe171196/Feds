/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import vn.fpt.edu.dals.Bill_DAO;
import vn.fpt.edu.dals.Product_DAO;
import vn.fpt.edu.models.Cart;
import vn.fpt.edu.models.Item;
import vn.fpt.edu.models.User;


/**
 *
 * @author admin
 */
public class AddBillController extends HttpServlet {

    /**
     * Processes Requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param Request servlet Request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param Request servlet Request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest Request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = Request.getSession();
        User u = (User) session.getAttribute("account");
        Bill_DAO d = new Bill_DAO();
        
        Product_DAO data = new Product_DAO();
        Cookie[] arr = Request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        
        String tinh = Request.getParameter("tinh");
        String quan = Request.getParameter("quan");
        String phuong = Request.getParameter("phuong");
        String address = Request.getParameter("address");
        String paymentOption = Request.getParameter("paymentOptions");
        String status = "Chờ xử lý";
        

        Cart cart = new Cart(txt, data.getAllProductinCart());
        List<Item> listItem;
            if (u != null) {
                listItem = cart.getCartbyUserId(u.getUser_Id());
                session.setAttribute("totalMoney", cart.getTotalMoney(u.getUser_Id()));
            } else {
                listItem = cart.getCartbyUserId(0);
                session.setAttribute("totalMoney", cart.getTotalMoney(0));
            }
        
         if("tienmat".equals(paymentOption)) {
             d.addtoBill(u, cart.getCartbyUserId1(u.getUser_Id()), address, status, tinh, quan, phuong, paymentOption);
             String newTxt ="";
             for (Item item : cart.getItems()) {
                 if(item.getUserID() != u.getUser_Id()) {
                     newTxt += item.getUserID() + ":" + item.getProduct().getProduct_id() + ":" + item.getQuantity() + ":" + item.getPrice()+ "/";
                 }
             }
             if(!newTxt.isEmpty()) {
                 newTxt = newTxt.substring(0, newTxt.length() - 1);
             }
             Cookie c = new Cookie("cart", newTxt);
             c.setMaxAge(24*60*60);
             response.addCookie(c);
             session.removeAttribute("size");
             session.setAttribute("size", 0);
             response.sendRedirect("complete");
 
         } else{
             session.setAttribute("address", address);
             session.setAttribute("status", status);
             session.setAttribute("tinh", tinh);
             session.setAttribute("quan", quan);
             session.setAttribute("phuong", phuong);
             session.setAttribute("paymentOption", paymentOption);
             Request.setAttribute("total", (long)cart.getTotalMoney(u.getUser_Id()));
             Request.getRequestDispatcher("vnpay_pay.jsp").forward(Request, response);
         } 
         
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param Request servlet Request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

 

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */


}
