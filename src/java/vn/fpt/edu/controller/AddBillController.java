/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;
import vn.fpt.edu.dals.Bill_DAO;
import vn.fpt.edu.dals.Product_DAO;
import vn.fpt.edu.dals.User_DAO;
import vn.fpt.edu.models.Cart;
import vn.fpt.edu.models.User;

/**
 *
 * @author admin
 */
public class AddBillController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddBillController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddBillController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");
        Bill_DAO d = new Bill_DAO();
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
        
        String tinh = request.getParameter("tinh");
        String quan = request.getParameter("quan");
        String phuong = request.getParameter("phuong");
        String address = request.getParameter("address");
        String paymentOption = request.getParameter("paymentOptions");
        String status = "Chờ xử lý";
        
//        PrintWriter out = response.getWriter();
//        out.println("<html><head><title>Parameter Values</title></head><body>");
//        out.println("<h1>Parameter Values</h1>");
//        out.println("<p>Tinh: " + tinh + "</p>");
//        out.println("<p>Quan: " + quan + "</p>");
//        out.println("<p>Phuong: " + phuong + "</p>");
//        out.println("<p>Address: " + address + "</p>");
//        out.println("<p>Payment Option: " + paymentOption + "</p>");

        Cart cart = new Cart(txt, data.getAllProductinCart());
        
         if("tienmat".equals(paymentOption)) {
             d.addtoBill(u, cart, address, status, tinh, quan, phuong, paymentOption);
             Cookie c = new Cookie("cart", "");
             c.setMaxAge(0);
             response.addCookie(c);
             response.sendRedirect("CompleteCart.jsp");
         } else if("VNPay".equals(paymentOption)){
             d.addtoBill(u, cart, address, status, tinh, quan, phuong, paymentOption);
             Cookie c = new Cookie("cart", "");
             c.setMaxAge(0);
             response.addCookie(c);
             response.sendRedirect("QR.jsp");
         } else {
             //
         }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
