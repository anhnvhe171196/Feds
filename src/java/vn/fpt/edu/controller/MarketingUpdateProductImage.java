/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Path;
import vn.fpt.edu.dals.Data_MarketingDashboard_DAO;
import vn.fpt.edu.models.Product1;

/**
 *
 * @author rimok
 */
@WebServlet(name = "MarketingUpdateProductImage", urlPatterns = {"/marketingUpdateProductImage"})
@MultipartConfig
public class MarketingUpdateProductImage extends HttpServlet {

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
            out.println("<title>Servlet MarketingUpdateProductImage</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MarketingUpdateProductImage at " + request.getContextPath() + "</h1>");
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

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        int productId = Integer.parseInt(request.getParameter("product_id"));

        Part part = request.getPart("image");

        // Lưu ảnh vào thư mục images
        String readpath = getServletContext().getRealPath("/images");
        String filename = Path.of(part.getSubmittedFileName()).getFileName().toString();

        // Thêm timestamp vào tên file để tránh trùng lặp
        filename = filename.substring(0, filename.lastIndexOf(".")) + "_" + System.currentTimeMillis() + filename.substring(filename.lastIndexOf("."));

        // Kiểm tra thư mục images
        if (!Files.exists(Path.of(readpath))) {
            Files.createDirectories(Path.of(readpath));
        }
        part.write(readpath + "/" + filename);

        // Cập nhật đường dẫn ảnh trong database
        String img = filename; // Đường dẫn tương đối
        Data_MarketingDashboard_DAO md = new Data_MarketingDashboard_DAO();
        md.UpdateImg(productId, img);

        // Lấy thông tin sản phẩm sau khi cập nhật
        Product1 product = md.getProductById(productId);

        // Chuyển hướng về trang marketingProductList
        String redirectURL = "marketingProductUpdate?id=" + productId;
        response.sendRedirect(redirectURL);
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
