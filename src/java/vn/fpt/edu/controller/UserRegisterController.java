/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package vn.fpt.edu.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.fpt.edu.dals.Customer_DAO;
import vn.fpt.edu.models.User;

/**
 *
 * @author admin
 */
public class UserRegisterController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("UserRegister.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        String email = request.getParameter("email");
        Customer_DAO cd = new Customer_DAO();
        if (cd.getCustomerByEmail(email) != null) {
            request.setAttribute("error", "Email đã được sử dụng!!!");
            request.getRequestDispatcher("UserRegister.jsp").forward(request, response);
        } else {
            String phoneNumber = request.getParameter("phoneNumber");
            User c = new User(0,pass, username, email, phoneNumber, 5, "9-anh-dai-dien-trang-inkythuatso-03-15-27-03.jpg");
            cd.insertCustomer(c);
            request.setAttribute("error", "Đã đăng kí thành công!!!");
            request.getRequestDispatcher("UserLogin.jsp").forward(request, response);
        }
    }
}
