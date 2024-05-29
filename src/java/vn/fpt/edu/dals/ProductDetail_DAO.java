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
import vn.fpt.edu.models.Product1;
import vn.fpt.edu.models.ProductDetail;

/**
 *
 * @author admin
 */
public class ProductDetail_DAO extends DBContext {

    public ProductDetail getProductDetailById(int productId) {
        String sql = "SELECT [Product_id]\n"
                + "      ,[RAM]\n"
                + "      ,[ROM]\n"
                + "      ,[Size]\n"
                + "      ,[Battery]\n"
                + "      ,[Weight]\n"
                + "      ,[Color]\n"
                + "      ,[Decription]\n"
                + "      ,[CPU]\n"
                + "      ,[Wattage]\n"
                + "      ,[Status]\n"
                + "  FROM [dbo].[Product_Detail]\n"
                + "  where Product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Product_DAO pd = new Product_DAO();
                Product p = pd.getProductById(rs.getInt("Product_id"));
                return new ProductDetail(rs.getString("RAM"), rs.getString("RAM"), rs.getString("RAM"), rs.getString("RAM"), rs.getString("RAM"), rs.getString("RAM"),
                        rs.getString("RAM"), rs.getString("RAM"), rs.getString("RAM"), rs.getString("RAM"), p);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
