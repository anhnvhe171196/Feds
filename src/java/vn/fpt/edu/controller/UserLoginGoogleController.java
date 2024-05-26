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
import jakarta.servlet.http.HttpSession;
import vn.fpt.edu.dals.User_DAO;
import vn.fpt.edu.models.GoogleAcount;

/**
 *
 * @author admin
 */
public class UserLoginGoogleController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String accesToken = UserLoginTonkenController.getToken(code);
        GoogleAcount account = UserRegisterTokenController.getUserInfo(accesToken);
        User_DAO d = new User_DAO();
        if (d.getCustomerByEmail(account.getEmail()) != null && account.isVerified_email()) {
            HttpSession session = request.getSession();
            session.setAttribute("account", d.getCustomerByEmail(account.getEmail()));
            request.getRequestDispatcher("UserHome.jsp").forward(request, response);
        }else{
            request.setAttribute("error", "Tài khoản không tồn tại. Vui lòng đăng kí tài khoản!!!");
            request.getRequestDispatcher("UserRegister.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
