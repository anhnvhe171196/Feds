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
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.dals.Bill_DAO;
import vn.fpt.edu.models.Bill1;

/**
 *
 * @author Trong
 */
public class BillListBillController extends HttpServlet {

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
            out.println("<title>Servlet OrderListBillController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderListBillController at " + request.getContextPath() + "</h1>");
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
        Bill_DAO bd = new Bill_DAO();

        if (action == null) {   
            List<Bill1> listBill = bd.getBillAllWithUserPagingSQL(1, 10);
            session.setAttribute("listBill", listBill);
            
            int totalPages = bd.getNumOfPageBillList(10);
            int currentPage = 1;
            session.setAttribute("page", currentPage);
            request.setAttribute("totalPages", totalPages);
            
            request.getRequestDispatcher("OrderList.jsp").forward(request, response);
        } else if (action.equals("sortByDateAsc")) {
            List<Bill1> listBill = bd.getBillAllWithUserSortByDate("Asc");
            session.setAttribute("listBill", listBill);
            request.getRequestDispatcher("OrderList.jsp").forward(request, response);
        } else if (action.equals("sortByDateDesc")) {
            List<Bill1> listBill = bd.getBillAllWithUserSortByDate("Desc");
            session.setAttribute("listBill", listBill);
            request.getRequestDispatcher("OrderList.jsp").forward(request, response);
        } else if (action.equals("sortByBillIdAsc")) {
            List<Bill1> listBill = bd.getBillAllWithUserSortByBillId("Asc");
            session.setAttribute("listBill", listBill);
            request.getRequestDispatcher("OrderList.jsp").forward(request, response);
        } else if (action.equals("sortByBillIdDesc")) {
            List<Bill1> listBill = bd.getBillAllWithUserSortByBillId("Desc");
            session.setAttribute("listBill", listBill);
            request.getRequestDispatcher("OrderList.jsp").forward(request, response);
        } else if (action.equals("sortByValueAsc")) {
            List<Bill1> listBill = bd.getBillAllWithUserSortByValue("Asc");
            session.setAttribute("listBill", listBill);
            request.getRequestDispatcher("OrderList.jsp").forward(request, response);
        } else if (action.equals("sortByValueDesc")) {
            List<Bill1> listBill = bd.getBillAllWithUserSortByValue("Desc");
            session.setAttribute("listBill", listBill);
            request.getRequestDispatcher("OrderList.jsp").forward(request, response);
        } else if (action.equals("showAll")) {
            List<Bill1> listBill = bd.getBillAllWithUser();
            session.setAttribute("listBill", listBill);
            request.getRequestDispatcher("OrderList.jsp").forward(request, response);
        } else if (action.equals("search")) {
            String value = request.getParameter("value");
            session.setAttribute("value", value);

            List<Bill1> listBill = bd.searchBills(value);
            session.setAttribute("listBill", listBill);
            request.getRequestDispatcher("OrderList.jsp").forward(request, response);
        }else if(action.equals("paging")){ 
            int page = Integer.parseInt(request.getParameter("page"));
            List<Bill1> listBill = bd.getBillAllWithUserPagingSQL(page, 10);
            session.setAttribute("listBill", listBill);
            
            session.setAttribute("page", page);
            int totalPages = bd.getNumOfPageBillList(10);
            request.setAttribute("totalPages", totalPages);
            request.getRequestDispatcher("OrderList.jsp").forward(request, response);
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
    
}
