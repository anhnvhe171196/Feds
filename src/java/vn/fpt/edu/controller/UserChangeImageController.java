/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import vn.fpt.edu.dals.User_DAO;
import vn.fpt.edu.models.User;

/**
 *
 * @author admin
 */
@MultipartConfig()
public class UserChangeImageController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        try {
            String email = request.getParameter("email");
            Part part = request.getPart("photo");
            String readpath = getServletContext().getRealPath("/images");
            String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();

            // Thêm timestamp vào tên file để tránh trùng lặp
            filename = filename.substring(0, filename.lastIndexOf(".")) + "_" + System.currentTimeMillis() + filename.substring(filename.lastIndexOf("."));

            // Kiểm tra thư mục images
            if (!Files.exists(Path.of(readpath))) {
                Files.createDirectories(Path.of(readpath));
            }
            part.write(readpath + "/" + filename);

            // Cập nhật đường dẫn ảnh trong database
            String img = filename;
            User_DAO d = new User_DAO();
            d.changeImg(email, img);
            HttpSession session = request.getSession();
            session.removeAttribute("account");
            session.setAttribute("account", d.getCustomerByEmail(email));
            response.sendRedirect("userChangeProfile");
        } catch (Exception e) {
        }
    }
}
