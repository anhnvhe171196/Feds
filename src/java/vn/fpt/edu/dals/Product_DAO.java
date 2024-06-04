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
import vn.fpt.edu.models.Brand;
import vn.fpt.edu.models.Product1;
import vn.fpt.edu.models.Product;
import vn.fpt.edu.models.User;

/**
 *
 * @author admin
 */
public class Product_DAO extends DBContext {

      public int getAllProductsSize() {
        String sql = "SELECT Count(Product.Product_id) as Total FROM Product join Brandd on Brandd.Brand_id = Product.Brand_id join Product_Category on Product_Category.Category_id = Brandd.Category_id join Price On Price.Product_id = Product.Product_id";
        System.out.println(sql);
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
    
    public int getAllProductsWithParameterSize(String[] cateId, String[] brandId, String min, String max) {
        String sql = "SELECT Count(Product.Product_id) as Total FROM Product join Brandd on Brandd.Brand_id = Product.Brand_id join Product_Category on Product_Category.Category_id = Brandd.Category_id join Price On Price.Product_id = Product.Product_id";
        boolean where = false;
        if(cateId.length > 0) {
            where =  true;
            sql += " WHERE ([Product_Category].[Category_id] = " + cateId[0];
            for(int i = 1; i < cateId.length; i++) {
                sql += " OR [Product_Category].[Category_id] = " + cateId[i];
            }
            sql += ")";
        }
        if(brandId.length > 0) {
            if(where) {
                sql += " AND [Product].[Brand_id] in (SELECT Brand_Id FROM Brandd WHERE Brand_Name like '%" + brandId[0]+"%'";
            } else {
                sql += " WHERE [Product].[Brand_id] in (SELECT Brand_Id FROM Brandd WHERE Brand_Name like '%" + brandId[0]+"%'";
                where = true;
            }
            for(int i = 1; i < brandId.length; i++) {
                sql += " OR Brand_Name like '%" + brandId[i]+"%'";
            }
            sql += ")";
        }
        if(where) {
            if(min != null) {
                sql += " AND Price.Price >= " + min;
            }
            if(max != null) {
                sql += " AND Price.Price <= " + max;
            }
        } else {
            if(min != null) {
                sql += " WHERE Price.Price >= " + min;
                where = true;
            }
            if(max != null && where) {
                sql += " AND Price.Price <= " + max;
            } else if(max != null) {
                sql += " WHERE Price.Price <= " + max;
            }
        }
        System.out.println(sql);
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

     public int getProductByTittleSize(String strSearch, String[] cateId, String[] brandId, String min, String max) {
        String sql = "SELECT  Count(Product.Product_id) as Total FROM Product join Brandd on Brandd.Brand_id = Product.Brand_id join Product_Category on Product_Category.Category_id = Brandd.Category_id join Price On Price.Product_id = Product.Product_id WHERE Product_name LIKE ?";
        if(cateId.length > 0) {
            sql += " AND ([Product_Category].[Category_id] = " + cateId[0];
            for(int i = 1; i < cateId.length; i++) {
                sql += " OR [Product_Category].[Category_id] = " + cateId[i];
            }
            sql += ")";
        }
        if(brandId.length > 0) {
            sql += " AND [Product].[Brand_id] in (SELECT Brand_Id FROM Brandd WHERE Brand_Name like '%" + brandId[0]+"%'";
            for(int i = 1; i < brandId.length; i++) {
                sql += " OR Brand_Name like '%" + brandId[i]+"%'";
            }
            sql += ")";
        }
        if(min != null) {
            sql += " AND Price.Price >= " + min;
        }
        if(max != null) {
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
            System.out.println(e);
        }
        return 0;
    }

  public List<Product> getProductByTittle(String strSearch, String[] cateId, int page, String[] brandId, String min, String max) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT Product.Product_name, Product.Product_img, Product.Product_id, Product_Detail.Decription, Price.Price, [Product_Category].[Category_name] FROM Product join Product_Detail ON Product.Product_id = Product_Detail.Product_id join Price on Product.Product_id = [Price].Product_id join Brandd on [Brandd].[Brand_Id] = [Product].[Brand_id] join [Product_Category] on [Product_Category].[Category_id] = [Brandd].[Category_id] WHERE Product_name LIKE ?";
        if(cateId.length > 0) {
            sql += " AND ([Product_Category].[Category_id] = " + cateId[0];
            for(int i = 1; i < cateId.length; i++) {
                sql += " OR [Product_Category].[Category_id] = " + cateId[i];
            }
            sql += ")";
        }
        if(brandId.length > 0) {
            sql += " AND [Product].[Brand_id] in (SELECT Brand_Id FROM Brandd WHERE Brand_Name like '%" + brandId[0]+"%'";
            for(int i = 1; i < brandId.length; i++) {
                sql += " OR Brand_Name like '%" + brandId[i]+"%'";
            }
            sql += ")";
        }
        if(min != null) {
            sql += " AND Price.Price >= " + min;
        }
        if(max != null) {
            sql += " AND Price.Price <= " + max;
        }
        sql += " ORDER BY Product.Product_id OFFSET "+((page - 1) * 9)+" ROWS FETCH NEXT 9 ROWS ONLY;";
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
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

 public List<Product> getAllProducts(int page) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT Product.Product_name, Product.Product_img, Product.Product_id, Product_Detail.Decription, Price.Price, [Product_Category].[Category_name] FROM Product join Product_Detail ON Product.Product_id = Product_Detail.Product_id join Price on Product.Product_id = [Price].Product_id join Brandd on [Brandd].[Brand_Id] = [Product].[Brand_id] join [Product_Category] on [Product_Category].[Category_id] = [Brandd].[Category_id]";
        sql += " ORDER BY Product.Product_id OFFSET "+((page - 1) * 9)+" ROWS FETCH NEXT 9 ROWS ONLY;";
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
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> getAllProductsWithParameter(String[] cateId, int page, String[] brandId, String min, String max) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT Product.Product_name, Product.Product_img, Product.Product_id, Product_Detail.Decription, Price.Price, [Product_Category].[Category_name] FROM Product join Product_Detail ON Product.Product_id = Product_Detail.Product_id join Price on Product.Product_id = [Price].Product_id join Brandd on [Brandd].[Brand_Id] = [Product].[Brand_id] join [Product_Category] on [Product_Category].[Category_id] = [Brandd].[Category_id]";
        boolean where = false;
        if(cateId.length > 0) {
            where = true;
            sql += " WHERE ([Product_Category].[Category_id] = " + cateId[0];
            for(int i = 1; i < cateId.length; i++) {
                sql += " OR [Product_Category].[Category_id] = " + cateId[i];
            }
            sql += ")";
        }
        if(brandId.length > 0) {
            if(where) {
                sql += " AND [Product].[Brand_id] in (SELECT Brand_Id FROM Brandd WHERE Brand_Name like '%" + brandId[0]+"%'";
            } else {
                sql += " WHERE [Product].[Brand_id] in (SELECT Brand_Id FROM Brandd WHERE Brand_Name like '%" + brandId[0]+"%'";
                where = true;
            }
            for(int i = 1; i < brandId.length; i++) {
                sql += " OR Brand_Name like '%" + brandId[i]+"%'";
            }
            sql += ")";
        }
        if(where) {
            if(min != null) {
sql += " AND Price.Price >= " + min;
            }
            if(max != null) {
                sql += " AND Price.Price <= " + max;
            }
        } else {
            if(min != null) {
                sql += " WHERE Price.Price >= " + min;
                where = true;
            }
            if(max != null && where) {
                sql += " AND Price.Price <= " + max;
            } else if(max != null) {
                sql += " WHERE Price.Price <= " + max;
            }
        }
        sql += " ORDER BY Product.Product_id OFFSET "+((page - 1) * 9)+" ROWS FETCH NEXT 9 ROWS ONLY;";
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

    public List<Product> getTrendCategory(String month, String year) {
        List<Product> list = new ArrayList<>();
        String sql;

        if (!"0".equalsIgnoreCase(month)) {
            sql = "SELECT\n"
                    + "    pc.Category_name,\n"
                    + "    COUNT(DISTINCT b.Bill_id) AS Bill_Count\n"
                    + "FROM\n"
                    + "    [Bill] b\n"
                    + "JOIN\n"
                    + "    [Order] o ON b.Bill_id = o.Bill_id\n"
                    + "JOIN\n"
                    + "    Product p ON o.Product_id = p.Product_id\n"
                    + "JOIN\n"
                    + "    Brandd br ON p.Brand_id = br.Brand_id\n"
                    + "JOIN\n"
                    + "    Product_Category pc ON br.Category_id = pc.Category_id\n"
                    + "WHERE\n"
                    + "    YEAR(b.Date) = ? AND MONTH(b.Date) = ?\n"
                    + "    AND b.Status = 'Done'\n"
                    + "GROUP BY\n"
                    + "    pc.Category_name\n"
                    + "ORDER BY\n"
                    + "    pc.Category_name ASC;";
        } else {
            sql = "SELECT\n"
                    + "    pc.Category_name,\n"
                    + "    COUNT(DISTINCT b.Bill_id) AS Bill_Count\n"
                    + "FROM\n"
                    + "    [Bill] b\n"
                    + "JOIN\n"
                    + "    [Order] o ON b.Bill_id = o.Bill_id\n"
                    + "JOIN\n"
                    + "    Product p ON o.Product_id = p.Product_id\n"
                    + "JOIN\n"
                    + "    Brandd br ON p.Brand_id = br.Brand_id\n"
                    + "JOIN\n"
                    + "    Product_Category pc ON br.Category_id = pc.Category_id\n"
                    + "WHERE\n"
                    + "    YEAR(b.Date) = ?\n"
                    + "    AND b.Status = 'Done'\n"
                    + "GROUP BY\n"
                    + "    pc.Category_name\n"
                    + "ORDER BY\n"
                    + "    pc.Category_name ASC;";
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
                prd.setQuantity(rs.getInt("Bill_Count"));
                list.add(prd);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
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
            System.out.println(e);
        }
        return null;
    }
    
}

//aaaaaa