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
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        Data_MarketingDashboard_DAO data = new Data_MarketingDashboard_DAO();
        List<Product> productSellingList = data.getTrendCategory(startdate, enddate);

        List<String> productcate = new ArrayList<>();
        List<Integer> quantities = new ArrayList<>();
        PrintWriter out = response.getWriter();
        for (Product product : productSellingList) {
            productcate.add(product.getCategory_name());
            
            quantities.add(product.getQuantity());
        }

        session.setAttribute("name2", productcate);
        session.setAttribute("sum2", quantities);
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
