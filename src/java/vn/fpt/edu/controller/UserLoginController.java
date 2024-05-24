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
import vn.fpt.edu.dals.Customer_DAO;
import vn.fpt.edu.models.User;

/**
 *
 * @author admin
 */
public class UserLoginController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        String user = request.getParameter("email");
        String pass = request.getParameter("password");
        Customer_DAO d = new Customer_DAO();
        User u = d.getCustomerByEmail(user);
        if (u == null) {
            request.setAttribute("error", "Tài khoản hoặc mật khẩu không đúng!!!");
            request.getRequestDispatcher("UserLogin.jsp").forward(request, response);
        }
        if (pass.equals(u.getPassword())) {
            HttpSession session = request.getSession();
            session.setAttribute("account", u);
            response.sendRedirect("home");
        } else {
            request.setAttribute("error", "Tài khoản hoặc mật khẩu không đúng!!!");
            request.getRequestDispatcher("UserLogin.jsp").forward(request, response);

        }
    }
}
