/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import vn.fpt.edu.dals.Price_DAO;
import vn.fpt.edu.dals.Product_DAO;
import vn.fpt.edu.models.Cart;
import vn.fpt.edu.models.Item;
import vn.fpt.edu.models.Price;
import vn.fpt.edu.models.User;

/**
 *
 * @author admin
 */
@WebServlet(name = "AddCartByView", urlPatterns = {"/addCartByView"})
public class AddCartByView extends HttpServlet {

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
            out.println("<title>Servlet AddCartByView</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCartByView at " + request.getContextPath() + "</h1>");
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
        String pid = request.getParameter("pid");
        Product_DAO data = new Product_DAO();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }

        int num = 1;
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");
        int userId;
        if (u != null) {
            userId = u.getUser_Id();
        } else {
            userId = 0;
        }
        String id = request.getParameter("pid");
        Price_DAO pd = new Price_DAO();
        Price pd1 = pd.getPriceById(Integer.parseInt(id));
        boolean check = false;
        try {
            Date now = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String nowDateStr = sdf.format(now);
            if (pd1.getDateEnd() == null) {
                check = false;
            } else {
                String pdEndDateStr = sdf.format(pd1.getDateEnd());
                Date nowDate = sdf.parse(nowDateStr);
                Date pdEndDate = sdf.parse(pdEndDateStr);
                if (pdEndDate.after(nowDate)) {
                    check = true;
                } else {
                    check = false;
                }
            }
        } catch (ParseException ex) {
            Logger.getLogger(AddToCartController.class.getName()).log(Level.SEVERE, null, ex);
        }
        double price;
        if (check) {
            price = pd1.getPrice() - pd1.getPrice() * pd1.getSale() / 100;
        } else {
            price = pd1.getPrice();
        }
        System.out.println("txt");
        System.out.println(txt);
        if (txt.isEmpty()) {
            txt = userId + ":" + id + ":" + num + ":" + price;
        } else {
            txt = txt + "/" + userId + ":" + id + ":" + num + ":" + price;
        }
        Cart cart = new Cart(txt, data.getAllProductinCart());
        List<Item> listItem;
        if (u != null) {
            listItem = cart.getCartbyUserId(u.getUser_Id());
            request.setAttribute("totalMoney", cart.getTotalMoney(u.getUser_Id()));
        } else {
            listItem = cart.getCartbyUserId(0);
            request.setAttribute("totalMoney", cart.getTotalMoney(0));
        }
        session.setAttribute("size", listItem.size());
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(1 * 24 * 60 * 60);
        response.addCookie(c);
        response.sendRedirect("product?pid=" + pid);
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
        String pid = request.getParameter("pid");
        int num = Integer.parseInt(request.getParameter("number"));
        Product_DAO data = new Product_DAO();
        Cookie[] arr = request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                    o.setMaxAge(0);
                    response.addCookie(o);
                }
            }
        }

        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");
        int userId;
        if (u != null) {
            userId = u.getUser_Id();
        } else {
            userId = 0;
        }
        String id = request.getParameter("pid");
        Price_DAO pd = new Price_DAO();
        Price pd1 = pd.getPriceById(Integer.parseInt(id));

        boolean check = false;
        try {
            Date now = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String nowDateStr = sdf.format(now);
            if (pd1.getDateEnd() == null) {
                check = false;
            } else {
                String pdEndDateStr = sdf.format(pd1.getDateEnd());
                Date nowDate = sdf.parse(nowDateStr);
                Date pdEndDate = sdf.parse(pdEndDateStr);
                if (pdEndDate.before(nowDate)) {
                    check = false;
                } else {
                    check = true;
                }
            }

        } catch (ParseException ex) {
            Logger.getLogger(AddToCartController.class.getName()).log(Level.SEVERE, null, ex);
        }
        double price;
        if (check) {
            price = pd1.getPrice() - pd1.getPrice() * pd1.getSale() / 100;
        } else {
            price = pd1.getPrice();
        }
        if (txt.isEmpty()) {
            txt = userId + ":" + id + ":" + num + ":" + price;
        } else {
            txt = txt + "/" + userId + ":" + id + ":" + num + ":" + price;
        }

        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(1 * 24 * 60 * 60);
        response.addCookie(c);
        Cart cart = new Cart(txt, data.getAllProductinCart());
        List<Item> listItem;
        if (u != null) {
            listItem = cart.getCartbyUserId(u.getUser_Id());
            request.setAttribute("totalMoney", cart.getTotalMoney(u.getUser_Id()));
        } else {
            listItem = cart.getCartbyUserId(0);
            request.setAttribute("totalMoney", cart.getTotalMoney(0));
        }
        session.setAttribute("size", listItem.size());
        response.sendRedirect("product?pid=" + pid);
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
