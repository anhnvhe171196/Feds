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
import vn.fpt.edu.dals.Bill_DAO;
import vn.fpt.edu.dals.User_DAO;
import vn.fpt.edu.models.User;

/**
 *
 * @author admin
 */
public class UserChangeProfileController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Bill_DAO d1 = new Bill_DAO();
        HttpSession session = request.getSession();
        User u = (User)session.getAttribute("account");
        double totalPrice = d1.getSumOfBillByUserId(u.getUser_Id());
        int numberBillDone = d1.getNumberOrderUser(u.getUser_Id(), "Hoàn Thành");
        int totolBill = d1.getTotalOrderUser(u.getUser_Id());
        request.setAttribute("totolBill", totolBill);
        request.setAttribute("numberBillDone", numberBillDone);
        request.setAttribute("total", totalPrice);
        request.getRequestDispatcher("UserChangeProfile.jsp").forward(request, response);
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
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        User_DAO d = new User_DAO();
        d.changeInfor(username, email, phone);
        HttpSession session = request.getSession();
        User u = d.getCustomerByEmail(email);
        session.removeAttribute("account");
        session.setAttribute("account", u);
        response.sendRedirect("userChangeProfile");
    }
}
