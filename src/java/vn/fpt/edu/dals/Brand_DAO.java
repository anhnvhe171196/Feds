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
import vn.fpt.edu.models.Category;
import vn.fpt.edu.models.Product1;

/**
 *
 * @author admin
 */
public class Brand_DAO extends DBContext {

    public Brand getBrandById(int id) {
        String sql = "SELECT [Category_id]\n"
                + "      ,[Brand_Name]\n"
                + "      ,[Brand_Id]\n"
                + "  FROM [dbo].[Brandd]\n"
                + "where Brand_Id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Category_DAO cd = new Category_DAO();
                Category c = cd.getCateByID(rs.getInt("Category_id"));
                return new Brand(rs.getInt("Brand_Id"), rs.getString("Brand_Name"), c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public List<Brand> getAllBrand() {
        List<Brand> list = new ArrayList<>();
        String sql = "SELECT distinct [Brand_Name]\n" +
"  FROM [Brandd]";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Brand u = new Brand(rs.getString("Brand_Name"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
