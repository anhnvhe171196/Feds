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
        String sql = "SELECT [Brand_Name]\n" +
"  FROM [Brandd] GROUP BY Brand_Name ORDER BY Brand_Name";
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
    public List<Brand> getAllBrandWithCate(String[] cateId) {
        List<Brand> list = new ArrayList<>();
        String sql = "SELECT \n" +
"    Brand_Name\n" +
"FROM \n" +
"    Brandd\n" +
"GROUP BY \n" +
"    Brand_Name\n" +
"ORDER BY \n" +
"    MAX(CASE WHEN Category_id IN (";
        if(cateId.length > 0) {
            sql += cateId[0] + ",";
            for(int i = 1; i < cateId.length; i++) {
                sql += cateId[0] + ",";
            }
            sql = sql.substring(0, sql.length() - 1);
        }
        sql += ") THEN 1 ELSE 0 END) DESC, \n" +
"    Brand_Name;";
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
    public int getRelatedBrandSize(String[] cateId) {
        int total = 0;
        String sql = "SELECT Count(distinct [Brand_Name]) as Total\n" +
"  FROM [Brandd]";
        if(cateId.length > 0) {
            sql += " WHERE [Category_id] = " + cateId[0];
            for(int i = 1; i < cateId.length; i++) {
                sql += " OR [Category_id] = " + cateId[0];
            }
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt("Total");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return total;
    }
}
