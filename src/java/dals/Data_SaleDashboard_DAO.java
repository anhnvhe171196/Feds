/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dals;

import entities.Bill;
import java.time.LocalDate;
import entities.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import java.util.List;

/**
 *
 * @author Trong
 */
public class Data_SaleDashboard_DAO extends DBContext {

    public List<Product> getSellingProduct(String startDate, String endDate, int numberOfTop) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT TOP (?)\n"
                + "    pc.Category_name,\n"
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
                product.setCategory_name(rs.getString(1));
                product.setProduct_name(rs.getString(2));
                product.setQuantity(rs.getInt(3));
                list.add(product);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Bill> getSumRevenueByDay(String startDate, String endDate) {
        List<Bill> list = new ArrayList<>();
        String sql = "SELECT\n"
                + "    Date AS Ngay,\n"
                + "    SUM(Total_price) AS TongTien\n"
                + "FROM\n"
                + "    [Feds].[dbo].[Bill]\n"
                + "WHERE\n"
                + "    Date BETWEEN ? AND ?\n"
                + "    AND Status = 'Done'\n"
                + "GROUP BY\n"
                + "    Date\n"
                + "ORDER BY\n"
                + "    Date ASC;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            
            st.setString(1, startDate);
            st.setString(2, endDate);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Bill bill = new Bill();
                bill.setDate(rs.getString(1));
                
                bill.setTotal_price(rs.getInt(2));
                list.add(bill);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {

        Data_SaleDashboard_DAO dao = new Data_SaleDashboard_DAO();

        List<Bill> productList = dao.getSumRevenueByDay("2024-04-01", "2024-05-30");

        for (Bill product : productList) {
            System.out.println("Product Date: " + product.getDate() + ", Quantity: " + product.getTotal_price());
        }
    }
}
