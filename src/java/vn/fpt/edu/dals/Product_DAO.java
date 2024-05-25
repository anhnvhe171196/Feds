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

/**
 *
 * @author admin
 */
public class Product_DAO extends DBContext{

    public List<Product> getProductByTittle(String strSearch) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE Product_name LIKE ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + strSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product u = new Product(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getInt(6), strSearch);
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
}
