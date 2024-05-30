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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import vn.fpt.edu.dals.Feedback_DAO;
import vn.fpt.edu.dals.Price_DAO;
import vn.fpt.edu.dals.ProductDetail_DAO;
import vn.fpt.edu.dals.Product_DAO;
import vn.fpt.edu.models.FeedBack;
import vn.fpt.edu.models.Price;
import vn.fpt.edu.models.Product1;
import vn.fpt.edu.models.ProductDetail;
import vn.fpt.edu.models.RelatedProducts;

/**
 *
 * @author admin
 */
public class ViewProductDetailController extends HttpServlet {

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
            out.println("<title>Servlet ViewProductDetail</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewProductDetail at " + request.getContextPath() + "</h1>");
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
        String productId = request.getParameter("pid");
        try {
            int productID = Integer.parseInt(productId);
            ProductDetail_DAO pdao = new ProductDetail_DAO();
            ProductDetail pd = pdao.getProductDetailById(productID);
            request.setAttribute("product", pd);
            Price_DAO pds = new Price_DAO();
            Price p = pds.getPriceById(productID);
            request.setAttribute("price", p);
            Feedback_DAO fd = new Feedback_DAO();
            double f = fd.avgRatingOfProduct(productID);
            request.setAttribute("rating", f);
            int f1 = fd.totalFeedBackOfProductById(productID);
            request.setAttribute("totalFeedback", f1);
            Date now = new Date();
            Price_DAO pdao1 = new Price_DAO();
            Price pd1 = pdao1.getPriceById(2);

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String nowDateStr = sdf.format(now);
            String pdEndDateStr = sdf.format(pd1.getDateEnd());

            Date nowDate = sdf.parse(nowDateStr);
            Date pdEndDate = sdf.parse(pdEndDateStr);
            System.out.println(nowDate + "     " + pdEndDate);
            System.out.println(pd1.getDateEnd());
            if (pdEndDate.before(nowDate)) {
                request.setAttribute("check", 1);
            } else {
                request.setAttribute("check", 2);
            }
            request.setAttribute("dateNow", nowDate);
            List<RelatedProducts> temp = pdao1.getListPriceByBrandId(pd.getProduct().getBrand().getBrandId());
            List<RelatedProducts> list = pdao1.getRandomPrice(temp, productID);
            request.setAttribute("list", list);
            request.getRequestDispatcher("ViewProductDetail.jsp").forward(request, response);
        } catch (Exception e) {
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
