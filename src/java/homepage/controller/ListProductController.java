/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package homepage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.dals.Category_DAO;
import vn.fpt.edu.dals.Product_DAO;
import vn.fpt.edu.models.Category;
import vn.fpt.edu.models.Product1;

/**
 *
 * @author admin
 */
public class ListProductController extends HttpServlet {

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
            out.println("<title>Servlet ListCategoryController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListCategoryController at " + request.getContextPath() + "</h1>");
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
        List<Product1> listProduct = new ArrayList<>();
        Product_DAO d = new Product_DAO();
        int p = 1;
        if (request.getParameter("page") != null) {
            try {
                p = Integer.parseInt(request.getParameter("page"));
            } catch (Exception e) {
            }
        }
        request.setAttribute("p", p);
        int size = 0;
        int cateId = -1;
        try {
            if (request.getParameter("cateid") != null && request.getParameter("cateid") != "") {
                try {
                    cateId = Integer.parseInt(request.getParameter("cateid"));
                } catch (Exception e) {
                }
            }
        } catch (Exception e) {
        }
        if (request.getParameter("search") != null && request.getParameter("search") != "") {
            String strSearch = request.getParameter("search");
            listProduct = d.getProductByTittle(strSearch, cateId, p);
            size = d.getProductByTittleSize(strSearch, cateId);
        } else {
            listProduct = d.getAllProducts(cateId, p);
            size = d.getAllProductsSize(cateId);
        }
        int max = (size / 9) + ((size / 9) > (float)(size / 9.0) ? 0 : 1);
        request.setAttribute("max", max);
        Category_DAO categoryDAO = new Category_DAO();
        List<Category> cates = categoryDAO.getAllCate();
        session.setAttribute("cates", cates);
        request.setAttribute("List", listProduct);
        request.getRequestDispatcher("ProductList.jsp").forward(request, response);
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
