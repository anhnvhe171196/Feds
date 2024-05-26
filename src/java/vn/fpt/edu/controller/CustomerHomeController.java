/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.dals.Category_DAO;
import vn.fpt.edu.dals.Product_DAO;
import vn.fpt.edu.models.Product;

/**
 *
 * @author admin
 */
public class CustomerHomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Category_DAO d = new Category_DAO();
        Product_DAO data = new Product_DAO();
//        List<Product> listSellingProduct = data.getSellingProduct();
//        List<Product> list = new ArrayList<>();
//        for (Product product : listSellingProduct) {
//            list.add(product);
//        }
        session.setAttribute("cates", d.getAllCate());
        session.setAttribute("list", data.getSellingProduct());
        session.setAttribute("phone", data.getProductByPrice());
        session.setAttribute("tivi", data.getTiviByPrice());
        request.getRequestDispatcher("UserHome.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}
