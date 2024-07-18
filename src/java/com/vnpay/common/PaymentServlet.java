package com.vnpay.common;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import vn.fpt.edu.dals.Bill_DAO;
import vn.fpt.edu.dals.Product_DAO;
import vn.fpt.edu.models.Cart;
import vn.fpt.edu.models.Item;
import vn.fpt.edu.models.User;

@WebServlet(name = "PaymentServlet", urlPatterns = {"/PaymentServlet"})
public class PaymentServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("account");
        Cookie[] arr = request.getCookies();
        Product_DAO data = new Product_DAO();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        Cart cart = new Cart(txt, data.getAllProductinCart());
        Set<String> processedTransactions = (Set<String>) session.getAttribute("processedTransactions");
        if (processedTransactions == null) {
            processedTransactions = new HashSet<>();
            session.setAttribute("processedTransactions", processedTransactions);
        }

        Map<String, String> fields = new HashMap<>();
        for (Enumeration<String> params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = params.nextElement();
            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }

        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        fields.remove("vnp_SecureHashType");
        fields.remove("vnp_SecureHash");
        String signValue = Config.hashAllFields(fields);

        if (signValue.equals(vnp_SecureHash)) {
            if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                String transactionId = request.getParameter("vnp_TxnRef");

                if (!processedTransactions.contains(transactionId)) {

                    processedTransactions.add(transactionId);
                    String address = (String) session.getAttribute("address");
                    String status = (String) session.getAttribute("status");
                    String tinh = (String) session.getAttribute("tinh");
                    String quan = (String) session.getAttribute("quan");
                    String phuong = (String) session.getAttribute("phuong");
                    String paymentOption = (String) session.getAttribute("paymentOption");
                    Bill_DAO d = new Bill_DAO();
                    d.addtoBill(u, cart.getCartbyUserId1(u.getUser_Id()), address, status, tinh, quan, phuong, paymentOption);
                    String newTxt = "";
                    for (Item item : cart.getItems()) {
                        if (item.getUserID() != u.getUser_Id()) {
                            newTxt += item.getUserID() + ":" + item.getProduct().getProduct_id() + ":" + item.getQuantity() + ":" + item.getPrice() + "/";
                        }
                    }
                    if (!newTxt.isEmpty()) {
                        newTxt = newTxt.substring(0, newTxt.length() - 1);
                    }
                    Cookie c = new Cookie("cart", newTxt);
                    c.setMaxAge(24 * 60 * 60);
                    response.addCookie(c);
                    session.removeAttribute("size");
                    session.setAttribute("size", 0);
                    response.sendRedirect("complete");

                } else {
                    response.getWriter().print("invalid signature");
                }
            }
        }
    }
}
