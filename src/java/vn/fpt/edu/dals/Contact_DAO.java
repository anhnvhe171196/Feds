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

    public void insertFeedBack(int productId, String comment, int Rating, int billId, String img) {
        String sql = "INSERT INTO [dbo].[FeedBack]\n"
                + "           ([Product_id]\n"
                + "           ,[Comment]\n"
                + "           ,[Date]\n"
                + "           ,[Rating]\n"
                + "           ,[Bill_Id]\n"
                + "           ,[Img])\n"
                + "     VALUES\n"
                + "           (?, ?, GETDATE(), ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, productId);
            st.setString(2, comment);
            st.setInt(3, Rating);
            st.setInt(4, billId);
            st.setString(5, img);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
}
