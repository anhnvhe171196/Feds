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
import java.util.Properties;
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
    if (request.getSession().getAttribute("account") == null || ((User)request.getSession().getAttribute("account")).getRole().getId() != 1) {
      response.sendRedirect(request.getContextPath() + "/login");
      return;
    } 
    User_DAO dao = new User_DAO();
    String id = request.getParameter("id");
    if (id != null) {
      String ban = request.getParameter("ban");
      dao.banUser(Integer.parseInt(id), ban.equals("true"));
      response.sendRedirect("users");
      return;
    } 
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
    if (request.getSession().getAttribute("account") == null || ((User)request.getSession().getAttribute("account")).getRole().getId() != 1) {
      response.sendRedirect(request.getContextPath() + "/login");
      return;
    } 
    if (request.getParameter("roles") != null) {
      Role_DAO roleDAO = new Role_DAO();
      List<Role> roles = roleDAO.getAllRole();
      String jsonString = "{\"list\": [";
      for (int i = 0; i < roles.size(); i++) {
        Role s = roles.get(i);
        if (i != 0)
          jsonString = jsonString + ","; 
        jsonString = jsonString + "{";
        jsonString = jsonString + "\"ID\":" + s.getId() + ",\"Name\":\"" + s.getRoleName() + "\"";
        jsonString = jsonString + "}";
      } 
      jsonString = jsonString + "]}";
      response.setContentType("application/json");
      PrintWriter out = response.getWriter();
      out.println(jsonString);
      return;
    } 
    User_DAO dao = new User_DAO();
    if (request.getParameter("search") != null) {
      if (request.getParameter("searchCount") != null) {
        int total = dao.getUserSearchCount(request.getParameter("search"), "name");
        String str = "{\"Total\": " + total + "}";
        response.setContentType("application/json");
        PrintWriter printWriter = response.getWriter();
        printWriter.println(str);
        return;
      } 
      int page = (request.getParameter("page") == null) ? 0 : Integer.parseInt(request.getParameter("page"));
      ArrayList<User> arr = new ArrayList<>();
      if (request.getParameter("sort") != null) {
        String sort = request.getParameter("sort");
        arr = (ArrayList<User>)dao.getUserSearchAndSort(request.getParameter("search"), "name", sort, page);
      } else {
        arr = (ArrayList<User>)dao.getUserSearch(request.getParameter("search"), "name", page);
      } 
      String jsonString = "{\"list\": [";
      for (int i = 0; i < arr.size(); i++) {
        User s = arr.get(i);
        if (i != 0)
          jsonString = jsonString + ","; 
        jsonString = jsonString + "{";
        jsonString = jsonString + "\"ID\":" + s.getUser_Id() + ",\"Name\":\"" + s.getUser_name() + "\",\"Email\":\"" + s.getEmail() + "\",\"Gender\":\"" + (s.isGender() ? "Female" : "Male") + "\",\"Mobile\":\"" + s.getPhone_number() + "\",\"Role\":\"" + s.getRole().getRoleName() + "\",\"isBanned\":" + s.isBanned();
        jsonString = jsonString + "}";
      } 
      jsonString = jsonString + "]}";
      response.setContentType("application/json");
      PrintWriter out = response.getWriter();
      out.println(jsonString);
      return;
    } 
    if (request.getParameter("get") != null) {
      int page = (request.getParameter("page") == null) ? 0 : Integer.parseInt(request.getParameter("page"));
      ArrayList<User> arr = new ArrayList<>();
      if (request.getParameter("sort") != null) {
        String sort = request.getParameter("sort");
        arr = (ArrayList<User>)dao.getUserSort(sort, page);
      } else {
        arr = (ArrayList<User>)dao.getUserPage(page);
      } 
      String jsonString = "{\"list\": [";
      for (int i = 0; i < arr.size(); i++) {
        User s = arr.get(i);
        if (i != 0)
          jsonString = jsonString + ","; 
        jsonString = jsonString + "{";
        jsonString = jsonString + "\"ID\":" + s.getUser_Id() + ",\"Name\":\"" + s.getUser_name() + "\",\"Email\":\"" + s.getEmail() + "\",\"Gender\":\"" + (s.isGender() ? "Female" : "Male") + "\",\"Mobile\":\"" + s.getPhone_number() + "\",\"Role\":\"" + s.getRole().getRoleName() + "\",\"isBanned\":" + s.isBanned();
        jsonString = jsonString + "}";
      } 
      jsonString = jsonString + "]}";
      response.setContentType("application/json");
      PrintWriter out = response.getWriter();
      out.println(jsonString);
      return;
    } 
    if (request.getParameter("AllCount") != null) {
      int total = dao.getUserCount();
      String jsonString = "{\"Total\": " + total + "}";
      response.setContentType("application/json");
      PrintWriter out = response.getWriter();
      out.println(jsonString);
      return;
    } 
    if (request.getParameter("add") != null) {
      String username = request.getParameter("username");
      String password = request.getParameter("password");
      String email = request.getParameter("email");
      String phone = request.getParameter("phone");
      String role = request.getParameter("role");
      String gender = request.getParameter("gender");
      User u = new User();
      u.setEmail(email);
      u.setPassword(password);
      u.setPhone_number(phone);
      u.setUser_name(username);
      Role r = new Role();
      r.setId(Integer.parseInt(role));
      u.setRole(r);
      u.setAvarta("");
      u.setGender(gender.equals("Female"));
      boolean check = dao.insertCustomer(u);
      response.sendRedirect("users");
      if(check) {
      String host = "smtp.gmail.com";
      String port = "587";
      String fromAddress = "anhnvhe171196@fpt.edu.vn";
      String toAddress = email;
      String subject = "Register Fed Shop";
      String messageContent = "<!DOCTYPE html>\n<html lang=\"en\">\n\n<head>\n  <meta charset=\"utf-8\">\n  <meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\">\n</head>\n\n<body>\n  <div style=\"text-align: center;\">\n      <h1 style=\"color: red;\">Fed Shop</h1>\n      <h2>Thank you for registering for a Fed Shop account</h2>\n      <h3>Your password is: " + password + "</h3>\n  </div>\n</body>\n\n</html>";
      Properties properties = new Properties();
      properties.put("mail.smtp.host", host);
      properties.put("mail.smtp.port", port);
      properties.put("mail.smtp.auth", "true");
      properties.put("mail.smtp.starttls.enable", "true");
      properties.put("mail.smtp.starttls.required", "true");
      Session session = Session.getInstance(properties, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
              return new PasswordAuthentication("anhnvhe171196@fpt.edu.vn", "cpautzrmivqsxoiu");
            }
          });
      try {
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(fromAddress));
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(toAddress));
        message.setSubject(subject);
        message.setContent(messageContent, "text/html");
        Transport.send((Message)message);
      } catch (Exception exception) {}
      }
    }}

}
