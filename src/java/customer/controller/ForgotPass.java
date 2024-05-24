/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package customer.controller;

import static customer.controller.RegisterGoogle.randomPassword;
import dals.Customer_DAO;
import entities.User;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Properties;

/**
 *
 * @author rimok
 */
@WebServlet(name = "ForgotPass", urlPatterns = {"/forgotpass"})
public class ForgotPass extends HttpServlet {

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
            out.println("<title>Servlet ForgotPass</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPass at " + request.getContextPath() + "</h1>");
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
        request.getRequestDispatcher("forgotpass.jsp").forward(request, response);
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
        String email = request.getParameter("email");
        Customer_DAO d = new Customer_DAO();
        if (d.getCustomerByEmail(email) != null) {
            User account = d.getCustomerByEmail(email);
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
                    + "      <h2>Confirmed password change</h2>\n"
                    + "      <div style=\"font-size: 20px;\">That is your new password : </div>\n"
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
                d.chagePassword(pass, email);

                // Chuyển hướng người dùng sau khi gửi email thành công
                request.setAttribute("error", "Bạn đã thay đổi mật khẩu thành công!!!");
            request.getRequestDispatcher("forgotpass.jsp").forward(request, response);
            } catch (MessagingException mex) {
                // Xử lý lỗi nếu có
                mex.printStackTrace();
                response.sendRedirect("forgotpass");
            }

        } else {
            request.setAttribute("error", "Email chưa được đăng kí!!!");
            request.getRequestDispatcher("forgotpass.jsp").forward(request, response);
        }
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
