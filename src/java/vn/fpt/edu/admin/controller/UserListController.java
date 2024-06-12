/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.admin.controller;

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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.dals.Role_DAO;
import vn.fpt.edu.dals.User_DAO;
import vn.fpt.edu.models.Role;
import vn.fpt.edu.models.User;

/**
 *
 * @author admin
 */
public class UserListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getSession().getAttribute("account") == null || ((User)request.getSession().getAttribute("account")).getRole().getId() != 1) {
            response.sendRedirect(request.getContextPath()+"/login");
            return;
        }
        User_DAO dao = new User_DAO();
        List<User> users = new ArrayList();
        String Spage = request.getParameter("page");
        int p = 1;
        if(Spage != null) {
            try {
                p = Integer.parseInt(Spage);
            } catch(Exception e) {}
        }
        int total = 0;
        if(request.getParameter("Sort") != null && request.getParameter("search") == null) {
            total = dao.getUserSortCount(request.getParameter("Sort"));
            users = dao.getUserSort(request.getParameter("Sort"), p);
        } else if(request.getParameter("search") == null) {
            total = dao.getUserCount();
            users = dao.getUserPage(p);
        } else if(request.getParameter("search") != null && request.getParameter("Sort") == null) {
            total = dao.getUserSearchCount(request.getParameter("search"), request.getParameter("searchBy"));
            users = dao.getUserSearch(request.getParameter("search"), request.getParameter("searchBy"), p);
        } else {
            total = dao.getUserSearchAndSortCount(request.getParameter("search"), request.getParameter("searchBy"), request.getParameter("Sort"));
            users = dao.getUserSearchAndSort(request.getParameter("search"), request.getParameter("searchBy"), request.getParameter("Sort"), p);
        }
        int max = (total / 9) + ((total / 9) > (float)(total / 9.0) ? 0 : 1);
        request.setAttribute("total", total);
        request.setAttribute("max", max);
        request.setAttribute("page", p);
        request.setAttribute("users", users);
        Role_DAO roleDAO = new Role_DAO();
        List<Role> roles = roleDAO.getAllRole();
        request.setAttribute("roles", roles);
            //System.out.println(users.size());
        request.getRequestDispatcher("userlist.jsp").forward(request, response);
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
        User_DAO dao = new User_DAO();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");
        User u = new User();
        u.setEmail(email);
        u.setPassword(password);
        u.setPhone_number(phone);
        u.setUser_name(username);
        Role r = new Role();
        r.setId(Integer.parseInt(role));
        u.setRole(r);
        u.setAvarta("");
        dao.insertCustomer(u);
        response.sendRedirect("users");
    }

}
