/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import vn.fpt.edu.dals.Bill_DAO;
import vn.fpt.edu.dals.Product_DAO;
import vn.fpt.edu.models.Cart;
import vn.fpt.edu.models.Config;
import vn.fpt.edu.models.User;


/**
 *
 * @author admin
 */
public class AddBillController extends HttpServlet {

    /**
     * Processes Requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param Request servlet Request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param Request servlet Request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest Request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = Request.getSession();
        User u = (User) session.getAttribute("account");
        Bill_DAO d = new Bill_DAO();
        Product_DAO data = new Product_DAO();
        Cookie[] arr = Request.getCookies();
        String txt = "";
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("cart")) {
                    txt += o.getValue();
                }
            }
        }
        
        String tinh = Request.getParameter("tinh");
        String quan = Request.getParameter("quan");
        String phuong = Request.getParameter("phuong");
        String address = Request.getParameter("address");
        String paymentOption = Request.getParameter("paymentOptions");
        String status = "Chờ xử lý";
        
//        PrintWriter out = response.getWriter();
//        out.println("<html><head><title>Parameter Values</title></head><body>");
//        out.println("<h1>Parameter Values</h1>");
//        out.println("<p>Tinh: " + tinh + "</p>");
//        out.println("<p>Quan: " + quan + "</p>");
//        out.println("<p>Phuong: " + phuong + "</p>");
//        out.println("<p>Address: " + address + "</p>");
//        out.println("<p>Payment Option: " + paymentOption + "</p>");

        Cart cart = new Cart(txt, data.getAllProductinCart());
        
         if("tienmat".equals(paymentOption)) {
             d.addtoBill(u, cart, address, status, tinh, quan, phuong, paymentOption);
             Cookie c = new Cookie("cart", "");
             c.setMaxAge(0);
             response.addCookie(c);
//             response.sendRedirect("CompleteCart.jsp");
             response.sendRedirect("complete");
 
         } else if("VNPay".equals(paymentOption)){
             d.addtoBill(u, cart, address, status, tinh, quan, phuong, paymentOption);
             Cookie c = new Cookie("cart", "");
             c.setMaxAge(0);
             response.addCookie(c);
             response.sendRedirect("QR.jsp");
         } else {
             //
         }
         
//        String vnp_Version = "2.1.0";
//        String vnp_Command = "pay";
//        String orderType = "billpayment";
//        long amount = (int) (Double.parseDouble(Request.getParameter("amount")) * 100);
//        String bankCode = Request.getParameter("bankCode");
//
//        String vnp_TxnRef = Config.getRandomNumber(8);
//        String vnp_IpAddr = Config.getIpAddress(Request);
//        String vnp_TmnCode = Config.vnp_TmnCode;
//
//        Map<String, String> vnp_Params = new HashMap<>();
//        vnp_Params.put("vnp_Version", vnp_Version);
//        vnp_Params.put("vnp_Command", vnp_Command);
//        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
//        vnp_Params.put("vnp_Amount", String.valueOf(amount));
//        vnp_Params.put("vnp_CurrCode", "VND");
//
//        if (bankCode != null && !bankCode.isEmpty()) {
//            vnp_Params.put("vnp_BankCode", bankCode);
//        }
//        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
//        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
//        vnp_Params.put("vnp_OrderType", orderType);
//
//        String locate = Request.getParameter("language");
//        if (locate != null && !locate.isEmpty()) {
//            vnp_Params.put("vnp_Locale", locate);
//        } else {
//            vnp_Params.put("vnp_Locale", "vn");
//        }
//        vnp_Params.put("vnp_ReturnUrl", Config.vnp_Returnurl);
//        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);
//
//        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
//        String vnp_CreateDate = formatter.format(cld.getTime());
//        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
//
//        cld.add(Calendar.MINUTE, 15);
//        String vnp_ExpireDate = formatter.format(cld.getTime());
//        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);
//
//        List fieldNames = new ArrayList(vnp_Params.keySet());
//        Collections.sort(fieldNames);
//        StringBuilder hashData = new StringBuilder();
//        StringBuilder query = new StringBuilder();
//        Iterator itr = fieldNames.iterator();
//        while (itr.hasNext()) {
//            String fieldName = (String) itr.next();
//            String fieldValue = (String) vnp_Params.get(fieldName);
//            if ((fieldValue != null) && (fieldValue.length() > 0)) {
//                //Build hash data
//                hashData.append(fieldName);
//                hashData.append('=');
//                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
//                //Build query
//                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
//                query.append('=');
//                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
//                if (itr.hasNext()) {
//                    query.append('&');
//                    hashData.append('&');
//                }
//            }
//        }
//        String queryUrl = query.toString();
//        String vnp_SecureHash = Config.hmacSHA512(Config.vnp_HashSecret, hashData.toString());
//        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
//        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
//        com.google.gson.JsonObject job = new JsonObject();
//        job.addProperty("code", "00");
//        job.addProperty("message", "success");
//        if (Request.getParameter("paymentOptions").equals("tienmat")) {
//            job.addProperty("data", "http://localhost:9999/Feds/complete");
//        } else if (Request.getParameter("paymentOptions").equals("VNPay")) {
//            job.addProperty("data", paymentUrl);
//        }
//        Gson gson = new Gson();
//        response.getWriter().write(gson.toJson(job));
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param Request servlet Request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

 

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */


}
