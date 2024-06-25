/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.dals;

import vn.fpt.edu.models.Order;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Trong
 */
public class Order_DAO extends DBContext {

    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT [Order_id]\n"
                + "      ,[Product_id]\n"
                + "      ,[Order_quantity]\n"
                + "      ,[Bill_id]\n"
                + "      ,[Real_time_price]\n"
                + "      ,[Payment]\n"
                + "  FROM [dbo].[Order]Order";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order u = new Order(rs.getInt("Order_id"), rs.getInt("Product_id"), rs.getInt("Order_quantity"), rs.getInt("Bill_id"), rs.getDate("Real_time_price"), rs.getString("Payment"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getNumOfProductsSold() {
        int numOfProductsSold = 0;
        String sql = "SELECT SUM(Order_quantity) AS TotalProductsSold FROM [Order];";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                numOfProductsSold = rs.getInt("TotalProductsSold");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return numOfProductsSold;
    }
    
    public void updateQuantityProduct(String id) {
        List<Order> list = new ArrayList<>();

        try {
            String sql = "select Order_id, Product_id, Order_quantity, Bill_id\n"
                    + "From [Order]\n"
                    + "where Bill_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order order = new Order();
                order.setOrder_id(rs.getInt(1));
                order.setProduct_id(rs.getInt(2));
                order.setOrder_quantity(rs.getInt(3));
                order.setBill_id(rs.getInt(4));
                list.add(order);
            }
            String sql1 ="update Product set Quantity = Quantity + ? where Product_id = ?";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            for (Order order : list) {
                st1.setInt(1, order.getOrder_quantity());
                st1.setInt(2, order.getProduct_id());
                st1.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    

}
