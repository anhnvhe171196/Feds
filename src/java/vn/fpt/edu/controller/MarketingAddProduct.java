/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

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
import java.util.Date;
import java.util.List;
import vn.fpt.edu.dals.Data_MarketingDashboard_DAO;
import vn.fpt.edu.dals.User_DAO;
import vn.fpt.edu.models.Brand;
import vn.fpt.edu.models.Category;
import vn.fpt.edu.models.Price;
import vn.fpt.edu.models.Product1;
import vn.fpt.edu.models.ProductDetail;
import vn.fpt.edu.models.User;

/**
 *
 * @author rimok
 */
@WebServlet(name = "MarketingAddProduct", urlPatterns = {"/marketingAddProduct"})
@MultipartConfig
public class MarketingAddProduct extends HttpServlet {

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
            out.println("<title>Servlet MarketingAddProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MarketingAddProduct at " + request.getContextPath() + "</h1>");
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
        // Lấy danh sách danh mục
        Data_MarketingDashboard_DAO dt = new Data_MarketingDashboard_DAO();
        List<Category> categories = dt.getAllCategories();
        List<Brand> brands = dt.getAllBrand();
        request.setAttribute("categories", categories);
        request.setAttribute("brands", brands);

        // Chuyển hướng đến trang add_product.jsp
        request.getRequestDispatcher("MarketingProductAdd.jsp").forward(request, response);
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

        Data_MarketingDashboard_DAO dt = new Data_MarketingDashboard_DAO();

        User_DAO ud = new User_DAO();
        try {
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
            String img = filename;
            String UserId = request.getParameter("userId");
            if (UserId == null || UserId.isEmpty()) {
                request.setAttribute("error", "Vui lòng đăng nhập!");
                request.getRequestDispatcher("Page404.jsp").forward(request, response);
                return;
            }
            int userId = Integer.parseInt(UserId);
            int categoryId = Integer.parseInt(request.getParameter("category_id"));
            int brandId = Integer.parseInt(request.getParameter("brandId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String productName = request.getParameter("product_name");
            String Pstatus = request.getParameter("Pstatus");
            if (Pstatus == null ) {
            Pstatus = "active"; // Thay đổi trạng thái thành Deleted
            }
            String ram = request.getParameter("ram");
            String rom = request.getParameter("rom");
            String size = request.getParameter("size");
            String battery = request.getParameter("battery");
            String weight = request.getParameter("weight");
            String color = request.getParameter("color");
            String decription = request.getParameter("decription");
            String cpu = request.getParameter("cpu");
            String wattage = request.getParameter("wattage");
            String status = request.getParameter("status");
            String priceString = request.getParameter("price");
            priceString = priceString.replace(" VND", ""); // Loại bỏ " VND"
            double price = Double.parseDouble(priceString.replace(",", ""));
            String dateStartString = request.getParameter("dateStart");
            String dateEndString = request.getParameter("dateEnd");

            Date dateStart = null;
            Date dateEnd = null;

            if (dateStartString != null && !dateStartString.isEmpty()) {
                dateStart = java.sql.Date.valueOf(dateStartString);
            } else {
                request.setAttribute("error", "Vui lòng Nhập ngày bắt đầu");
                request.getRequestDispatcher("Page404.jsp").forward(request, response);
                return;
            }

            if (dateEndString != null && !dateEndString.isEmpty()) {
                dateEnd = java.sql.Date.valueOf(dateEndString);
            } else {
                request.setAttribute("error", "Vui lòng nhập ngày kết thúc");
                request.getRequestDispatcher("Page404.jsp").forward(request, response);
                return;
            }
            String Sale = request.getParameter("sale");
            if (Sale == null || Sale.isBlank()) {
                Sale = "0";
            }
            int sale = Integer.parseInt(Sale);

            if (productName == null || productName.isEmpty()) {
                // Hiển thị thông báo lỗi
                request.setAttribute("error", "Vui lòng điền đầy đủ thông tin sản phẩm.");
                request.getRequestDispatcher("Page404.jsp").forward(request, response);
                return;
            }
            if (price <= 0) {
                // Hiển thị thông báo lỗi
                request.setAttribute("error", "Vui lòng nhập Giá > 0");
                request.getRequestDispatcher("Page404.jsp").forward(request, response);
                return;
            }
            if (quantity <= 0) {
                // Hiển thị thông báo lỗi
                request.setAttribute("error", "Vui lòng nhập Số lượng > 0");
                request.getRequestDispatcher("Page404.jsp").forward(request, response);
                return;
            }

            Category category = new Category(categoryId, null);
            User user = ud.getCustomerByID(userId);
            Brand brand = new Brand(brandId, null, category);
            Product1 product = new Product1(0, quantity, productName, img, user, brand,Pstatus);
            ProductDetail detail = new ProductDetail(ram, rom, size, battery, weight, color, decription, cpu, wattage, status, product);
            Price priceObj = new Price(price, dateStart, dateEnd, sale, product);

            boolean success = dt.AddProduct(product, user);
            if (success) {
                // Lấy Product_id vừa được tạo
                product.setProduct_id(dt.getLastInsertedProductId()); // Giả sử bạn có hàm getLastInsertedProductId() trong DAO
                success &= dt.AddProductDetail(detail);
                success &= dt.AddPrice(priceObj);
                request.setAttribute("product", product);
                String redirectURL = "marketingProductDetails?id=" + product.getProduct_id();
                response.sendRedirect(redirectURL);
                // ... (Kiểm tra kết quả thêm sản phẩm và chuyển hướng)
            } else {
                response.sendRedirect("error404.html");

            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Số lượng phải là một số nguyên.");
            request.getRequestDispatcher("Page404.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Đã sảy ra lỗi! Vui lòng thử lại");
            request.getRequestDispatcher("Page404.jsp").forward(request, response);
        }
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
