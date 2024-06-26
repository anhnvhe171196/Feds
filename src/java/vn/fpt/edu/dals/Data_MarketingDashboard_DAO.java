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
import vn.fpt.edu.models.Order;
import vn.fpt.edu.models.Price;
import vn.fpt.edu.models.Product;
import vn.fpt.edu.models.Product1;
import vn.fpt.edu.models.ProductDetail;
import vn.fpt.edu.models.Role;
import vn.fpt.edu.models.User;
import vn.fpt.edu.models.UserDetails;

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

    public List<Product1> getAllProducts1(int index, String sortBy, String sortOrder) {
        List<Product1> productList = new ArrayList<>();

        String sql = "SELECT p.Product_id, p.Product_name, p.Product_img, p.Quantity, pr.Price, pr.Date_start, pr.Date_end, pr.Sale, br.Brand_Id AS brandId, br.Brand_Name AS brandName \n"
                + "FROM Product p \n"
                + "LEFT JOIN Price pr ON p.Product_id = pr.Product_id \n"
                + "LEFT JOIN [Brandd] br ON p.[Brand_id] = br.Brand_Id \n";

        if ("name".equals(sortBy)) {
            sql += "ORDER BY p.Product_name ";
        } else if ("price".equals(sortBy)) {
            sql += "ORDER BY pr.Price ";
        } else if ("quantity".equals(sortBy)) {
            sql += "ORDER BY p.Quantity ";
        } else if ("datestart".equals(sortBy)) {
            sql += "ORDER BY \n"
                    + "    CASE \n"
                    + "        WHEN pr.Date_start IS NULL THEN 1 \n"
                    + "        ELSE 0 \n"
                    + "    END, \n"
                    + "    pr.Date_start ";
        } else if ("dateend".equals(sortBy)) {
            sql += "ORDER BY \n"
                    + "    CASE \n"
                    + "        WHEN pr.Date_end IS NULL THEN 1 \n"
                    + "        ELSE 0 \n"
                    + "    END, \n"
                    + "    pr.Date_end ";
        } else {
            sql += "ORDER BY p.Product_id ";
        }

        if ("asc".equals(sortOrder)) {
            sql += "ASC ";
        } else if ("desc".equals(sortOrder)) {
            sql += "DESC ";
        } else {
            sql += " ";
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

    public List<Product1> getProductsSearchByName(int index, String sortBy, String sortOrder, String search) {
        List<Product1> productList = new ArrayList<>();

        String sql = "SELECT p.Product_id, p.Product_name, p.Product_img, p.Quantity, pr.Price, pr.Date_start, pr.Date_end, pr.Sale, br.Brand_Id AS brandId, br.Brand_Name AS brandName \n"
                + "FROM Product p \n"
                + "LEFT JOIN Price pr ON p.Product_id = pr.Product_id \n"
                + "LEFT JOIN [Brandd] br ON p.[Brand_id] = br.Brand_Id \n";

        if (search != null && !search.isEmpty()) {
            sql += "WHERE p.Product_name LIKE ? ";
        }

        if ("name".equals(sortBy)) {
            sql += "ORDER BY p.Product_name ";
        } else if ("price".equals(sortBy)) {
            sql += "ORDER BY pr.Price ";
        } else if ("quantity".equals(sortBy)) {
            sql += "ORDER BY p.Quantity ";
        } else if ("datestart".equals(sortBy)) {
            sql += "ORDER BY \n"
                    + "    CASE \n"
                    + "        WHEN pr.Date_start IS NULL THEN 1 \n"
                    + "        ELSE 0 \n"
                    + "    END, \n"
                    + "    pr.Date_start ";
        } else if ("dateend".equals(sortBy)) {
            sql += "ORDER BY \n"
                    + "    CASE \n"
                    + "        WHEN pr.Date_end IS NULL THEN 1 \n"
                    + "        ELSE 0 \n"
                    + "    END, \n"
                    + "    pr.Date_end ";
        } else {
            sql += "ORDER BY p.Product_id ";
        }

        if ("asc".equals(sortOrder)) {
            sql += "ASC ";
        } else if ("desc".equals(sortOrder)) {
            sql += "DESC ";
        } else {
            sql += " ";
        }

        sql += "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, "%" + search + "%");
            st.setInt(2, (index - 1) * 10);
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

    public Product1 getProductById(int productId) {
        Product1 product = null;
        String sql = "SELECT p.Product_id, p.Quantity, p.Product_name, p.Product_img, p.Brand_id, "
                + "       pc.Category_name, pd.RAM, pd.ROM, pd.Size, pd.Battery, pd.Weight, pd.Color, pd.Decription, "
                + "       pd.CPU, pd.Wattage, pd.Status, pr.Price, pr.Date_start, pr.Date_end, pr.Sale, "
                + "       b.Brand_Name "
                + "FROM Product p "
                + "JOIN Product_Category pc ON pc.Category_id = (SELECT c.Category_id FROM Brandd b JOIN Product_Category c ON b.Category_id = c.Category_id WHERE b.Brand_Id = p.Brand_id) "
                + "JOIN Product_Detail pd ON p.Product_id = pd.Product_id "
                + "JOIN Price pr ON p.Product_id = pr.Product_id "
                + "JOIN Brandd b ON p.Brand_id = b.Brand_Id "
                + "WHERE p.Product_id = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                product = new Product1();
                product.setProduct_id(rs.getInt("Product_id"));
                product.setQuantity(rs.getInt("Quantity"));
                product.setProduct_name(rs.getString("Product_name"));
                product.setProduct_img(rs.getString("Product_img"));
                // Thiết lập các thuộc tính khác của Product1 tương tự như trên

                //Khởi tạo ProductDetail
                String ram = rs.getString("RAM");
                String rom = rs.getString("ROM");
                String size = rs.getString("Size");
                String Battery = rs.getString("Battery");
                String Weight = rs.getString("Weight");
                String Color = rs.getString("Color");
                String Decription = rs.getString("Decription");
                String CPU = rs.getString("CPU");
                String Wattage = rs.getString("Wattage");
                String Status = rs.getString("Status");

                ProductDetail dt = new ProductDetail(ram, rom, size, Battery, Weight, Color, Decription, CPU, Wattage, Status, product);
                product.setDetail(dt);

                // Khởi tạo Price
                Price price = new Price();
                price.setPrice(rs.getDouble("Price"));
                price.setDateStart(rs.getDate("Date_start"));
                price.setDateEnd(rs.getDate("Date_end"));
                price.setSale(rs.getInt("Sale"));
                product.setPrice(price);

                // Khởi tạo Brand
                Brand brand = new Brand();
                brand.setBrandId(rs.getInt("Brand_id"));
                brand.setBrandName(rs.getString("Brand_Name"));
                product.setBrand(brand);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return product;
    }

    public List<User> getAllUsers(int index, String sortBy, String sortOrder) {
        List<User> userList = new ArrayList<>();
        String sql = "SELECT u.[User_Id], u.[Password], u.[User_name], u.[Email], u.[Phone_number], r.[Role_id], r.[Role_Name], u.[Avarta], u.[isBanned], u.[gender] \n"
                + "                FROM [dbo].[User] u\n"
                + "                JOIN\n"
                + "                    [dbo].[Role] r\n"
                + "                ON \n"
                + "                    u.[Role_id] = r.[Role_id]";

        // Add sorting clause
        if ("name".equals(sortBy)) {
            sql += " ORDER BY [User_name] ";
        } else if ("email".equals(sortBy)) {
            sql += " ORDER BY [Email] ";
        } else if ("gender".equals(sortBy)) {
            sql += " ORDER BY [gender] ";
        } else if ("phone".equals(sortBy)) {
            sql += " ORDER BY [Phone_number] ";
        } else {
            sql += " ORDER BY [User_Id] ";
        }

        if ("asc".equals(sortOrder)) {
            sql += "ASC";
        } else if ("desc".equals(sortOrder)) {
            sql += "DESC";
        }
        sql += " OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, (index - 1) * 10);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    int userId = rs.getInt("User_Id");
                    String password = rs.getString("Password");
                    String userName = rs.getString("User_name");
                    String email = rs.getString("Email");
                    String phoneNumber = rs.getString("Phone_number");
                    int roleId = rs.getInt("Role_id");
                    String roleName = rs.getString("Role_Name");
                    String avatar = rs.getString("Avarta");
                    boolean isBanned = rs.getBoolean("isBanned");
                    boolean gender = rs.getBoolean("gender");

                    Role role = new Role(roleId, roleName);
                    User user = new User(userId, password, userName, email, phoneNumber, role, avatar, isBanned, gender);
                    userList.add(user);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;
    }

    public List<User> getAllUsersBySearch(int index, String sortBy, String sortOrder, String search, String SearchBy) {
        List<User> userList = new ArrayList<>();
        String sql = "SELECT u.[User_Id], u.[Password], u.[User_name], u.[Email], u.[Phone_number], r.[Role_id], r.[Role_Name], u.[Avarta], u.[isBanned], u.[gender] \n"
                + "                FROM [dbo].[User] u\n"
                + "                JOIN\n"
                + "                    [dbo].[Role] r\n"
                + "                ON \n"
                + "                    u.[Role_id] = r.[Role_id]";

        if (search != null && !search.isEmpty()) {
            if ("User".equals(SearchBy)) {
                sql += "WHERE u.[User_name] LIKE ? ";
            } else if ("Email".equals(SearchBy)) {
                sql += "WHERE u.[Email] LIKE ? ";
            } else if ("Phone".equals(SearchBy)) {
                sql += "WHERE u.[Phone_number] LIKE ? ";
            }
        }

        if ("name".equals(sortBy)) {
            sql += " ORDER BY [User_name] ";
        } else if ("email".equals(sortBy)) {
            sql += " ORDER BY [Email] ";
        } else if ("gender".equals(sortBy)) {
            sql += " ORDER BY [gender] ";
        } else if ("phone".equals(sortBy)) {
            sql += " ORDER BY [Phone_number] ";
        } else {
            sql += " ORDER BY [User_Id] ";
        }

        if ("asc".equals(sortOrder)) {
            sql += "ASC";
        } else if ("desc".equals(sortOrder)) {
            sql += "DESC";
        } else {
            sql += " ";
        }
        sql += " OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, "%" + search + "%");
            st.setInt(2, (index - 1) * 10);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    int userId = rs.getInt("User_Id");
                    String password = rs.getString("Password");
                    String userName = rs.getString("User_name");
                    String email = rs.getString("Email");
                    String phoneNumber = rs.getString("Phone_number");
                    int roleId = rs.getInt("Role_id");
                    String roleName = rs.getString("Role_Name");
                    String avatar = rs.getString("Avarta");
                    boolean isBanned = rs.getBoolean("isBanned");
                    boolean gender = rs.getBoolean("gender");

                    Role role = new Role(roleId, roleName);
                    User user = new User(userId, password, userName, email, phoneNumber, role, avatar, isBanned, gender);
                    userList.add(user);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return userList;
    }

    public UserDetails getUserById(int userId) {
        UserDetails UD = null;
        User user = null;
        double totalPrice = getTotalPriceByUserId(userId);
        int Order_id = getTotalOrderByUserId(userId);
        List<Order> products = new ArrayList<>();
        String sql = "SELECT u.User_Id, u.Password, u.User_name, u.Email, u.Phone_number,\n"
                + "		r.Role_id, r.Role_Name, u.Avarta, u.isBanned, u.gender,\n"
                + "		o.[Order_id], o.[Product_id], o.[Order_quantity], b.[Bill_id], o.[Real_time_price], o.[Payment],\n"
                + "		b.Total_price,o.Order_id\n"
                + "FROM [dbo].[User] u\n"
                + "LEFT JOIN Bill b ON u.User_Id = b.User_id \n"
                + "LEFT JOIN [Order] o ON b.Bill_Id = o.Bill_id\n"
                + "JOIN [dbo].[Role] r ON u.Role_id = r.Role_id\n"
                + "WHERE u.User_Id = ?\n"
                + "GROUP BY u.User_Id, u.Password, u.User_name, u.Email, u.Phone_number,\n"
                + "		r.Role_id, r.Role_Name, u.Avarta, u.isBanned, u.gender,b.Total_price,o.Order_id,\n"
                + "        o.Product_id, o.Order_quantity,b.Bill_id, o.Real_time_price, o.Payment;";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                String password = rs.getString("Password");
                String userName = rs.getString("User_name");
                String email = rs.getString("Email");
                String phoneNumber = rs.getString("Phone_number");
                int roleId = rs.getInt("Role_id");
                String roleName = rs.getString("Role_Name");
                String avatar = rs.getString("Avarta");
                boolean isBanned = rs.getBoolean("isBanned");
                boolean gender = rs.getBoolean("gender");
                
                do {
                    int productId = rs.getInt("Product_id");
                    int orderId = rs.getInt("Order_id");
                    int BillId = rs.getInt("Bill_id");
                    Date Real_time_price = rs.getDate("Real_time_price");
                    String Payment = rs.getString("Payment");
                    int orderQuantity = rs.getInt("Order_quantity");

                    Order order = new Order(orderId, productId, orderQuantity, BillId, Real_time_price, Payment);
                    products.add(order);

                } while (rs.next());

                Role role = new Role(roleId, roleName);
                user = new User(userId, password, userName, email, phoneNumber, role, avatar, isBanned, gender);

                UD = new UserDetails(totalPrice, user, Order_id, products);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return UD;
    }

    public double getTotalPriceByUserId(int userId) {
        double totalPrice = 0.0;
        String sql = "SELECT SUM(Total_price) AS TotalPrice\n"
                + "FROM [Feds].[dbo].[Bill]\n"
                + "WHERE User_id = ?;";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalPrice = rs.getDouble("TotalPrice");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return totalPrice;
    }

    public int getTotalOrderByUserId(int userId) {
        int totalOrder = 0;
        String sql = "SELECT COUNT(o.[Order_id]) AS TotalOrders\n"
                + "FROM [Feds].[dbo].[Order] o\n"
                + "JOIN [Feds].[dbo].[Bill] b ON o.[Bill_id] = b.[Bill_Id]\n"
                + "WHERE b.[User_id] = ?;";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalOrder = rs.getInt("TotalOrders");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return totalOrder;
    }
    public boolean updateProduct(Product1 product) {
        String sql = "UPDATE Product SET Quantity = ?, Product_name = ?, Product_img = ? WHERE Product_id = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, product.getQuantity());
            st.setString(2, product.getProduct_name());
            st.setString(3, product.getProduct_img());
            st.setInt(4, product.getProduct_id());

            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateProductDetail(ProductDetail detail) {
        String sql = "UPDATE Product_Detail SET RAM = ?, ROM = ?, Size = ?, Battery = ?, Weight = ?, Color = ?, Decription = ?, CPU = ?, Wattage = ?, Status = ? WHERE Product_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, detail.getRam());
            st.setString(2, detail.getRom());
            st.setString(3, detail.getSize());
            st.setString(4, detail.getBattery());
            st.setString(5, detail.getWeight());
            st.setString(6, detail.getColor());
            st.setString(7, detail.getDecription());
            st.setString(8, detail.getCpu());
            st.setString(9, detail.getWattage());
            st.setString(10, detail.getStatus());
            st.setInt(11, detail.getProduct().getProduct_id());

            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updatePrice(Price price) {
        String sql = "UPDATE Price SET Price = ?, Date_start = ?, Date_end = ?, Sale = ? WHERE Product_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setDouble(1, price.getPrice());
            st.setDate(2, new java.sql.Date(price.getDateStart().getTime()));
            st.setDate(3, new java.sql.Date(price.getDateEnd().getTime()));
            st.setInt(4, price.getSale());
            st.setInt(5, price.getProduct().getProduct_id());

            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public void UpdateImg(int productid, String img) {
        String spl = "UPDATE [dbo].[Product]\n"
                + "   SET [Product_img] = ?\n"
                + " WHERE Product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, img);
            st.setInt(2, productid);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        Data_MarketingDashboard_DAO data = new Data_MarketingDashboard_DAO();
//        List<User> Users = data.getAllUsers(1, "id", "asc");
        UserDetails u = data.getUserById(10);

        double totalPrice = u.getTotalPrice();
        User user = u.getUser();
        int totalOrders = u.getTotalOrders();
        List<Order> orders = u.getOrder();
        List<Product1> product = new ArrayList<>();
//        for (User u : Users) {
        System.out.println("User ID: " + user.getUser_Id());
        System.out.println("User Name: " + user.getUser_name());
        System.out.println("Tổng số đơn hàng: " + totalOrders);
        System.out.println("Tổng số tiền đã mua: " + totalPrice);

        for (Order order : orders) {
            Product1 p = data.getProductById(order.getProduct_id());
            if (p != null) { // Kiểm tra nếu p không null
                System.out.println("Product name: " + order.getOrder_quantity());
                product.add(p);
            }
        }

//        }
        System.out.println();
    }
}
