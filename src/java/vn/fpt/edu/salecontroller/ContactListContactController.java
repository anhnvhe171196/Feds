/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.salecontroller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import vn.fpt.edu.dals.Bill_DAO;
import vn.fpt.edu.dals.Contact_DAO;
import vn.fpt.edu.models.Bill1;
import vn.fpt.edu.models.Contact;

/**
 *
 * @author Trong
 */
public class ContactListContactController extends HttpServlet {

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
            out.println("<title>Servlet ContactListContactController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ContactListContactController at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        Contact_DAO cd = new Contact_DAO();

        if (action == null) {
            List<Contact> listContact = cd.getAllContact(1, 20);

            int totalPages = cd.getNumOfPageContactList(20);    
            int currentPage = 1;

            session.setAttribute("listContact", listContact);
            session.setAttribute("page", currentPage);
            session.setAttribute("totalPages", totalPages);
            out.print(listContact);
        } else if (action.equals("paging")) {
            int page = Integer.parseInt(request.getParameter("page"));
            List<Contact> listContact = cd.getAllContact(page, 20);
            session.setAttribute("listContact", listContact);

            session.setAttribute("page", page);
            int totalPages = cd.getNumOfPageContactList(20);
            session.setAttribute("totalPages", totalPages);
        } else if (action.equals("search")) {
            String value = request.getParameter("value");
            session.setAttribute("value", value);

            List<Contact> listContact = cd.searchContact(value);
            session.setAttribute("listContact", listContact);
        }else if (action.equals("showAll")) {
            List<Contact> listContact = cd.getContactAllWithUser();
            session.setAttribute("listContact", listContact);
        }

        request.getRequestDispatcher("ReplyContact.jsp").forward(request, response);
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
