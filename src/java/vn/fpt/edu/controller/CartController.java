/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package vn.fpt.edu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import vn.fpt.edu.dals.Bill_DAO;
import vn.fpt.edu.dals.Product_DAO;
import vn.fpt.edu.models.Cart;
import vn.fpt.edu.models.Item;
import vn.fpt.edu.models.User;

/**
 *
 * @author admin
 */
public class CartController extends HttpServlet {
   
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
            out.println("<title>Servlet CartController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartController at " + request.getContextPath () + "</h1>");
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
        Bill_DAO bill = new Bill_DAO();
        HttpSession session = request.getSession();
        Product_DAO data = new Product_DAO();
        Cookie[] arr = request.getCookies();
        String txt ="";
        if(arr!=null) { 
            for (Cookie o : arr) {
                if(o.getName().equals("cart")) { 
                    txt+=o.getValue();
                }
            }
        }
        
        Cart cart = new Cart(txt, data.getAllProductinCart());
        User u = (User)session.getAttribute("account");
        List<Item> listItem;
        if (u != null) {
             listItem = cart.getCartbyUserId(u.getUser_Id());
        }else{
            listItem = cart.getCartbyUserId(0);
        }
        session.setAttribute("list", data.getSellingProduct());
        request.setAttribute("cart", cart);
        String id = request.getParameter("billid");
        if(id != null) {
            int bid = Integer.parseInt(id);
        request.setAttribute("orderinfo1", bill.getInfoBillByBillId(bid));
        }       
        request.getRequestDispatcher("CartDetail.jsp").forward(request, response);
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
