/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dals;

import entities.Order;
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
        try{ 
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Order u = new Order(rs.getInt("Order_id"), rs.getInt("Product_id"), rs.getInt("Order_quantity"), rs.getInt("Bill_id"), rs.getDate("Real_time_price"), rs.getString("Payment"));
                list.add(u);
            }
        }catch(SQLException e){ 
            System.out.println(e);
        }
        return list;
    }
    
    
}
