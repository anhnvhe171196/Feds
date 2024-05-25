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
import vn.fpt.edu.dals.Customer_DAO;
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
        try {
            String email = request.getParameter("email");
            Part part = request.getPart("photo");
            String readpath = getServletContext().getRealPath("/" + "images");
            String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();
            if (!Files.exists(Path.of(readpath))) {
                Files.createDirectories(Path.of(readpath));
            }
            part.write(readpath + "/" + filename);
            String img = filename;
            Customer_DAO d = new Customer_DAO();
            d.changeImg(email, img);
            User u = d.getCustomerByEmail(email);
            HttpSession session = request.getSession();
            session.removeAttribute("account");
            session.setAttribute("account", u);
            response.sendRedirect("userChangeProfile");
        } catch (Exception e) {
        }
    }
}
