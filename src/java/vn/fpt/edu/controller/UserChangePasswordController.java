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
public class UserChangePasswordController extends HttpServlet {
   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("UserChangePassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String oldPassword = request.getParameter("oldPassword");
        Customer_DAO d = new Customer_DAO();
        User u = d.getCustomerByEmail(email);
        if (!u.getPassword().equals(oldPassword)) {
            request.setAttribute("error", "Bạn đã nhập sai mật khẩu cũ");
            request.getRequestDispatcher("UserChangePassword.jsp").forward(request, response);
        }
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu mới và xác nhận mật khẩu sai!!! vui lòng nhập lại");
            request.getRequestDispatcher("UserChangePassword.jsp").forward(request, response);
        } else {
            d.chagePassword(password, email);
            request.setAttribute("error", "Bạn đã đổi mật khẩu thành công!!!");
            request.getRequestDispatcher("UserLogin.jsp").forward(request, response);
        }
    }
}
