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
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.dals.Data_MarketingDashboard_DAO;
import vn.fpt.edu.models.Product;

/**
 *
 * @author admin
 */
public class MaketingTrendingController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        String startmonth = request.getParameter("startmonth");
        String startYear = request.getParameter("startyear");

        Data_MarketingDashboard_DAO data = new Data_MarketingDashboard_DAO();
        List<Product> trend = data.getTrendCategory(startmonth, startYear);

        List<String> productcate = new ArrayList<>();
        List<Integer> quantities = new ArrayList<>();

        for (Product product : trend) {
            productcate.add(product.getCategory_name());  
            quantities.add(product.getQuantity());
        }
        
        session.setAttribute("startmonth", startmonth);
        session.setAttribute("startYear", startYear);   
        session.setAttribute("ProductCategory", productcate);
        session.setAttribute("Quan", quantities);
        request.getRequestDispatcher("OrderProcessor.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
