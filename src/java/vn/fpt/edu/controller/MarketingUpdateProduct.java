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
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import vn.fpt.edu.dals.Data_MarketingDashboard_DAO;
import vn.fpt.edu.models.Price;
import vn.fpt.edu.models.Product1;
import vn.fpt.edu.models.ProductDetail;

/**
 *
 * @author rimok
 */
@WebServlet(name = "MarketingUpdateProduct", urlPatterns = {"/marketingUpdateProduct"})
public class MarketingUpdateProduct extends HttpServlet {

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
            out.println("<title>Servlet MarketingUpdateProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MarketingUpdateProduct at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        Data_MarketingDashboard_DAO dt = new Data_MarketingDashboard_DAO();

        int productId = Integer.parseInt(request.getParameter("product_id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String productName = request.getParameter("product_name");
        String productImg = request.getParameter("product_img");
        String Pstatus = request.getParameter("Pstatus");

        if (Pstatus == null) {
            Pstatus = "Deleted"; // Thay đổi trạng thái thành Deleted
        }
        String ram = request.getParameter("ram");
        String rom = request.getParameter("rom");
        String size = request.getParameter("size");
        String battery = request.getParameter("battery");
        String weight = request.getParameter("weight");
        String color = request.getParameter("color");
        String decription = request.getParameter("decription");
        String cpu = request.getParameter("cpu");
        String wattage = request.getParameter("wattage");
        String status = request.getParameter("status");
        String priceString = request.getParameter("price");
        double price = Double.parseDouble(priceString.replace(".", ""));
        String dateStartString = request.getParameter("dateStart");
        String dateEndString = request.getParameter("dateEnd");
        String dateString = request.getParameter("importDate");
        Date date = null;
        if (dateString != null && !dateString.isEmpty()) {
            date = java.sql.Date.valueOf(dateString);
        } else {
            date = java.sql.Date.valueOf(LocalDate.now());
        }
        Date dateStart = null;
        Date dateEnd = null;

        if (dateStartString != null && !dateStartString.isEmpty()) {
            dateStart = java.sql.Date.valueOf(dateStartString);
        }

        if (dateEndString != null && !dateEndString.isEmpty()) {
            dateEnd = java.sql.Date.valueOf(dateEndString);
        }
        int sale = Integer.parseInt(request.getParameter("sale"));

        Product1 product = new Product1(productId, quantity, productName, productImg, null, null, Pstatus, date);
        ProductDetail detail = new ProductDetail(ram, rom, size, battery, weight, color, decription, cpu, wattage, status, product);
        Price priceObj = new Price(price, dateStart, dateEnd, sale, product);

        boolean success = dt.updateProduct(product);
        success &= dt.updateProductDetail(detail);
        success &= dt.updatePrice(priceObj);

        request.setAttribute("product", product);
        response.sendRedirect("marketingProductList");
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
