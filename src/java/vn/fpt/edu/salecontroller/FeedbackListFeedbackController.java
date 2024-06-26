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
import vn.fpt.edu.dals.Feedback_DAO;
import vn.fpt.edu.models.Feedback1;

/**
 *
 * @author Trong
 */
public class FeedbackListFeedbackController extends HttpServlet {

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
            out.println("<title>Servlet FeedbackListFeedbackController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FeedbackListFeedbackController at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("action");
        Feedback_DAO fbd = new Feedback_DAO();
        PrintWriter out = response.getWriter();
        if(action == null){ 
            
            List<Feedback1> feedbackList = fbd.getAllFeedbackPagingSQL(1, 10);
            int totalPages = fbd.getNumOfPageFeedbackLists(10);
            int currentPage = 1;
            
            session.setAttribute("totalPages", totalPages);
            session.setAttribute("page", currentPage);
            session.setAttribute("feedbackList", feedbackList);
            request.getRequestDispatcher("FeedbackList.jsp").forward(request, response);
        
        }
        else if (action.equals("showAll")) {
            List<Feedback1> feedbackList = fbd.getFeedbackAllWithUser1();
            session.setAttribute("feedbackList", feedbackList);
            request.getRequestDispatcher("FeedbackList.jsp").forward(request, response);
        } 
        else if (action.equals("sortByDateAsc")) {
            List<Feedback1> feedbackList = fbd.getFeedbackAllWithUserSortByDate("Asc");
            session.setAttribute("feedbackList", feedbackList);
            request.getRequestDispatcher("FeedbackList.jsp").forward(request, response);
        } 
        else if (action.equals("sortByDateDesc")) {
            List<Feedback1> feedbackList = fbd.getFeedbackAllWithUserSortByDate("Desc");
            session.setAttribute("feedbackList", feedbackList);
            request.getRequestDispatcher("FeedbackList.jsp").forward(request, response);
        }
        else if (action.equals("sortByRatingAsc")) {
            List<Feedback1> feedbackList = fbd.getFeedbackAllWithUserSortByRating("Asc");
            session.setAttribute("feedbackList", feedbackList);
            request.getRequestDispatcher("FeedbackList.jsp").forward(request, response);
        } 
        else if (action.equals("sortByRatingDesc")) {
            List<Feedback1> feedbackList = fbd.getFeedbackAllWithUserSortByRating("Desc");
            session.setAttribute("feedbackList", feedbackList);
            request.getRequestDispatcher("FeedbackList.jsp").forward(request, response);
        } 
        else if (action.equals("sortByNumOfFeedbackAsc")) {
            List<Feedback1> feedbackList = fbd.getFeedbackAllWithUserSortByFeedbackID("Asc");
            session.setAttribute("feedbackList", feedbackList);
            request.getRequestDispatcher("FeedbackList.jsp").forward(request, response);
        } 
        else if (action.equals("sortByNumOfFeedbackDesc")) {
            List<Feedback1> feedbackList = fbd.getFeedbackAllWithUserSortByFeedbackID("Desc");
            session.setAttribute("feedbackList", feedbackList);
            request.getRequestDispatcher("FeedbackList.jsp").forward(request, response);
        } 
        
        else if (action.equals("search")) {
            String value = request.getParameter("value");
            request.setAttribute("value", value);
            List<Feedback1> feedbackList = fbd.searchFeedback(value);
            session.setAttribute("feedbackList", feedbackList);
            request.getRequestDispatcher("FeedbackList.jsp").forward(request, response);
        }
        else if(action.equals("paging")){ 
            int page = Integer.parseInt(request.getParameter("page"));
            List<Feedback1> feedbackList = fbd.getAllFeedbackPagingSQL(page, 10);
            session.setAttribute("feedbackList", feedbackList);
            
            session.setAttribute("page", page);
            int totalPages = fbd.getNumOfPageFeedbackLists(10);
            session.setAttribute("totalPages", totalPages);
            request.getRequestDispatcher("FeedbackList.jsp").forward(request, response);
        }
            
        
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
