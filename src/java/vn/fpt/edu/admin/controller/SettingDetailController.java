/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.admin.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import vn.fpt.edu.dals.Bill_DAO;
import vn.fpt.edu.dals.Category_DAO;
import vn.fpt.edu.dals.Feedback_DAO;
import vn.fpt.edu.dals.SettingDAO;
import vn.fpt.edu.dals.User_DAO;
import vn.fpt.edu.models.Setting;
import vn.fpt.edu.models.User;

/**
 *
 * @author admin
 */
public class SettingDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getSession().getAttribute("account") == null || ((User)request.getSession().getAttribute("account")).getRole().getId() != 1) {
            response.sendRedirect(request.getContextPath()+"/login");
            return;
        }
        request.getRequestDispatcher("detail.jsp").forward(request, response);
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
        if(request.getParameter("id") != null) {
            SettingDAO dao = new SettingDAO();
            if(request.getParameter("update") != null) {
                String jsonString = "{\"status\":\"";
                if(Integer.parseInt(request.getParameter("id")) == 1) {
                    jsonString += "You can't edit admin permission!";
                } else {
                    jsonString += dao.updateSettingById(Integer.parseInt(request.getParameter("id")), request.getParameter("view").equals("0") ? 1 : 0, request.getParameter("buy").equals("0") ? 1 : 0, request.getParameter("feedback").equals("0") ? 1 : 0, request.getParameter("sell").equals("0") ? 1 : 0, request.getParameter("edit").equals("0") ? 1 : 0, request.getParameter("delete").equals("0") ? 1 : 0, request.getParameter("create").equals("0") ? 1 : 0);
                }
                jsonString += "\"}";
                response.setContentType("application/json");
                PrintWriter out = response.getWriter();
                out.println(jsonString);
                return;
            }
            Setting s = dao.getSettingById(Integer.parseInt(request.getParameter("id")));
            String jsonString = "{";
            jsonString += "\"ID\":"+s.getRole().getId()+",\"Name\":\""+s.getRole().getRoleName()+"\",\"View\":"+s.isView()+",\"Buy\":"+s.isBuy()+",\"Feedback\":"+s.isFeedback()+",\"Sell\":"+s.isSell()+",\"Edit\":"+s.isEdit()+",\"Delete\":"+s.isDelete()+",\"Create\":"+s.isCreate();
            jsonString += "}";
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.println(jsonString);
        }
    }

}
