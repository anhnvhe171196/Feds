/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.dals;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author admin
 */
public class Contact_DAO extends DBContext {

    public void insertFeedBack(int user_id, String email, String suject, String phone, String message) {
        String sql = "INSERT INTO [dbo].[Contact]\n"
                + "           ([User_Id]\n"
                + "           ,[Email]\n"
                + "           ,[Subject]\n"
                + "           ,[Phone]\n"
                + "           ,[Message])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (user_id == 0) {
                st.setString(1, null);
            } else {
                st.setInt(1, user_id);
            }
            st.setString(2, email);
            st.setString(3, suject);
            st.setString(4, phone);
            st.setString(5, message);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

}
