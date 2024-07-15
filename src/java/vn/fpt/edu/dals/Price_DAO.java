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
import java.util.Random;
import vn.fpt.edu.models.Price;
import vn.fpt.edu.models.Product1;
import vn.fpt.edu.models.RelatedProducts;

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
                Product1 p1 = p.getProductById(rs.getInt("Product_id"));
                return new Price(rs.getDouble("Price"), rs.getDate("Date_start"), rs.getDate("Date_end"), rs.getInt("Sale"), p1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<RelatedProducts> getListPriceByBrandId(int brand_id, int product_id) {
        List<RelatedProducts> list = new ArrayList<>();
        String sql = "SELECT p.Product_id,\n"
                + "       [Price],\n"
                + "       [Date_start],\n"
                + "       [Date_end],\n"
                + "       [Sale],\n"
                + "       AVG(Rating) AS AvgRating\n"
                + "FROM [dbo].[Price] AS p\n"
                + "JOIN Product AS pd ON pd.Product_id = p.Product_id\n"
                + "JOIN Brandd AS b ON b.Brand_Id = pd.Brand_id\n"
                + "LEFT JOIN FeedBack AS f ON f.Product_id = p.Product_id\n"
                + "WHERE b.Brand_id = ? and p.Product_id != ?\n"
                + "GROUP BY p.Product_id, [Price], [Date_start], [Date_end], [Sale]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, brand_id);
            st.setInt(2, product_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product_DAO p = new Product_DAO();
                Product1 p1 = p.getProductById(rs.getInt(1));

                list.add(new RelatedProducts(rs.getInt(6), rs.getDouble("Price"), rs.getDate("Date_start"), rs.getDate("Date_end"), rs.getInt("Sale"), p1));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

}
