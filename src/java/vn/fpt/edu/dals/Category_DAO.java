/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.dals;

import vn.fpt.edu.models.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author admin
 */
public class Category_DAO extends DBContext {

    
    public List<Category> getAllCate() {
        List<Category> list = new ArrayList<>();
        String sql = "Select Category_id, Category_name\n"
                + "From Product_Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category u = new Category(rs.getInt(1), rs.getString(2));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public HashMap<Category, Integer> getAllCateWithStock() {
        HashMap<Category, Integer> list = new HashMap<>();
        String sql = "Select Category_id, Category_name, (Select Sum(Product.Quantity) FROM Product join Brandd on Product.Brand_id = Brandd.Brand_Id WHERE Brandd.Category_id = [Product_Category].Category_id) as Total From Product_Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category u = new Category(rs.getInt(1), rs.getString(2));
                list.put(u, rs.getInt("Total"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public HashMap<Category, Integer> getAllCateWithCount() {
        HashMap<Category, Integer> list = new HashMap<>();
        String sql = "Select Category_id, Category_name, (Select Count(Product.Product_id) FROM Product join Brandd on Product.Brand_id = Brandd.Brand_Id WHERE Brandd.Category_id = [Product_Category].Category_id) as Total\n"
                + "From Product_Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Category u = new Category(rs.getInt(1), rs.getString(2));
                list.put(u, rs.getInt("Total"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Category getCateByID(int id) {
        String sql = "SELECT [Category_id]\n"
                + "      ,[Category_name]\n"
                + "  FROM [dbo].[Product_Category]\n"
                + "  where Category_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Category(rs.getInt(1), rs.getString(2));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

}
