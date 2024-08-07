/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.salecontroller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import vn.fpt.edu.dals.BillOrder_DAO;
import vn.fpt.edu.dals.Bill_DAO;
import vn.fpt.edu.dals.ProductDetail_DAO;
import vn.fpt.edu.models.BillOrder;

/**
 *
 * @author Trong
 */
public class BillDetailBillController extends HttpServlet {

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
            out.println("<title>Servlet BillDetailBillController1</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BillDetailBillController1 at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");
        if (action == null) {
            int id = Integer.parseInt(request.getParameter("id"));
            BillOrder_DAO bod = new BillOrder_DAO();

            List<BillOrder> listBillOrder = bod.getBillOrder(id);
            session.setAttribute("status", listBillOrder.get(0).getStatus());
            session.setAttribute("listBillOrder", listBillOrder);
            session.setAttribute("idBill", listBillOrder.get(0).getBill_id());
            request.getRequestDispatcher("OrderDetail.jsp").forward(request, response);
        } else if (action.equals("search")) {
            
            String value = request.getParameter("value").trim();
            if(value == null){ 
            int id = Integer.parseInt(request.getParameter("id"));
            BillOrder_DAO bod = new BillOrder_DAO();

            List<BillOrder> listBillOrder = bod.getBillOrder(id);
            session.setAttribute("status", listBillOrder.get(0).getStatus());
            session.setAttribute("listBillOrder", listBillOrder);
            session.setAttribute("idBill", listBillOrder.get(0).getBill_id());
            request.getRequestDispatcher("OrderDetail.jsp").forward(request, response);
            } else if(value != null) { 
            int id = Integer.parseInt(request.getParameter("id"));
            BillOrder_DAO bod = new BillOrder_DAO();

            List<BillOrder> listBillOrder = bod.getBillOrderByName(id, value);
            session.setAttribute("value", value);
            session.setAttribute("listBillOrder", listBillOrder);
            request.getRequestDispatcher("OrderDetail.jsp").forward(request, response);
            }
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
        HttpSession session = request.getSession();
        String id = request.getParameter("id");
        String status = request.getParameter("status");
        Bill_DAO bd = new Bill_DAO();
        bd.updateStatusBill(status, id);
        session.removeAttribute("status");
        session.setAttribute("status", status);
        request.getRequestDispatcher("OrderDetail.jsp").forward(request, response);
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
