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
import vn.fpt.edu.models.Product;

/**
 *
 * @author admin
 */
public class MarketingProductController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String action = request.getParameter("action");
        PrintWriter out = response.getWriter();
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        Data_SaleDashboard_DAO data = new Data_SaleDashboard_DAO();
        List<Product> productSellingList = data.getSellingProduct(startdate, enddate, quantity);

        List<String> productNames = new ArrayList<>();
        List<Integer> quantities = new ArrayList<>();

        for (Product product : productSellingList) {
            productNames.add(product.getProduct_name());
            quantities.add(product.getQuantity());
        }

        session.setAttribute("name", productNames);
        session.setAttribute("sum", quantities);
        request.getRequestDispatcher("OrderProcessor.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
