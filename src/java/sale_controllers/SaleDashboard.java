/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sale_controllers;

import vn.fpt.edu.dals.Bill_DAO;
import vn.fpt.edu.models.Bill;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author Trong
 */
@WebServlet(name = "SaleDashboard", urlPatterns = {"/saleDashboard"})

public class SaleDashboard extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        Bill_DAO bd = new Bill_DAO();
        
        if (action == null) {
            int numOfBills = bd.getNumOfBillCurrentDate();
            int sumOfDoneBills = bd.getSumOfDoneBill();

            session.setAttribute("numOfBills", numOfBills);
            session.setAttribute("sumOfDoneBills", sumOfDoneBills);

            List<Bill> billList = bd.getBillAllWithUser();
            session.setAttribute("billList", billList);
            request.getRequestDispatcher("index_sale.jsp").forward(request, response);
        }

        else if(action.equals("sumByMonth")){ 
            int numOfBills = bd.getNumOfBillCurrentDate();
            int sumOfDoneBills = bd.getSumOfDoneBill();
            int month = Integer.parseInt(request.getParameter("month"));
            double sumOfBillByMonth = bd.getSumOfBillByMonth(month);
            
            session.setAttribute("numOfBills", numOfBills);
            session.setAttribute("sumOfDoneBills", sumOfDoneBills);
            session.setAttribute("sumOfBillByMonth", sumOfBillByMonth);
            List<Bill> billList = bd.getBillAllWithUser();
            session.setAttribute("billList", billList);
            session.setAttribute("month", month);
            
            request.getRequestDispatcher("index_sale.jsp").forward(request, response);
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
