/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import vn.fpt.edu.dals.Product_DAO;
import vn.fpt.edu.models.Cart;
import vn.fpt.edu.models.Item;
import vn.fpt.edu.models.Product;
import vn.fpt.edu.models.User;

/**
 *
 * @author admin
 */
public class ProcessCartController extends HttpServlet {

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
            out.println("<title>Servlet ProcessCartController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessCartController at " + request.getContextPath() + "</h1>");
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

        Cart cart = new Cart(txt, data.getAllProductinCart());
        List<Item> listItem;
            if (u != null) {
                listItem = cart.getCartbyUserId(u.getUser_Id());
                request.setAttribute("totalMoney", cart.getTotalMoney(u.getUser_Id()));
            } else {
                listItem = cart.getCartbyUserId(0);
                request.setAttribute("totalMoney", cart.getTotalMoney(0));
            }
        String num_raw = request.getParameter("num");
        String pid_raw = request.getParameter("pid");
        int pid, num = 0;
        try {
            pid = Integer.parseInt(pid_raw);
            Product p = data.getProductByIdinCart(pid);
            int numStore = p.getQuantity();
            num = Integer.parseInt(num_raw);
            if (num == -1 && (cart.getQuantityById(pid, userId) <= 1)) {
                cart.removeItem(userId, pid);
            } else {
                if (num == 1 && cart.getQuantityById(pid, userId) >= numStore) {
                    num = 0;
                }
                double price = p.getPrice();
                //user id phai doi thanh user id moi 
                Item t = new Item(userId, p, num, price);
                cart.addItem(t);
            }
        } catch (NumberFormatException e) {
        }
        List<Item> items = cart.getItems();
        txt = "";
        if (items.size() > 0) {
            txt = items.get(0).getUserID() + ":" + items.get(0).getProduct().getProduct_id() + ":" + items.get(0).getQuantity() + ":" + items.get(0).getPrice();
            for (int i = 1; i < items.size(); i++) {
                txt += "/" + items.get(i).getUserID() + ":" + items.get(i).getProduct().getProduct_id() + ":" + items.get(i).getQuantity() + ":" + items.get(i).getPrice();
            }
        }
        Cookie c = new Cookie("cart", txt);
        c.setMaxAge(24 * 60 * 60);
        response.addCookie(c);
        
        request.setAttribute("cart", cart);
        request.getRequestDispatcher("CartDetail.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");
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

        String pid = request.getParameter("pid");
        String[] ids = txt.split("/");
        String out = ""; // Tạo biến mới để lưu giữ giá trị mới
        int userId = 0;
        if(u != null) {
            userId = u.getUser_Id();
        } else {
            userId = 0;
        }
        for (int i = 0; i < ids.length; i++) {
            String[] s = ids[i].split(":");
            int userIdInCookie = Integer.parseInt(s[0]);
            if (userIdInCookie != userId || !s[1].equals(pid)) {
                if (out.isEmpty()) {
                    out = ids[i];
                } else {
                    out += "/" + ids[i];
                }
            }
        }

        if (!out.isEmpty()) {
            Cookie c = new Cookie("cart", out);
            c.setMaxAge(1 * 24 * 60 * 60);
            response.addCookie(c);
        }

        Cart cart = new Cart(out, data.getAllProductinCart());
        List<Item> listItem;
        if (u != null) {
            listItem = cart.getCartbyUserId(u.getUser_Id());
            request.setAttribute("totalMoney", cart.getTotalMoney(u.getUser_Id()));
        } else {
            listItem = cart.getCartbyUserId(0);
            request.setAttribute("totalMoney", cart.getTotalMoney(0));
        }
        request.setAttribute("cart", listItem);
        session.setAttribute("size", listItem.size());
        request.getRequestDispatcher("CartDetail.jsp").forward(request, response);
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
