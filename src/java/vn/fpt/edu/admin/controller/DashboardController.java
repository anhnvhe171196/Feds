/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.admin.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.HashMap;
import java.util.Random;
import vn.fpt.edu.dals.Bill_DAO;
import vn.fpt.edu.dals.Category_DAO;
import vn.fpt.edu.dals.Feedback_DAO;
import vn.fpt.edu.dals.User_DAO;
import vn.fpt.edu.models.User;

/**
 *
 * @author admin
 */
public class DashboardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getSession().getAttribute("account") == null || ((User)request.getSession().getAttribute("account")).getRole().getId() != 1) {
            response.sendRedirect(request.getContextPath()+"/login");
            return;
        }
        Bill_DAO bDAO = new Bill_DAO();
        request.setAttribute("doneOrder", bDAO.getTotalSuccessOrder()); 
        request.setAttribute("cancelOrder", bDAO.getTotalCanceledOrder()); 
        request.setAttribute("submitOrder", bDAO.getTotalOrder()); 
        
        HashMap<Date, Integer> trendAll = bDAO.TrendAll();
        HashMap<Date, Integer> trendDone = bDAO.TrendDone();
        request.setAttribute("trendAll", trendAll);
        request.setAttribute("trendDone", trendDone);
        
        request.setAttribute("Revenues", bDAO.totalRevenue()); 
        HashMap<String, Long> h = bDAO.totalRevenueByCate();
        request.setAttribute("RevenueCate", h); 
        Category_DAO cDAO = new Category_DAO();
        request.setAttribute("CateWithStock", cDAO.getAllCateWithStock()); 
        request.setAttribute("CateWithCount", cDAO.getAllCateWithCount()); 
        
        Feedback_DAO fDAO = new Feedback_DAO();
        //HashMap<Integer, Float> f = fDAO.AverageFeedbackByCate();
        request.setAttribute("Feedback", fDAO.AverageFeedback()); 
        //request.setAttribute("FeedbackCate", f); 
        
        User_DAO uDAO = new User_DAO();
        //request.setAttribute("newlyBought", bDAO.newlyBoughtUser()); 
        request.setAttribute("newlyRegistered", uDAO.newlyRegistered()); 
        
        //Category_DAO cateDAO = new Category_DAO();
        //request.setAttribute("cates", cateDAO.getAllCate()); 
        request.getRequestDispatcher("dashboard.jsp").forward(request, response);
    }
    public static String randomColor() {
        
        
        // create random object - reuse this as often as possible
        Random random = new Random();
        
        // create a big random number - maximum is ffffff (hex) = 16777215 (dez)
        int nextInt = random.nextInt(0xffffff + 1);
        
        // format it as hexadecimal string (with hashtag and leading zeros)
        String colorCode = String.format("#%06x", nextInt);
        return colorCode;
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
    }

}
