/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.dals;

import vn.fpt.edu.models.User;
import vn.fpt.edu.models.GoogleAcount;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.models.Role;

/**
 *
 * @author admin
 */
public class User_DAO extends DBContext {

    public List<User> getCustomerAll() {
        List<User> list = new ArrayList<>();
        String sql = "	SELECT [User_Id]\n"
                + "		  ,[Password]\n"
                + "		  ,[User_name]\n"
                + "		  ,[Email]\n"
                + "		  ,[Phone_number]\n"
                + "		  ,[Role_id]\n"
                + "		  ,[Avarta]\n"
                + "	  FROM [dbo].[User]\n"
                + "	  where Role_id = 5";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            Role_DAO rd = new Role_DAO();
            while (rs.next()) {
                Role r = rd.getRoleById(rs.getInt("Role_id"));
                User u = new User(rs.getInt("User_Id"), rs.getString("Password"), rs.getString("User_name"), rs.getString("Email"), rs.getString("Phone_number"), r, rs.getString("Avarta"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public void insertCustomer(User u) {
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
            st.setString(1, u.getPassword());
            st.setString(2, u.getUser_name());
            st.setString(3, u.getEmail());
            st.setString(4, u.getPhone_number());
            st.setInt(5, u.getRole().getId());
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

    public User getCustomerByID(int id) {
        String spl = "	SELECT [User_Id]\n"
                + "		  ,[Password]\n"
                + "		  ,[User_name]\n"
                + "		  ,[Email]\n"
                + "		  ,[Phone_number]\n"
                + "		  ,[Role_id]\n"
                + "		  ,[Avarta]\n"
                + "	  FROM [dbo].[User]\n"
                + "  where User_Id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            Role_DAO rd = new Role_DAO();
            if (rs.next()) {
                Role r = rd.getRoleById(rs.getInt("Role_id"));
                User u = new User(rs.getInt("User_Id"), rs.getString("Password"), rs.getString("User_name"), rs.getString("Email"), rs.getString("Phone_number"), r, rs.getString("Avarta"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public User getCustomerByEmail(String email) {
        String spl = "SELECT [User_Id]\n"
                + "		  ,[Password]\n"
                + "		  ,[User_name]\n"
                + "		  ,[Email]\n"
                + "		  ,[Phone_number]\n"
                + "		  ,[Role_id]\n"
                + "		  ,[Avarta]\n"
                + "	  FROM [dbo].[User]\n"
                + "  where Email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            Role_DAO rd = new Role_DAO();
            if (rs.next()) {
                Role r = rd.getRoleById(rs.getInt("Role_id"));
                User u = new User(rs.getInt("User_Id"), rs.getString("Password"), rs.getString("User_name"), rs.getString("Email"), rs.getString("Phone_number"), r, rs.getString("Avarta"));
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

    public void changeImg(String email, String img) {
        String spl = "UPDATE [dbo].[User]\n"
                + "   SET [Avarta] = ?\n"
                + " WHERE Email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, img);
            st.setString(2, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void changeInfor(String username, String email, String phone) {
        String spl = "UPDATE [dbo].[User]\n"
                + "   SET [User_name] = ?\n"
                + "      ,[Phone_number] = ?\n"
                + " WHERE Email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, username);
            st.setString(2, phone);
            st.setString(3, email);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

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
            Role_DAO rd = new Role_DAO();
            if (rs.next()) {
                Role r = rd.getRoleById(rs.getInt("Role_id"));
                User u = new User(rs.getInt("User_Id"), rs.getString("Password"), rs.getString("User_name"), rs.getString("Email"), rs.getString("Phone_number"), r, rs.getString("Avarta"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public String getRoleName(String email) {
        String spl = "select r.Role_Name\n"
                + "from [dbo].[User] as u \n"
                + "join Role as r on u.Role_id = r.Role_Id\n"
                + "where u.Email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public int getTotalNumberOfUsers() {
        int totalNumberOfUsers = 0;
        String sql = "SELECT COUNT(*) AS TotalCount FROM [User];";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalNumberOfUsers = rs.getInt("TotalCount");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return totalNumberOfUsers;
    }
      public int getUserSortCount(String sortBy) {
        int total = 0;
        String sql = "SELECT Count([User_Id]) as Total\n"
                + "  FROM [Feds].[dbo].[User]\n";
        switch(sortBy) {
            case "id":
                sql += " ORDER BY [User_Id]";
                break;
            case "name":
                sql += " ORDER BY [User_name]";
                break;
            case "email":
                sql += " ORDER BY [Email]";
                break;
            case "role":
                sql += " ORDER BY [Role_id]";
                break;
            case "mobile":
                sql += " ORDER BY [Phone_number]";
                break;
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
      
        public List<User> getUserSort(String sortBy, int page) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT [User_Id]\n"
                + "	  ,[Password]\n"
                + "      ,[User_name]\n"
                + "      ,[Email]\n"
                + "      ,[Phone_number]\n"
                + "      ,[Role_id]\n"
                + "      ,[Avarta]\n"
                + "  FROM [Feds].[dbo].[User]\n";
        switch(sortBy) {
            case "id":
                sql += " ORDER BY [User_Id]";
                break;
            case "name":
                sql += " ORDER BY [User_name]";
                break;
            case "email":
                sql += " ORDER BY [Email]";
                break;
            case "role":
                sql += " ORDER BY [Role_id]";
                break;
            case "mobile":
                sql += " ORDER BY [Phone_number]";
                break;
        }
         sql += " OFFSET " + (page-1)*9 + " ROWS FETCH NEXT 9 ROWS ONLY;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            Role_DAO rd = new Role_DAO();
            while (rs.next()) {
                Role r = rd.getRoleById(rs.getInt("Role_id"));
                User u = new User(rs.getInt("User_Id"), rs.getString("Password"), rs.getString("User_name"), rs.getString("Email"), rs.getString("Phone_number"), r, rs.getString("Avarta"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
      
      
}
