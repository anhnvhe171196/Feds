/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package vn.fpt.edu.salecontroller;

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
import vn.fpt.edu.dals.Product_DAO;
import vn.fpt.edu.models.Product;

/**
 *
 * @author Trong
 */
@WebServlet(name="TrendingCategory", urlPatterns={"/trendingCategory"})
public class ProductSaleController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet TrendingCategory</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TrendingCategory at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        PrintWriter o = response.getWriter();
        String month1 = request.getParameter("month1");
        String year = request.getParameter("year");
        Product_DAO pd = new Product_DAO();
        List<Product> productSellingList = pd.getTrendCategory(month1, year);

        List<String> productcate = new ArrayList<>();
        List<Integer> quantities = new ArrayList<>();
        PrintWriter out = response.getWriter();
        for (Product product : productSellingList) {
            productcate.add(product.getCategory_name());
            
            quantities.add(product.getQuantity());
        }
//        o.print(productcate); o.print(quantities);
        session.setAttribute("monthtrend", month1);
        session.setAttribute("year", year);
        session.setAttribute("name2", productcate);
        session.setAttribute("sum2", quantities);
        request.getRequestDispatcher("SaleHome.jsp").forward(request, response);
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
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
