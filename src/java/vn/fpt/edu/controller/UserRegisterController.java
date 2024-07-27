/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Properties;
import vn.fpt.edu.dals.Role_DAO;
import vn.fpt.edu.dals.User_DAO;
import vn.fpt.edu.models.Role;
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
        String username1 = request.getParameter("username");
        String pass = request.getParameter("password");
        String email = request.getParameter("email");
        User_DAO cd = new User_DAO();
        if (cd.getCustomerByEmail(email) != null) {
            request.setAttribute("error", "Email đã được sử dụng!!!");
            request.getRequestDispatcher("UserRegister.jsp").forward(request, response);
        } else {
            String phoneNumber = request.getParameter("phoneNumber");
            String gender = request.getParameter("gender");
            boolean check = false;
            if(gender.equalsIgnoreCase("male")){
                check = true;
            }
            Role_DAO rd = new Role_DAO();
            Role r = rd.getRoleById(5);
            User c = new User(0, pass, username1, email, phoneNumber, r, "9-anh-dai-dien-trang-inkythuatso-03-15-27-03.jpg", false, check);
            cd.insertCustomer(c);
            request.setAttribute("error", "Đã đăng kí thành công!!!");
            request.getRequestDispatcher("UserLogin.jsp").forward(request, response);
        }
    }
}
