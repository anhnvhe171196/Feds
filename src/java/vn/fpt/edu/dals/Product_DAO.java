/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.dals;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.models.Brand;
import vn.fpt.edu.models.Product1;
import vn.fpt.edu.models.Product;
import vn.fpt.edu.models.ProductDetail;
import vn.fpt.edu.models.User;

/**
 *
 * @author admin
 */
public class Product_DAO extends DBContext {

    public int getAllProductsSize() {
        String sql = "SELECT Count(Product.Product_id) as Total FROM Product join Brandd on Brandd.Brand_id = Product.Brand_id join Product_Category on Product_Category.Category_id = Brandd.Category_id join Price On Price.Product_id = Product.Product_id WHERE Product.Status != 'deleted'";
        System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getAllProductsWithParameterSize(String[] cateId, String[] brandId, String min, String max) {
        String sql = "SELECT Count(Product.Product_id) as Total FROM Product join Brandd on Brandd.Brand_id = Product.Brand_id join Product_Category on Product_Category.Category_id = Brandd.Category_id join Price On Price.Product_id = Product.Product_id";
        boolean where = false;
        if (cateId.length > 0) {
            where = true;
            sql += " WHERE ([Product_Category].[Category_id] = " + cateId[0];
            for (int i = 1; i < cateId.length; i++) {
                sql += " OR [Product_Category].[Category_id] = " + cateId[i];
            }
            sql += ")";
        }
        if (brandId.length > 0) {
            if (where) {
                sql += " AND [Product].[Brand_id] in (SELECT Brand_Id FROM Brandd WHERE Brand_Name like '%" + brandId[0] + "%'";
            } else {
                sql += " WHERE [Product].[Brand_id] in (SELECT Brand_Id FROM Brandd WHERE Brand_Name like '%" + brandId[0] + "%'";
                where = true;
            }
            for (int i = 1; i < brandId.length; i++) {
                sql += " OR Brand_Name like '%" + brandId[i] + "%'";
            }
            sql += ")";
        }
        if (where) {
            if (min != null) {
                sql += " AND Price.Price >= " + min;
            }
            if (max != null) {
                sql += " AND Price.Price <= " + max;
            }
        } else {
            if (min != null) {
                sql += " WHERE Price.Price >= " + min;
                where = true;
            }
            if (max != null && where) {
                sql += " AND Price.Price <= " + max;
            } else if (max != null) {
                sql += " WHERE Price.Price <= " + max;
                where = true;
            }
        }
        if (where) {
            sql += " AND Product.Status != 'deleted'";
        } else {
            sql += " WHERE Product.Status != 'deleted'";
        }
        //System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getProductByTittleSize(String strSearch, String[] cateId, String[] brandId, String min, String max) {
        String sql = "SELECT  Count(Product.Product_id) as Total FROM Product join Brandd on Brandd.Brand_id = Product.Brand_id join Product_Category on Product_Category.Category_id = Brandd.Category_id join Price On Price.Product_id = Product.Product_id WHERE Product_name LIKE ? AND Product.Status != 'deleted'";
        if (cateId.length > 0) {
            sql += " AND ([Product_Category].[Category_id] = " + cateId[0];
            for (int i = 1; i < cateId.length; i++) {
                sql += " OR [Product_Category].[Category_id] = " + cateId[i];
            }
            sql += ")";
        }
        if (brandId.length > 0) {
            sql += " AND [Product].[Brand_id] in (SELECT Brand_Id FROM Brandd WHERE Brand_Name like '%" + brandId[0] + "%'";
            for (int i = 1; i < brandId.length; i++) {
                sql += " OR Brand_Name like '%" + brandId[i] + "%'";
            }
            sql += ")";
        }
        if (min != null) {
            sql += " AND Price.Price >= " + min;
        }
        if (max != null) {
            sql += " AND Price.Price <= " + max;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + strSearch + "%");
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<Product> getProductByTittle(String strSearch, String[] cateId, int page, String[] brandId, String min, String max) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT Product.Product_name, Product.Product_img, Product.Product_id, Product_Detail.Decription, Price.Price, [Product_Category].[Category_name], Price.Sale, Price.Date_start, Price.Date_end FROM Product join Product_Detail ON Product.Product_id = Product_Detail.Product_id join Price on Product.Product_id = [Price].Product_id join Brandd on [Brandd].[Brand_Id] = [Product].[Brand_id] join [Product_Category] on [Product_Category].[Category_id] = [Brandd].[Category_id] WHERE Product_name LIKE ? AND Product.Status != 'deleted'";
        if (cateId.length > 0) {
            sql += " AND ([Product_Category].[Category_id] = " + cateId[0];
            for (int i = 1; i < cateId.length; i++) {
                sql += " OR [Product_Category].[Category_id] = " + cateId[i];
            }
            sql += ")";
        }
        if (brandId.length > 0) {
            sql += " AND [Product].[Brand_id] in (SELECT Brand_Id FROM Brandd WHERE Brand_Name like '%" + brandId[0] + "%'";
            for (int i = 1; i < brandId.length; i++) {
                sql += " OR Brand_Name like '%" + brandId[i] + "%'";
            }
            sql += ")";
        }
        if (min != null) {
            sql += " AND Price.Price >= " + min;
        }
        if (max != null) {
            sql += " AND Price.Price <= " + max;
        }
        sql += " ORDER BY Product.Product_id OFFSET " + ((page - 1) * 15) + " ROWS FETCH NEXT 15 ROWS ONLY;";
        System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + strSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product u = new Product();
                u.setProduct_name(rs.getString("Product_name"));
                u.setProduct_img(rs.getString("Product_img"));
                u.setProduct_id(rs.getInt("Product_id"));
                u.setDescription(rs.getString("Decription"));
                u.setPrice(rs.getInt("Price"));
                u.setCategory_name(rs.getString("Category_name"));
                u.setSale(rs.getInt("Sale"));
                long curr = new java.util.Date().getTime();
                if (curr < rs.getDate("Date_start").getTime() || curr > rs.getDate("Date_end").getTime()) {
                    u.setSale(0);
                }
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getAllProducts(int page) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT Product.Product_name, Product.Product_img, Product.Product_id, Product_Detail.Decription, Price.Price, [Product_Category].[Category_name], Price.Sale, Price.Date_start, Price.Date_end FROM Product join Product_Detail ON Product.Product_id = Product_Detail.Product_id join Price on Product.Product_id = [Price].Product_id join Brandd on [Brandd].[Brand_Id] = [Product].[Brand_id] join [Product_Category] on [Product_Category].[Category_id] = [Brandd].[Category_id] WHERE Product.Status != 'deleted'";
        sql += " ORDER BY Product.Product_id OFFSET " + ((page - 1) * 15) + " ROWS FETCH NEXT 15 ROWS ONLY;";
        System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product u = new Product();
                u.setProduct_name(rs.getString("Product_name"));
                u.setProduct_img(rs.getString("Product_img"));
                u.setProduct_id(rs.getInt("Product_id"));
                u.setDescription(rs.getString("Decription"));
                u.setPrice(rs.getInt("Price"));
                u.setCategory_name(rs.getString("Category_name"));
                u.setSale(rs.getInt("Sale"));
                long curr = new java.util.Date().getTime();
                if (curr < rs.getDate("Date_start").getTime() || curr > rs.getDate("Date_end").getTime()) {
                    u.setSale(0);
                }
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getAllProductsWithParameter(String[] cateId, int page, String[] brandId, String min, String max) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT Product.Product_name, Product.Product_img, Product.Product_id, Product_Detail.Decription, Price.Price, [Product_Category].[Category_name], Price.Sale, Price.Date_start, Price.Date_end FROM Product join Product_Detail ON Product.Product_id = Product_Detail.Product_id join Price on Product.Product_id = [Price].Product_id join Brandd on [Brandd].[Brand_Id] = [Product].[Brand_id] join [Product_Category] on [Product_Category].[Category_id] = [Brandd].[Category_id]";
        boolean where = false;
        if (cateId.length > 0) {
            where = true;
            sql += " WHERE ([Product_Category].[Category_id] = " + cateId[0];
            for (int i = 1; i < cateId.length; i++) {
                sql += " OR [Product_Category].[Category_id] = " + cateId[i];
            }
            sql += ")";
        }
        if (brandId.length > 0) {
            if (where) {
                sql += " AND [Product].[Brand_id] in (SELECT Brand_Id FROM Brandd WHERE Brand_Name like '%" + brandId[0] + "%'";
            } else {
                sql += " WHERE [Product].[Brand_id] in (SELECT Brand_Id FROM Brandd WHERE Brand_Name like '%" + brandId[0] + "%'";
                where = true;
            }
            for (int i = 1; i < brandId.length; i++) {
                sql += " OR Brand_Name like '%" + brandId[i] + "%'";
            }
            sql += ")";
        }
        if (where) {
            if (min != null) {
                sql += " AND Price.Price >= " + min;
            }
            if (max != null) {
                sql += " AND Price.Price <= " + max;
            }
        } else {
            if (min != null) {
                sql += " WHERE Price.Price >= " + min;
                where = true;
            }
            if (max != null && where) {
                sql += " AND Price.Price <= " + max;
            } else if (max != null) {
                sql += " WHERE Price.Price <= " + max;
                where = true;
            }
        }
        if (where) {
            sql += " AND Product.Status != 'deleted'";
        } else {
            sql += " WHERE Product.Status != 'deleted'";
        }
        sql += " ORDER BY Product.Product_id OFFSET " + ((page - 1) * 15) + " ROWS FETCH NEXT 15 ROWS ONLY;";
        System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product u = new Product();
                u.setProduct_name(rs.getString("Product_name"));
                u.setProduct_img(rs.getString("Product_img"));
                u.setProduct_id(rs.getInt("Product_id"));
                u.setDescription(rs.getString("Decription"));
                u.setPrice(rs.getInt("Price"));
                u.setCategory_name(rs.getString("Category_name"));
                u.setSale(rs.getInt("Sale"));
                long curr = new java.util.Date().getTime();
                if (curr < rs.getDate("Date_start").getTime() || curr > rs.getDate("Date_end").getTime()) {
                    u.setSale(0);
                }
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getSellingProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT p.Product_img, \n"
                + "       pc.Category_name, \n"
                + "       p.Product_name, \n"
                + "       pr.Price, \n"
                + "       p.Product_id, \n"
                + "       SUM(o.Order_quantity) AS Total_Products\n"
                + "FROM Product p\n"
                + "INNER JOIN [Order] o ON o.Product_id = p.Product_id\n"
                + "INNER JOIN Brandd b ON b.Brand_Id = p.Brand_id\n"
                + "INNER JOIN Product_Category pc ON pc.Category_id = b.Category_id\n"
                + "JOIN Price pr ON p.Product_id = pr.Product_id\n"
                + "where p.Status = 'active'\n"
                + "GROUP BY p.Product_img, \n"
                + "         pc.Category_name, \n"
                + "         p.Product_name, \n"
                + "         pr.Price, \n"
                + "         p.Product_id\n"
                + "ORDER BY Total_Products DESC;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProduct_img(rs.getString(1));
                product.setCategory_name(rs.getString(2));
                product.setProduct_name(rs.getString(3));
                product.setPrice(rs.getFloat(4));
                product.setProduct_id(rs.getInt(5));
                list.add(product);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getSellingProduct(String startDate, String endDate, int numberOfTop) {
        List<Product> list = new ArrayList<>();
        String sql = """
                     SELECT TOP (?)
                         p.Product_name,
                         SUM(o.Order_quantity) AS Total_Products
                     FROM
                         Product p
                     INNER JOIN
                         [Order] o ON p.Product_id = o.Product_id
                     INNER JOIN
                         Bill b ON o.Bill_id = b.Bill_Id
                     JOIN
                         Brandd br ON p.Brand_id = br.Brand_Id
                     JOIN
                         Product_Category pc ON br.Category_id = pc.Category_id
                     WHERE
                         b.Date BETWEEN ? AND ?
                         AND b.Status = N'Hoàn thành'
                     GROUP BY
                         pc.Category_name,
                         p.Product_id,
                         p.Product_name
                     ORDER BY
                         Total_Products DESC;""";
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
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getTrendCategory(String month, String year) {
        List<Product> list = new ArrayList<>();
        String sql;

        if (!"0".equalsIgnoreCase(month)) {
            sql = "SELECT\n"
                    + "                      pc.Category_name,\n"
                    + "                      SUM(DISTINCT o.Order_quantity) AS Product_Sum\n"
                    + "                  FROM\n"
                    + "                      [Bill] b\n"
                    + "                  JOIN\n"
                    + "                      [Order] o ON b.Bill_id = o.Bill_id\n"
                    + "                  JOIN\n"
                    + "                      Product p ON o.Product_id = p.Product_id\n"
                    + "                  JOIN\n"
                    + "                      Brandd br ON p.Brand_id = br.Brand_id\n"
                    + "                  JOIN\n"
                    + "                      Product_Category pc ON br.Category_id = pc.Category_id\n"
                    + "                  WHERE\n"
                    + "                      YEAR(b.Date) = ? AND MONTH(b.Date) = ?\n"
                    + "                      AND b.Status = 'Hoàn thành'\n"
                    + "                  GROUP BY\n"
                    + "                      pc.Category_name\n"
                    + "                  ORDER BY\n"
                    + "                      pc.Category_name ASC";
        } else {
            sql = "SELECT\n"
                    + "                      pc.Category_name,\n"
                    + "                      SUM(DISTINCT o.Order_quantity) AS Product_Sum\n"
                    + "                  FROM\n"
                    + "                      [Bill] b\n"
                    + "                  JOIN\n"
                    + "                      [Order] o ON b.Bill_id = o.Bill_id\n"
                    + "                  JOIN\n"
                    + "                      Product p ON o.Product_id = p.Product_id\n"
                    + "                  JOIN\n"
                    + "                      Brandd br ON p.Brand_id = br.Brand_id\n"
                    + "                  JOIN\n"
                    + "                      Product_Category pc ON br.Category_id = pc.Category_id\n"
                    + "                  WHERE\n"
                    + "                      YEAR(b.Date) = ?\n"
                    + "                      AND b.Status = 'Hoàn thành'\n"
                    + "                  GROUP BY\n"
                    + "                      pc.Category_name\n"
                    + "                  ORDER BY\n"
                    + "                      pc.Category_name ASC";
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, year);
            if (!"0".equalsIgnoreCase(month)) {
                st.setString(2, month);
            }

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product prd = new Product();
                prd.setCategory_name(rs.getString("Category_name"));
                prd.setQuantity(rs.getInt("Product_Sum"));
                list.add(prd);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getProductByPrice() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.Product_name, p.Product_img, pc.Category_name, pr.Price, p.Product_id\n"
                + "From Product p\n"
                + "Inner join Brandd b on b.Brand_Id = p.Brand_id\n"
                + "Inner Join Product_Category pc on pc.Category_id = b.Category_id\n"
                + "Join Price pr on p.Product_id = pr.Product_id\n"
                + "where pr.Price between 1000000 AND 5000000 and p.Status = 'active'\n"
                + "and pc.Category_id = 1\n"
                + "Order by Price ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProduct_name(rs.getString(1));
                product.setProduct_img(rs.getString(2));
                product.setCategory_name(rs.getString(3));
                product.setPrice(rs.getFloat(4));
                product.setProduct_id(rs.getInt(5));
                list.add(product);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getTiviByPrice() {
        List<Product> list = new ArrayList<>();
        String sql = " select p.Product_name, p.Product_img, pc.Category_name, pr.Price, pd.Size, p.Product_id\n"
                + "From Product p\n"
                + "Inner Join Brandd b on b.Brand_Id = p.Brand_id\n"
                + "Inner Join Product_Category pc on pc.Category_id = b.Category_id\n"
                + "Join Product_Detail pd on pd.Product_id = p.Product_id\n"
                + "Join Price pr on pr.Product_id = p.Product_id\n"
                + "where pc.Category_id = 4 and pr.Price between 12000000 and 30000000 and p.Status = 'active' Order by Price";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProduct_name(rs.getString(1));
                product.setProduct_img(rs.getString(2));
                product.setCategory_name(rs.getString(3));
                product.setPrice(rs.getFloat(4));
                product.setSize(rs.getString(5));
                product.setProduct_id(rs.getInt(6));
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getPopularProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "select TOP 3 p.Product_name, p.Product_img, pc.Category_name, pr.Price, p.Product_id, (SELECT Count([Order_id]) FROM [Order] WHERE p.[Product_id] = [Order].[Product_id]) as TotalBought, pr.Sale, pr.Date_start, pr.Date_end\n"
                + "From Product p\n"
                + "Inner Join Brandd b on b.Brand_Id = p.Brand_id\n"
                + "Inner Join Product_Category pc on pc.Category_id = b.Category_id\n"
                + "Join Price pr on pr.Product_id = p.Product_id\n"
                + "Order by TotalBought desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProduct_name(rs.getString(1));
                product.setProduct_img(rs.getString(2));
                product.setCategory_name(rs.getString(3));
                product.setPrice(rs.getFloat(4));
                product.setProduct_id(rs.getInt(5));
                product.setSale(rs.getInt(6));
                long curr = new java.util.Date().getTime();
                if (curr < rs.getDate("Date_start").getTime() || curr > rs.getDate("Date_end").getTime()) {
                    product.setSale(0);
                }
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getNewProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "select TOP 3 p.Product_name, p.Product_img, pc.Category_name, pr.Price, p.Product_id, pr.Sale, pr.Date_start, pr.Date_end\n"
                + "From Product p\n"
                + "Inner Join Brandd b on b.Brand_Id = p.Brand_id\n"
                + "Inner Join Product_Category pc on pc.Category_id = b.Category_id\n"
                + "Join Price pr on pr.Product_id = p.Product_id\n"
                + "Order by p.Date desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProduct_name(rs.getString(1));
                product.setProduct_img(rs.getString(2));
                product.setCategory_name(rs.getString(3));
                product.setPrice(rs.getFloat(4));
                product.setProduct_id(rs.getInt(5));
                product.setSale(rs.getInt(6));
                long curr = new java.util.Date().getTime();
                if (curr < rs.getDate("Date_start").getTime() || curr > rs.getDate("Date_end").getTime()) {
                    product.setSale(0);
                }
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getNewProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.Product_name, p.Product_img, pc.Category_name, pr.Price, p.Product_id\n"
                + "From Product p\n"
                + "Inner Join Brandd b on b.Brand_Id = p.Brand_id\n"
                + "Inner Join Product_Category pc on pc.Category_id = b.Category_id\n"
                + "Join Price pr on pr.Product_id = p.Product_id\n"
                + "WHERE p.Date BETWEEN '2024-01-01' AND '2024-12-31' and p.Status = 'active'\n"
                + "Order by p.Date desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProduct_name(rs.getString(1));
                product.setProduct_img(rs.getString(2));
                product.setCategory_name(rs.getString(3));
                product.setPrice(rs.getFloat(4));
                product.setProduct_id(rs.getInt(5));
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getMTB() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.Product_name, p.Product_img, pc.Category_name, pr.Price, p.Product_id\n"
                + "From Product p\n"
                + "Inner Join Brandd b on b.Brand_Id = p.Brand_id\n"
                + "Inner Join Product_Category pc on pc.Category_id = b.Category_id\n"
                + "Join Price pr on pr.Product_id = p.Product_id\n"
                + "WHERE pc.Category_id = 10 and p.Status = 'active'\n"
                + "Order by p.Date desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProduct_name(rs.getString(1));
                product.setProduct_img(rs.getString(2));
                product.setCategory_name(rs.getString(3));
                product.setPrice(rs.getFloat(4));
                product.setProduct_id(rs.getInt(5));
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getML() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.Product_name, p.Product_img, pc.Category_name, pr.Price, p.Product_id\n"
                + "From Product p\n"
                + "Inner Join Brandd b on b.Brand_Id = p.Brand_id\n"
                + "Inner Join Product_Category pc on pc.Category_id = b.Category_id\n"
                + "Join Price pr on pr.Product_id = p.Product_id\n"
                + "WHERE pc.Category_id = 3 and p.Status = 'active'\n"
                + "Order by p.Quantity desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProduct_name(rs.getString(1));
                product.setProduct_img(rs.getString(2));
                product.setCategory_name(rs.getString(3));
                product.setPrice(rs.getFloat(4));
                product.setProduct_id(rs.getInt(5));
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getHDD() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.Product_name, p.Product_img, pc.Category_name, pr.Price, p.Product_id, p.Quantity\n"
                + "From Product p\n"
                + "Inner Join Brandd b on b.Brand_Id = p.Brand_id\n"
                + "Inner Join Product_Category pc on pc.Category_id = b.Category_id\n"
                + "Join Price pr on pr.Product_id = p.Product_id\n"
                + "WHERE pc.Category_id = 8 and pr.Price between 1000000 and 4000000 and p.Status = 'active'\n"
                + "Order by pr.Price desc"; 
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProduct_name(rs.getString(1));
                product.setProduct_img(rs.getString(2));
                product.setCategory_name(rs.getString(3));
                product.setPrice(rs.getFloat(4));
                product.setProduct_id(rs.getInt(5));
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getHC() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.Product_name, p.Product_img, pc.Category_name, pr.Price, p.Quantity, p.Product_id\n"
                + "From Product p\n"
                + "Inner Join Brandd b on b.Brand_Id = p.Brand_id\n"
                + "Inner Join Product_Category pc on pc.Category_id = b.Category_id\n"
                + "Join Price pr on pr.Product_id = p.Product_id\n"
                + "WHERE pc.Category_id = 9 and p.Status = 'active'\n"
                + "Order by pr.Price";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProduct_name(rs.getString(1));
                product.setProduct_img(rs.getString(2));
                product.setCategory_name(rs.getString(3));
                product.setPrice(rs.getFloat(4));
                product.setQuantity(rs.getInt(5));
                product.setProduct_id(rs.getInt(6));
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getTotalNumberOfProducts() {
        int totalNumberOfProducts = 0;
        String sql = "SELECT SUM(Quantity) AS TotalCount FROM Product;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalNumberOfProducts = rs.getInt("TotalCount");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalNumberOfProducts;
    }

    public int Paging(String search) {
        int Page = 0;
        String sql = "SELECT count([Product_id]) AS TotalCount FROM Product";
        if (search != null && !search.isEmpty()) {
            sql += " WHERE [Product_name] LIKE ?";
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (search != null && !search.isEmpty()) {
                st.setString(1, "%" + search + "%");
            }
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Page = rs.getInt("TotalCount");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return Page;
    }

    public Product1 getProductById(int id) {
        String sql = "SELECT [Product_id]\n"
                + "      ,[Quantity]\n"
                + "      ,[Product_name]\n"
                + "      ,[Product_img]\n"
                + "      ,[User_Id]\n"
                + "      ,[Brand_id]\n"
                + "  FROM [dbo].[Product]\n"
                + "  where Product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User_DAO ud = new User_DAO();
                User u = ud.getCustomerByID(rs.getInt("User_Id"));
                Brand_DAO bdao = new Brand_DAO();
                Brand b = bdao.getBrandById(rs.getInt("Brand_id"));
                return new Product1(rs.getInt("Product_id"), rs.getInt("Quantity"), rs.getString("Product_name"), rs.getString("Product_img"), u, b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Product> getAllProductinCart() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.Product_id, p.Product_img, p.Product_name, p.Quantity, pr.Price, pd.Battery, pd.Color\n"
                + "From Product p, Price pr, Product_Detail pd\n"
                + "where p.Product_id = pr.Product_id and p.Product_id = pd.Product_id and p.Status = 'active'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProduct_id(rs.getInt(1));
                product.setProduct_img(rs.getString(2));
                product.setProduct_name(rs.getString(3));
                product.setQuantity(rs.getInt(4));
                product.setPrice(rs.getFloat(5));

                ProductDetail productDetail = new ProductDetail();
                productDetail.setBattery(rs.getString(6));
                productDetail.setColor(rs.getString(7));
                product.setProductdetail(productDetail);
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Product getProductByIdinCart(int id) {
        String sql = "select p.Product_id, p.Product_img, p.Product_name, p.Quantity, pr.Price, pd.Battery, pd.Color\n"
                + "From Product p, Price pr, Product_Detail pd\n"
                + "where p.Product_id = pr.Product_id and p.Product_id = pd.Product_id\n"
                + "and p.Product_id=?";
        Product product = null;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                product = new Product();
                product.setProduct_id(rs.getInt(1));
                product.setProduct_img(rs.getString(2));
                product.setProduct_name(rs.getString(3));
                product.setQuantity(rs.getInt(4));
                product.setPrice(rs.getFloat(5));

                ProductDetail productDetail = new ProductDetail();
                productDetail.setBattery(rs.getString(6));
                productDetail.setColor(rs.getString(7));
                product.setProductdetail(productDetail);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

}
