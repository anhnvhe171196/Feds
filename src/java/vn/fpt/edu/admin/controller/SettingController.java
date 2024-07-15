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
public class SettingController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getSession().getAttribute("account") == null || ((User)request.getSession().getAttribute("account")).getRole().getId() != 1) {
            response.sendRedirect(request.getContextPath()+"/login");
            return;
        }
        request.getRequestDispatcher("settings.jsp").forward(request, response);
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
        //GET
        if(request.getParameter("get") != null) {
            int page = request.getParameter("page") == null ? 0 : Integer.parseInt(request.getParameter("page"));
            SettingDAO dao = new SettingDAO();
            ArrayList<Setting> arr = dao.getAllSettings(page, 9);
            if(request.getParameter("sort") != null) {
                String sort = request.getParameter("sort");
                String type = request.getParameter("type");
                arr = dao.getAllSettingSort(page, 9, sort, type);
            }
            String jsonString = "{\"list\": [";
            for(int i = 0; i < arr.size(); i++) {
                Setting s = arr.get(i);
                if(i != 0) {
                    jsonString += ",";
                }
                jsonString += "{";
                jsonString += "\"ID\":"+s.getRole().getId()+",\"Name\":\""+s.getRole().getRoleName()+"\",\"View\":"+s.isView()+",\"Buy\":"+s.isBuy()+",\"Feedback\":"+s.isFeedback()+",\"Sell\":"+s.isSell()+",\"Edit\":"+s.isEdit()+",\"Delete\":"+s.isDelete()+",\"Create\":"+s.isCreate();
                jsonString += "}";
            }
            jsonString += "]}";
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.println(jsonString);
        }
        //TOTAL
        if(request.getParameter("AllCount") != null) {
            SettingDAO dao = new SettingDAO();
            int total = dao.allSettingsCount();
            String jsonString = "{\"Total\": "+total+"}";
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.println(jsonString);
        }
        //SEARCH
        if(request.getParameter("search") != null) {
            //SEARCH TOTAL
            if(request.getParameter("searchCount") != null) {
                SettingDAO dao = new SettingDAO();
                int total = dao.searchSettingsCount(request.getParameter("search"));
                String jsonString = "{\"Total\": "+total+"}";
                response.setContentType("application/json");
                PrintWriter out = response.getWriter();
                out.println(jsonString);
                return;
            }
            int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
            SettingDAO dao = new SettingDAO();
            ArrayList<Setting> arr = dao.getSearchSettings(page, 9, request.getParameter("search"));
            if(request.getParameter("sort") != null) {
                String sort = request.getParameter("sort");
                String type = request.getParameter("type");
                arr = dao.getSearchSettingSort(page, 9, request.getParameter("search"), sort, type);
            }
            String jsonString = "{\"list\": [";
            for(int i = 0; i < arr.size(); i++) {
                Setting s = arr.get(i);
                if(i != 0) {
                    jsonString += ",";
                }
                jsonString += "{";
                jsonString += "\"ID\":"+s.getRole().getId()+",\"Name\":\""+s.getRole().getRoleName()+"\",\"View\":"+s.isView()+",\"Buy\":"+s.isBuy()+",\"Feedback\":"+s.isFeedback()+",\"Sell\":"+s.isSell()+",\"Edit\":"+s.isEdit()+",\"Delete\":"+s.isDelete()+",\"Create\":"+s.isCreate();
                jsonString += "}";
            }
            jsonString += "]}";
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();
            out.println(jsonString);
        }
    }

}
