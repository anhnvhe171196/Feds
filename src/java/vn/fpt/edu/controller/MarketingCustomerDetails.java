/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.dals.Data_MarketingDashboard_DAO;
import vn.fpt.edu.dals.Product_DAO;
import vn.fpt.edu.models.Bill2;
import vn.fpt.edu.models.Order;
import vn.fpt.edu.models.Product1;
import vn.fpt.edu.models.User;
import vn.fpt.edu.models.UserDetails;
import vn.fpt.edu.models.UserDetails1;

/**
 *
 * @author rimok
 */
@WebServlet(name = "MarketingCustomerDetail", urlPatterns = {"/marketingCustomerDetail"})
public class MarketingCustomerDetails extends HttpServlet {

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
            out.println("<title>Servlet MarketingProductDetails</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MarketingProductDetails at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        Data_MarketingDashboard_DAO dt = new Data_MarketingDashboard_DAO();

        String id = request.getParameter("id");
        int index = Integer.parseInt(id);

        UserDetails u = dt.getUserById(index);
        double totalPrice = u.getTotalPrice();
        int totalOrders = u.getTotalOrders();
        int CompletedOrders = u.getCompletedOrders();
        List<Order> orders = u.getOrder();
        List<UserDetails1> product = new ArrayList<>();
        if (u.getTotalOrders() != 0) {
            for (Order order : orders) {
                Product1 p = dt.getProductById(order.getProduct_id());
                Bill2 bill = new Bill2(order.getBill_id());
                if (p != null) {
                    UserDetails1 ud = new UserDetails1(p, order.getOrder_quantity(),order.getStatus(),bill);
                    product.add(ud);
                }
            }
        }
        // Lưu thông tin vào request

        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("user", u.getUser());
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("CompletedOrders", CompletedOrders);
        request.setAttribute("product", product);

        // Chuyển hướng đến file JSP
        request.getRequestDispatcher("MarketingCustomerDetail.jsp").forward(request, response);
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
