/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.dals.Bill_DAO;
import vn.fpt.edu.dals.Data_MarketingDashboard_DAO;
import vn.fpt.edu.dals.Feedback_DAO;
import vn.fpt.edu.dals.Feedback_DAO;
import vn.fpt.edu.dals.Order_DAO;
import vn.fpt.edu.dals.Product_DAO;
import vn.fpt.edu.dals.User_DAO;
import vn.fpt.edu.models.Category;
import vn.fpt.edu.models.Feedback1;
import vn.fpt.edu.models.Product;
import vn.fpt.edu.models.User;

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
        Data_MarketingDashboard_DAO data = new Data_MarketingDashboard_DAO();

        Feedback_DAO fd = new Feedback_DAO();
        User_DAO u = new User_DAO();
        Bill_DAO bd = new Bill_DAO();
        Product_DAO pb = new Product_DAO();
        Order_DAO od = new Order_DAO();
        HttpSession session = request.getSession();

        int numOfFeedbacks = fd.getNumOfFeedbackCurrentDate();
        int sumOfFeedbacks = fd.getTotalNumberOfFeedbacks();
        int numOfUser = u.getTotalNumberOfUsers();
        int numOfBills = bd.getNumOfBillCurrentDate();
        int sumOfDoneBills = bd.getSumOfDoneBill();
        int numOfProducts = pb.getTotalNumberOfProducts();
        int NumOfProductsSold = od.getNumOfProductsSold();

        //chart 1
        int quantity = 10;
        String startdate = "2024-07-01";
        String enddate = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        List<Product> productSellingList = data.getSellingProduct(startdate, enddate, quantity);
        List<String> productNames = new ArrayList<>();
        List<Integer> quantities = new ArrayList<>();
        for (Product product : productSellingList) {
            productNames.add(product.getProduct_name());
            quantities.add(product.getQuantity());
        }

        session.setAttribute("quantity", quantity);
        session.setAttribute("startdate", startdate);
        session.setAttribute("enddate", enddate);

        session.setAttribute("ProductName", productNames);
        session.setAttribute("ProductQuan", quantities);

        //chart 2
        int Uquantity = 10;

        List<User> UserPaymentList = data.getMostPaymentUser(Uquantity);

        List<String> username = new ArrayList<>();
        List<Integer> userPayment = new ArrayList<>();
        List<String> userEmail = new ArrayList<>();

        for (User user : UserPaymentList) {
            username.add(user.getUser_name());
            userPayment.add(user.getPayment());
            userEmail.add(user.getEmail());
        }

        session.setAttribute("Uquantity", Uquantity);
        session.setAttribute("username", username);
        session.setAttribute("userEmail", userEmail);
        session.setAttribute("userPayment", userPayment);

        //chart 3
        List<Category> category = data.getTotalProductsByCategory();
        List<String> CName = new ArrayList<>();
        List<Integer> ProductCount = new ArrayList<>();
        for (Category c : category) {
            CName.add(c.getCategory_name());
            ProductCount.add(c.getProductcount());
        }
        session.setAttribute("CName", CName);
        session.setAttribute("ProductCount", ProductCount);

        session.setAttribute("numOfBills", numOfBills);
        session.setAttribute("sumOfDoneBills", sumOfDoneBills);
        session.setAttribute("numOfFeedbacks", numOfFeedbacks);
        session.setAttribute("sumOfFeedbacks", sumOfFeedbacks);
        session.setAttribute("numOfUser", numOfUser);
        session.setAttribute("numOfProducts", numOfProducts);
        session.setAttribute("NumOfProductsSold", NumOfProductsSold);

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

        String Action = request.getParameter("Action");
        Data_MarketingDashboard_DAO data = new Data_MarketingDashboard_DAO();

        Feedback_DAO fd = new Feedback_DAO();
        User_DAO u = new User_DAO();
        Bill_DAO bd = new Bill_DAO();
        Product_DAO pb = new Product_DAO();
        Order_DAO od = new Order_DAO();
        HttpSession session = request.getSession();

        if ("product".equals(Action)) {
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String startdate = request.getParameter("startdate");
            String enddate = request.getParameter("enddate");
            List<Product> productSellingList = data.getSellingProduct(startdate, enddate, quantity);
            List<String> productNames = new ArrayList<>();
            List<Integer> quantities = new ArrayList<>();
            for (Product product : productSellingList) {
                productNames.add(product.getProduct_name());
                quantities.add(product.getQuantity());
            }
            session.setAttribute("quantity", quantity);
            session.setAttribute("startdate", startdate);
            session.setAttribute("enddate", enddate);

            session.setAttribute("ProductName", productNames);
            session.setAttribute("ProductQuan", quantities);
            request.getRequestDispatcher("OrderProcessor.jsp").forward(request, response);

        } else if ("user".equals(Action)) {
            int Uquantity = Integer.parseInt(request.getParameter("Uquantity"));

            List<User> UserPaymentList = data.getMostPaymentUser(Uquantity);

            List<String> username = new ArrayList<>();
            List<Integer> userPayment = new ArrayList<>();

            for (User user : UserPaymentList) {
                username.add(user.getUser_name());
                userPayment.add(user.getPayment());
            }

            session.setAttribute("Uquantity", Uquantity);
            session.setAttribute("username", username);
            session.setAttribute("userPayment", userPayment);

            request.getRequestDispatcher("OrderProcessor.jsp").forward(request, response);

        } else if ("category".equals(Action)) {

            List<Category> category = data.getTotalProductsByCategory();
            List<String> CName = new ArrayList<>();
            List<Integer> ProductCount = new ArrayList<>();
            for (Category c : category) {
                CName.add(c.getCategory_name());
                ProductCount.add(c.getProductcount());
            }
            session.setAttribute("CName", CName);
            session.setAttribute("ProductCount", ProductCount);

            request.getRequestDispatcher("OrderProcessor.jsp").forward(request, response);
//
        } else if (Action == null) {

        }
    }
}
