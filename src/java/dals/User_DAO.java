/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dals;

import entities.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Trong
 */
public class User_DAO extends DBContext{
    public List<User> getUserAll() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT [User_Id]\n"
                + "	  ,[Password]\n"
                + "      ,[User_name]\n"
                + "      ,[Email]\n"
                + "      ,[Phone_number]\n"
                + "      ,[Role_id]\n"
                + "      ,[Avarta]\n"
                + "  FROM [Feds].[dbo].[User]\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt("User_Id"), rs.getString("Password"), rs.getString("User_name"), rs.getString("Email"), rs.getString("Phone_number"), rs.getInt("Role_id"), rs.getString("Avarta"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
}
