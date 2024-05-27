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
import vn.fpt.edu.dals.User_DAO;
import vn.fpt.edu.models.User;

/**
 *
 * @author admin
 */
public class UserForgotPasswordController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("UserForgotPassword.jsp").forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        User_DAO d = new User_DAO();
        if (d.getCustomerByEmail(email) != null) {
            User account = d.getCustomerByEmail(email);
            // Cấu hình thông tin email
            String host = "smtp.gmail.com";
            String port = "587";
            String username = "anhnvhe171196@fpt.edu.vn";
            String password = "cpautzrmivqsxoiu";
            String fromAddress = "anhnvhe171196@fpt.edu.vn";
            String toAddress = account.getEmail();
            String subject = "Subject of the email";
            String messageContent = "<!DOCTYPE html>\n"
                    + "<html lang=\"en\">\n"
                    + "\n"
                    + "<head>\n"
                    + "  <meta charset=\"utf-8\">\n"
                    + "  <meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\">\n"
                    + "</head>\n"
                    + "\n"
                    + "<body>\n"
                    + "  <div style=\"text-align: center;\">\n"
                    + "      <h1 style=\"color: red;\">Fed Shop</h1>\n"
                    + "      <h2>Confirmed password change</h2>\n"
                    + "      <div style=\"font-size: 20px;\">Please click here to change password : </div>\n"
                    + "      <h2><a href=\"http://localhost:9999/Feds/userRandomPassword?email="+email+"\">Click here</a></h2>\n"
                    + "  </div>\n"
                    + "</body>\n"
                    + "\n"
                    + "</html>";

            // Cấu hình Jakarta Mail
            Properties properties = new Properties();
            properties.put("mail.smtp.host", host);
            properties.put("mail.smtp.port", port);
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.starttls.required", "true");

            // Xây dựng đối tượng Session để xác thực và kết nối đến SMTP server
            Session session = Session.getInstance(properties, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });
            try {
                // Tạo đối tượng MimeMessage
                MimeMessage message = new MimeMessage(session);

                // Thiết lập thông tin người gửi
                message.setFrom(new InternetAddress(fromAddress));

                // Thiết lập thông tin người nhận
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(toAddress));

                // Thiết lập tiêu đề và nội dung email
                message.setSubject(subject);
                message.setContent(messageContent, "text/html");
                // Gửi email
                Transport.send(message);

                // Chuyển hướng người dùng sau khi gửi email thành công
                request.setAttribute("error", "Vui lòng check lại email để xác nhận thay đổi mật khẩu !!!");
            request.getRequestDispatcher("UserLogin.jsp").forward(request, response);
            } catch (MessagingException mex) {
                // Xử lý lỗi nếu có
                mex.printStackTrace();
                response.sendRedirect("forgotpass");
            }

        } else {
            request.setAttribute("error", "Email chưa được đăng kí!!!");
            request.getRequestDispatcher("UserForgotPassword.jsp").forward(request, response);
        }
    }
}
