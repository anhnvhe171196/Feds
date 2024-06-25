/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.salecontroller;

import vn.fpt.edu.dals.Bill_DAO;
import vn.fpt.edu.models.Bill1;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.dals.Product_DAO;
import vn.fpt.edu.models.Product;
import java.time.LocalDate;
import java.time.Month;

/**
 *
 * @author Trong
 */
@WebServlet(name = "SaleDashboard", urlPatterns = {"/saleDashboard"})

public class BillOrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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
        HttpSession session = request.getSession(true);
        String action = request.getParameter("action");
        
        LocalDate today = LocalDate.now();
        Bill_DAO bd = new Bill_DAO();

        if (action == null) {
            int numOfBills = bd.getNumOfBillCurrentDate();
            int sumOfDoneBills = bd.getSumOfDoneBill();
            double sumOfBillByMonth = bd.getSumOfBillByMonth(today.getMonthValue());
            
            session.setAttribute("numOfBills", numOfBills);
            session.setAttribute("sumOfDoneBills", sumOfDoneBills);
            session.setAttribute("sumOfBillByMonth", sumOfBillByMonth);
            List<Bill1> billList = bd.getBillAllWithUserToday();
            session.setAttribute("billList", billList);
            request.getRequestDispatcher("SaleHome.jsp").forward(request, response);
        } else if (action.equals("sumByMonth")) {
            int numOfBills = bd.getNumOfBillCurrentDate();
            int sumOfDoneBills = bd.getSumOfDoneBill();
            int month = Integer.parseInt(request.getParameter("month"));
            double sumOfBillByMonth = bd.getSumOfBillByMonth(month);

            session.setAttribute("numOfBills", numOfBills);
            session.setAttribute("sumOfDoneBills", sumOfDoneBills);
            session.setAttribute("sumOfBillByMonth", sumOfBillByMonth);
            List<Bill1> billList = bd.getBillAllWithUserToday();
            session.setAttribute("billList", billList);
            session.setAttribute("month", month);

            request.getRequestDispatcher("SaleHome.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession(true);
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String startdate = request.getParameter("startdate");
        String enddate = request.getParameter("enddate");
        PrintWriter o = response.getWriter();
        Product_DAO pd = new Product_DAO();
        List<Product> productSellingList = pd.getSellingProduct(startdate, enddate, quantity);

        List<String> productNames = new ArrayList<>();
        List<Integer> quantities = new ArrayList<>();

        for (Product product : productSellingList) {
            productNames.add(product.getProduct_name());
            quantities.add(product.getQuantity());
        }
//        out.print(productNames);
//        out.print(quantities);
        session.setAttribute("startdate", startdate);
        session.setAttribute("enddate", enddate);
        session.setAttribute("quantity", quantity);
        session.setAttribute("name", productNames);
        session.setAttribute("sum", quantities);
        request.getRequestDispatcher("SaleHome.jsp").forward(request, response);
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
