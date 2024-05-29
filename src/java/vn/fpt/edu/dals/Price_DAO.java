/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.dals;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import vn.fpt.edu.models.Brand;
import vn.fpt.edu.models.Category;
import vn.fpt.edu.models.Price;
import vn.fpt.edu.models.Product;

/**
 *
 * @author admin
 */
public class Price_DAO extends DBContext {

    public Price getPriceById(int id) {
        String sql = "SELECT [Product_id]\n"
                + "      ,[Price]\n"
                + "      ,[Date_start]\n"
                + "      ,[Date_end]\n"
                + "      ,[Sale]\n"
                + "  FROM [dbo].[Price]\n"
                + "where Product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product_DAO p = new Product_DAO();
                Product p1 = p.getProductById(rs.getInt("Product_id"));
                return new Price(rs.getDouble("Price"), rs.getDate("Date_start"), rs.getDate("Date_start"), p1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
