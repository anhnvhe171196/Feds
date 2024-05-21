/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dals;

import entities.Customer;
import entities.GoogleAcount;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class Customer_DAO extends DBContext {

    public List<Customer> getCustomerAll() {
        List<Customer> list = new ArrayList<>();
        String sql = "SELECT [User_name]\n"
                + "	  ,[Password]\n"
                + "      ,[Email]\n"
                + "      ,[Phone_number]\n"
                + "      ,[Role_id]\n"
                + "      ,[Avarta]\n"
                + "  FROM [Feds].[dbo].[User]\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Customer u = new Customer(rs.getString("User_name"), rs.getString("Password"), rs.getString("Email"), rs.getString("Phone_number"), rs.getInt("Role_id"), rs.getString("Avarta"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertCustomer(Customer u) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([Password]\n"
                + "           ,[User_name]\n"
                + "           ,[Email]\n"
                + "           ,[Phone_number]\n"
                + "           ,[Role_id]\n"
                + "           ,[Avarta])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getPass());
            st.setString(2, u.getUser());
            st.setString(3, u.getEmail());
            st.setString(4, u.getPhone());
            st.setInt(5, 5);
            st.setString(6, u.getAvarta());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertCustomerByGoogleAccount(GoogleAcount u, String pass, String img) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([Password]\n"
                + "           ,[User_name]\n"
                + "           ,[Email]\n"
                + "           ,[Phone_number]\n"
                + "           ,[Role_id]\n"
                + "           ,[Avarta])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, u.getName());
            st.setString(3, u.getEmail());
            st.setString(4, null);
            st.setInt(5, 5);
            st.setString(6, img);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Customer getCustomerByID(int id) {
        String spl = "SELECT [User_name]\n"
                + "	  ,[Password]\n"
                + "      ,[Email]\n"
                + "      ,[Phone_number]\n"
                + "      ,[Role_id]\n"
                + "      ,[Avarta]\n"
                + "  FROM [Feds].[dbo].[User]\n"
                + "  where User_Id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Customer u = new Customer(rs.getString("User_name"), rs.getString("Password"), rs.getString("Email"), rs.getString("Phone_number"), rs.getInt("Role_id"), rs.getString("Avarta"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Customer getCustomerByEmail(String email) {
        String spl = "SELECT [User_name]\n"
                + "	  ,[Password]\n"
                + "      ,[Email]\n"
                + "      ,[Phone_number]\n"
                + "      ,[Role_id]\n"
                + "      ,[Avarta]\n"
                + "  FROM [Feds].[dbo].[User]\n"
                + "  where Email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Customer u = new Customer(rs.getString("User_name"), rs.getString("Password"), rs.getString("Email"), rs.getString("Phone_number"), rs.getInt("Role_id"), rs.getString("Avarta"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void chagePassword(String pass, String email) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [Password] = ?\n"
                + "      \n"
                + " WHERE Email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setString(2, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
