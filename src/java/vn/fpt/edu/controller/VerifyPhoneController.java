/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import jakarta.servlet.ServletException;
import java.io.IOException;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.Random;
import vn.fpt.edu.dals.User_DAO;
import vn.fpt.edu.models.User;

/**
 *
 * @author admin
 */
@WebServlet(name = "VerifyPhoneController", urlPatterns = {"/verifyPhoneController"})
public class VerifyPhoneController extends HttpServlet {

    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String phoneNumber = request.getParameter("mobile");
        phoneNumber = "+84" + phoneNumber.substring(1);
        String verificationCode = generateVerificationCode();
        request.getSession().setAttribute("verificationCode", verificationCode);
        Message message = Message.creator(
                new PhoneNumber(phoneNumber),
                new PhoneNumber("+17206368985"),
                "Đây là mã code của bạn: " + verificationCode)
                .create();
        request.setAttribute("error", "Mã xác nhận đã được gửi vào điện thoại của bạn");
        request.getRequestDispatcher("UserChangePassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String verifile = request.getParameter("verify");
        HttpSession session = request.getSession();
        String verifileConfirm = (String) session.getAttribute("verificationCode");
        if (!verifile.equals(verifileConfirm)) {
            request.setAttribute("error", "Mã xác nhận không đúng vui lòng nhập lại");
            request.getRequestDispatcher("UserChangePassword.jsp").forward(request, response);
        } else {
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            if (!password.equals(confirmPassword)) {
                request.setAttribute("error", "Mật khẩu mới và xác nhận mật khẩu không khớp!!! vui lòng nhập lại");
                request.getRequestDispatcher("UserChangePassword.jsp").forward(request, response);
            } else {
                User_DAO d = new User_DAO();
                User u = (User) session.getAttribute("account");
                d.chagePassword(password, u.getEmail());
                session.removeAttribute("verificationCode");
                request.setAttribute("error", "Bạn đã đổi mật khẩu thành công!!!");
                request.getRequestDispatcher("UserLogin.jsp").forward(request, response);
            }
        }

    }

    private String generateVerificationCode() {
        Random random = new Random();
        int code = random.nextInt(9000) + 1000; // Mã có 4 chữ số
        return String.valueOf(code);
    }

}
