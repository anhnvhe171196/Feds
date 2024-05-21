/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import dals.Customer_DAO;
import entities.GoogleAcount;
import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.security.SecureRandom;
import java.util.Properties;

/**
 *
 * @author admin
 */
@WebServlet(name = "RegisterGoogle", urlPatterns = {"/registerGoogle"})
public class RegisterGoogle extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
            out.println("<title>Servlet RegisterGoogle</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterGoogle at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("code");
        System.out.println("sssssss");
        String accesToken = RegisterToken.getToken(code);
        GoogleAcount account = RegisterToken.getUserInfo(accesToken);
        Customer_DAO d = new Customer_DAO();
        if (d.getCustomerByEmail(account.getEmail()) != null) {
            request.setAttribute("error", "Email đã được sử dụng!!!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
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
                    + "\n"
                    + "</head>\n"
                    + "\n"
                    + "<body>\n"
                    + "\n"
                    + "    <h1>Feds</h1>\n"
                    + "  <div>\n"
                    + "    <h1>Cảm ơn ban đã đăng kí tài khoản Fed Shop</h1>\n"
                    + "    <h2>Đây là mật khẩu tạm thời của bạn: </h2>" + pass +"\n"
                    + "\n"
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
                response.sendRedirect("login");
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
