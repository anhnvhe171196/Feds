/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.dals;

import vn.fpt.edu.models.Bill1;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import java.util.List;
import vn.fpt.edu.models.Brand;
import vn.fpt.edu.models.Category;
import vn.fpt.edu.models.Price;
import vn.fpt.edu.models.Product;
import vn.fpt.edu.models.Product1;

/**
 *
 * @author Trong
 */
public class Data_MarketingDashboard_DAO extends DBContext {

    public List<Product> getSellingProduct(String startDate, String endDate, int numberOfTop) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP (?)\n"
                + "    p.Product_name,\n"
                + "    SUM(o.Order_quantity) AS Total_Products\n"
                + "FROM\n"
                + "    Product p\n"
                + "INNER JOIN\n"
                + "    [Order] o ON p.Product_id = o.Product_id\n"
                + "INNER JOIN\n"
                + "    Bill b ON o.Bill_id = b.Bill_Id\n"
                + "JOIN\n"
                + "    Brandd br ON p.Brand_id = br.Brand_Id\n"
                + "JOIN\n"
                + "    Product_Category pc ON br.Category_id = pc.Category_id\n"
                + "WHERE\n"
                + "    b.Date BETWEEN ? AND ?\n"
                + "    AND b.Status = 'Done'\n"
                + "GROUP BY\n"
                + "    pc.Category_name,\n"
                + "    p.Product_id,\n"
                + "    p.Product_name\n"
                + "ORDER BY\n"
                + "    Total_Products DESC;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setInt(1, numberOfTop);
            st.setString(2, startDate);
            st.setString(3, endDate);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Product product = new Product();
                product.setProduct_name(rs.getString(1).trim());
                product.setQuantity(rs.getInt(2));
                list.add(product);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product1> getAllProducts() {
        List<Product1> productList = new ArrayList<>();
        String sql = "SELECT p.Product_id, p.Product_name, p.Product_img, p.Quantity, pr.Price, pr.Date_start, pr.Date_end, pr.Sale \n"
                + "FROM Product p \n"
                + "LEFT JOIN Price pr ON p.Product_id = pr.Product_id \n";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    int productId = rs.getInt("Product_id");
                    String productName = rs.getString("Product_name");
                    String productImg = rs.getString("Product_img");
                    int quantity = rs.getInt("Quantity");
                    double price = rs.getDouble("Price");
                    Date dateStart = rs.getDate("Date_start");
                    Date dateEnd = rs.getDate("Date_end");
                    int sale = rs.getInt("Sale");

                    // Tạo instance Price
                    Price productPrice = new Price(price, dateStart, dateEnd, sale, null);

                    // Tạo instance Product1 và thiết lập các thuộc tính
                    Product1 product = new Product1(productId, quantity, productName, productImg, null, null);

                    // Thiết lập giá cho sản phẩm
                    product.setPrice(productPrice);

                    productList.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    public List<Product1> getAllProducts1(int index, String softBy) {
        List<Product1> productList = new ArrayList<>();

        String sql = "SELECT p.Product_id, p.Product_name, p.Product_img, p.Quantity, pr.Price, pr.Date_start, pr.Date_end, pr.Sale, br.Brand_Id AS brandId, br.Brand_Name AS brandName \n"
                + "FROM Product p \n"
                + "LEFT JOIN Price pr ON p.Product_id = pr.Product_id \n"
                + "LEFT JOIN [Brandd] br ON p.[Brand_id] = br.Brand_Id \n";

        if ("name".equals(softBy)) {
            sql += "ORDER BY p.Product_name ";
        } else if ("price".equals(softBy)) {
            sql += "ORDER BY pr.Price ";
        } else if ("quantity".equals(softBy)) {
            sql += "ORDER BY p.Quantity ";
        } else if ("datestart".equals(softBy)) {
            sql += "ORDER BY \n"
                    + "    CASE \n"
                    + "        WHEN pr.Date_start IS NULL THEN 1 \n"
                    + "        ELSE 0 \n"
                    + "    END, \n"
                    + "    pr.Date_start ";
        } else if ("dateend".equals(softBy)) {
            sql += "ORDER BY \n"
                    + "    CASE \n"
                    + "        WHEN pr.Date_end IS NULL THEN 1 \n"
                    + "        ELSE 0 \n"
                    + "    END, \n"
                    + "    pr.Date_start";
        } else {
            sql += "ORDER BY p.Product_id ";
        }

        sql += "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";

        try (PreparedStatement st = connection.prepareStatement(sql)) {

            st.setInt(1, (index - 1) * 10);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    int productId = rs.getInt("Product_id");
                    String productName = rs.getString("Product_name");
                    String productImg = rs.getString("Product_img");
                    int quantity = rs.getInt("Quantity");
                    double price = rs.getDouble("Price");
                    Date dateStart = rs.getDate("Date_start");
                    Date dateEnd = rs.getDate("Date_end");

                    int brandId = rs.getInt("brandId");
                    String brandName = rs.getString("brandName");

                    int sale = rs.getInt("Sale");

                    // Tạo instance Price
                    Price productPrice = new Price(price, dateStart, dateEnd, sale, null);

                    // Tạo instance Product1 và thiết lập các thuộc tính
                    Product1 product = new Product1(productId, quantity, productName, productImg, null, null);

                    // Thiết lập giá cho sản phẩm
                    product.setPrice(productPrice);
                    product.setBrand(new Brand(brandId, brandName, null));
//
                    productList.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    public static void main(String[] args) {
        Data_MarketingDashboard_DAO data = new Data_MarketingDashboard_DAO();
        List<Product1> products = data.getAllProducts1(2, "datestart");

        for (Product1 product : products) {
            System.out.println("Product ID: " + product.getProduct_id());
            System.out.println("Product Name: " + product.getProduct_name());
            System.out.println("Product Image: " + product.getProduct_img());
            System.out.println("Quantity: " + product.getQuantity());
            Brand brand = product.getBrand();
            if (brand != null) {
                System.out.println("brand: " + brand.getBrandName());
            }

            Price price = product.getPrice();
            if (price != null) {
                System.out.println("Price: " + price.getPrice());
                System.out.println("Price Start Date: " + price.getDateStart());
                System.out.println("Price End Date: " + price.getDateEnd());
            } else {
                System.out.println("Price: No price available");
            }

            System.out.println();
        }
    }

}
