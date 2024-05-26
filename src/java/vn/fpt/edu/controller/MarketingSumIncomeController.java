/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package vn.fpt.edu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.dals.Data_SaleDashboard_DAO;
import vn.fpt.edu.models.Bill;

/**
 *
 * @author admin
 */
public class MarketingSumIncomeController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        Data_SaleDashboard_DAO data = new Data_SaleDashboard_DAO();
        List<Bill> sum = data.getSumRevenueByDay(startdate, enddate);

        List<String> billDate = new ArrayList<>();
        List<Double>sumByDay = new ArrayList<>();

        for (Bill s : sum) {
            billDate.add(s.getDate());
            sumByDay.add(s.getTotal_price());
        }

        session.setAttribute("name1", billDate);
        session.setAttribute("sum1", sumByDay);
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
