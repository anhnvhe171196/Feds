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
import java.security.SecureRandom;
import java.util.Properties;
import vn.fpt.edu.dals.Customer_DAO;
import vn.fpt.edu.models.GoogleAcount;

/**
 *
 * @author admin
 */
public class UserRegisterGoogleController extends HttpServlet {
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        String accesToken = UserRegisterTokenController.getToken(code);
        GoogleAcount account = UserRegisterTokenController.getUserInfo(accesToken);
        Customer_DAO d = new Customer_DAO();
        if (d.getCustomerByEmail(account.getEmail()) != null) {
            request.setAttribute("error", "Email đã được sử dụng!!!");
            request.getRequestDispatcher("UserRegister.jsp").forward(request, response);
        } else {
            String pass = randomPassword(8);
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
                    + "      <h2>Thank you for registering for a Fed Shop account</h2>\n"
                    + "      <div style=\"font-size: 20px;\">That is your password : </div>\n"
                    + "      <h2>" + pass + "</h2>\n"
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
                d.insertCustomerByGoogleAccount(account, pass, "9-anh-dai-dien-trang-inkythuatso-03-15-27-03.jpg");

                // Chuyển hướng người dùng sau khi gửi email thành công
                request.setAttribute("error", "Đã đăng kí thành công!!!");
                request.getRequestDispatcher("UserLogin.jsp").forward(request, response);
            } catch (MessagingException mex) {
                // Xử lý lỗi nếu có
                mex.printStackTrace();
                response.sendRedirect("register");
            }
        }
    }

    public static String randomPassword(int length) {
        SecureRandom random = new SecureRandom();
        StringBuilder password = new StringBuilder();
        final String UPPER = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        final String LOWER = "abcdefghijklmnopqrstuvwxyz";
        final String DIGITS = "0123456789";
        final String SPECIAL = "!@#$%^&*()-_=+<>?";
        // Add at least one character from each character set

        password.append(UPPER.charAt(random.nextInt(UPPER.length())));
        password.append(LOWER.charAt(random.nextInt(LOWER.length())));
        password.append(DIGITS.charAt(random.nextInt(DIGITS.length())));
        password.append(SPECIAL.charAt(random.nextInt(SPECIAL.length())));

        // Fill the rest of the password with random characters
        for (int i = 4;
                i < length;
                i++) {
            String charSet = UPPER + LOWER + DIGITS + SPECIAL;
            password.append(charSet.charAt(random.nextInt(charSet.length())));
        }

        // Shuffle the characters in the password to make it more random
        for (int i = 0;
                i < length;
                i++) {
            int randomIndex = random.nextInt(length);
            char temp = password.charAt(i);
            password.setCharAt(i, password.charAt(randomIndex));
            password.setCharAt(randomIndex, temp);
        }

        return password.toString();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
