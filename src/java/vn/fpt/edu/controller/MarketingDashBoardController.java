/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import vn.fpt.edu.dals.Bill_DAO;
import vn.fpt.edu.dals.Feedback_DAO;
import vn.fpt.edu.dals.Feedback_DAO;
import vn.fpt.edu.dals.Order_DAO;
import vn.fpt.edu.dals.Product_DAO;
import vn.fpt.edu.dals.User_DAO;
import vn.fpt.edu.models.Feedback1;

/**
 *
 * @author admin
 */
public class MarketingDashBoardController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession(true);
        String action = request.getParameter("action");
        PrintWriter out = response.getWriter();
        Feedback_DAO fd = new Feedback_DAO();
        User_DAO u = new User_DAO();
        Bill_DAO bd = new Bill_DAO();
        Product_DAO pb = new Product_DAO();
        Order_DAO od = new Order_DAO();

        int numOfFeedbacks = fd.getNumOfFeedbackCurrentDate();
        int sumOfFeedbacks = fd.getTotalNumberOfFeedbacks();
        int numOfUser = u.getTotalNumberOfUsers();
        int numOfBills = bd.getNumOfBillCurrentDate();
        int sumOfDoneBills = bd.getSumOfDoneBill();
        int numOfProducts = pb.getTotalNumberOfProducts();
        int NumOfProductsSold = od.getNumOfProductsSold();

        session.setAttribute("numOfBills", numOfBills);
        session.setAttribute("sumOfDoneBills", sumOfDoneBills);
        session.setAttribute("numOfFeedbacks", numOfFeedbacks);
        session.setAttribute("sumOfFeedbacks", sumOfFeedbacks);
        session.setAttribute("numOfUser", numOfUser);
        session.setAttribute("numOfProducts", numOfProducts);
        session.setAttribute("NumOfProductsSold", NumOfProductsSold);

        List<Feedback1> FeedbackList = fd.getFeedbackAllWithUser();
        session.setAttribute("FeedbackList", FeedbackList);
        request.getRequestDispatcher("OrderProcessor.jsp").forward(request, response);

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
    }
}
