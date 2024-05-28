/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.dals;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.models.Product;

/**
 *
 * @author admin
 */
public class Product_DAO extends DBContext {
    
    public int getAllProductsSize(int cateId) {
        String sql = "SELECT  Count(Product.Product_id) as Total FROM Product join Brandd on Brandd.Brand_id = Product.Brand_id join Product_Category on Product_Category.Category_id = Brandd.Category_id";
        if(cateId != -1) {
            sql += " WHERE [Product_Category].[Category_id] = " + cateId;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }
    
    public int getProductByTittleSize(String strSearch, int cateId) {
        String sql = "SELECT  Count(Product.Product_id) as Total FROM Product join Brandd on Brandd.Brand_id = Product.Brand_id join Product_Category on Product_Category.Category_id = Brandd.Category_id WHERE Product_name LIKE ?";
        if(cateId != -1) {
            sql += " AND [Product_Category].[Category_id] = " + cateId;
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + strSearch + "%");
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

    public List<Product> getProductByTittle(String strSearch, int cateId, int page) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT Product.Product_name, Product.Product_img, Product.Product_id, Product_Detail.Decription, Price.Price, [Product_Category].[Category_name] FROM Product join Product_Detail ON Product.Product_id = Product_Detail.Product_id join Price on Product.Product_id = [Price].Product_id join Brandd on [Brandd].[Brand_Id] = [Product].[Brand_id] join [Product_Category] on [Product_Category].[Category_id] = [Brandd].[Category_id] WHERE Product_name LIKE ?";
        if(cateId != -1) {
            sql += " AND [Product_Category].[Category_id] = " + cateId;
        }
        sql += " ORDER BY Product.Product_id OFFSET "+((page - 1) * 9)+" ROWS FETCH NEXT 9 ROWS ONLY;";
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
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    
    public List<Product> getAllProducts(int cateId, int page) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT Product.Product_name, Product.Product_img, Product.Product_id, Product_Detail.Decription, Price.Price, [Product_Category].[Category_name] FROM Product join Product_Detail ON Product.Product_id = Product_Detail.Product_id join Price on Product.Product_id = [Price].Product_id join Brandd on [Brandd].[Brand_Id] = [Product].[Brand_id] join [Product_Category] on [Product_Category].[Category_id] = [Brandd].[Category_id]";
        if(cateId != -1) {
            sql += " WHERE [Product_Category].[Category_id] = " + cateId;
        }
        sql += " ORDER BY Product.Product_id OFFSET "+((page - 1) * 9)+" ROWS FETCH NEXT 9 ROWS ONLY;";
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
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getSellingProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.Product_img, pc.Category_name, p.Product_name, pr.Price, SUM(o.Order_quantity) AS Total_Products\n"
                + "from Product p\n"
                + "Inner Join [Order] o on o.Product_id = p.Product_id\n"
                + "Inner Join Brandd b on b.Brand_Id = p.Brand_id\n"
                + "Inner Join Product_Category pc on pc.Category_id = b.Category_id\n"
                + "Join Price pr on p.Product_id = pr.Product_id\n"
                + "Group by p.Product_img, pc.Category_name, p.Product_name, pr.Price\n"
                + "Order by Total_Products DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setProduct_img(rs.getString(1));
                product.setCategory_name(rs.getString(2));
                product.setProduct_name(rs.getString(3));
                product.setPrice(rs.getFloat(4));
                list.add(product);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {

        Product_DAO data = new Product_DAO();
        // Gọi phương thức getSellingProduct
        List<Product> products = data.getTiviByPrice();

        // In ra kết quả để kiểm tra
        for (Product product : products) {
            System.out.println(product.getProduct_name() + "/ " + product.getProduct_img() + "/ " + product.getCategory_name() + "/ " + product.getPrice() + "/ " + product.getSize());
        }
    }

    public List<Product> getProductByPrice() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.Product_name, p.Product_img, pc.Category_name, pr.Price\n"
                + "From Product p\n"
                + "Inner join Brandd b on b.Brand_Id = p.Brand_id\n"
                + "Inner Join Product_Category pc on pc.Category_id = b.Category_id\n"
                + "Join Price pr on p.Product_id = pr.Product_id\n"
                + "where pr.Price between 1000000 AND 5000000\n"
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
                list.add(product);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getTiviByPrice() {
        List<Product> list = new ArrayList<>();
        String sql = " select p.Product_name, p.Product_img, pc.Category_name, pr.Price, pd.Size\n"
                + "From Product p\n"
                + "Inner Join Brandd b on b.Brand_Id = p.Brand_id\n"
                + "Inner Join Product_Category pc on pc.Category_id = b.Category_id\n"
                + "Join Product_Detail pd on pd.Product_id = p.Product_id\n"
                + "Join Price pr on pr.Product_id = p.Product_id\n"
                + "where pc.Category_id = 4 and pr.Price between 12000000 and 30000000 Order by Price";
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
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getNewProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.Product_name, p.Product_img, pc.Category_name, pr.Price\n"
                + "From Product p\n"
                + "Inner Join Brandd b on b.Brand_Id = p.Brand_id\n"
                + "Inner Join Product_Category pc on pc.Category_id = b.Category_id\n"
                + "Join Price pr on pr.Product_id = p.Product_id\n"
                + "WHERE p.Date BETWEEN '2024-01-01' AND '2024-12-31'\n"
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
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getMTB() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.Product_name, p.Product_img, pc.Category_name, pr.Price\n"
                + "From Product p\n"
                + "Inner Join Brandd b on b.Brand_Id = p.Brand_id\n"
                + "Inner Join Product_Category pc on pc.Category_id = b.Category_id\n"
                + "Join Price pr on pr.Product_id = p.Product_id\n"
                + "WHERE pc.Category_id = 10\n"
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
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getML() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.Product_name, p.Product_img, pc.Category_name, pr.Price\n"
                + "From Product p\n"
                + "Inner Join Brandd b on b.Brand_Id = p.Brand_id\n"
                + "Inner Join Product_Category pc on pc.Category_id = b.Category_id\n"
                + "Join Price pr on pr.Product_id = p.Product_id\n"
                + "WHERE pc.Category_id = 3\n"
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
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getHDD() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.Product_name, p.Product_img, pc.Category_name, pr.Price, p.Quantity\n"
                + "From Product p\n"
                + "Inner Join Brandd b on b.Brand_Id = p.Brand_id\n"
                + "Inner Join Product_Category pc on pc.Category_id = b.Category_id\n"
                + "Join Price pr on pr.Product_id = p.Product_id\n"
                + "WHERE pc.Category_id = 8 and pr.Price between 1000000 and 4000000\n"
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
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Product> getHC() {
        List<Product> list = new ArrayList<>();
        String sql = "select p.Product_name, p.Product_img, pc.Category_name, pr.Price, p.Quantity\n"
                + "From Product p\n"
                + "Inner Join Brandd b on b.Brand_Id = p.Brand_id\n"
                + "Inner Join Product_Category pc on pc.Category_id = b.Category_id\n"
                + "Join Price pr on pr.Product_id = p.Product_id\n"
                + "WHERE pc.Category_id = 9 \n"
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
                list.add(product);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getTotalNumberOfProducts() {
        int totalNumberOfProducts = 0;
        String sql = "SELECT COUNT(*) AS TotalCount FROM Product;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalNumberOfProducts = rs.getInt("TotalCount");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return totalNumberOfProducts;
    }

}
