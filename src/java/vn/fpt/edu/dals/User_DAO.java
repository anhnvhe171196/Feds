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
import vn.fpt.edu.models.Cart;
import vn.fpt.edu.models.Role;

/**
 *
 * @author admin
 */
public class User_DAO extends DBContext {

    public void banUser(int id, boolean banned) {
        String sql = "UPDATE [User] SET [isBanned] = " + (banned ? 1 : 0)
                + "\n WHERE User_Id = " + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<User> getCustomerAll() {
        List<User> list = new ArrayList<>();
        String sql = "	SELECT [User_Id]\n"
                + "		  ,[Password]\n"
                + "		  ,[User_name]\n"
                + "		  ,[Email]\n"
                + "		  ,[Phone_number]\n"
                + "		  ,[Role_id]\n"
                + "		  ,[Avarta]\n"
                + "      ,[isBanned]\n"
                + "      ,[gender]\n"
                + "	  FROM [dbo].[User]\n"
                + "	  where Role_id = 5";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            Role_DAO rd = new Role_DAO();
            while (rs.next()) {
                Role r = rd.getRoleById(rs.getInt("Role_id"));
                User u = new User(rs.getInt("User_Id"), rs.getString("Password"), rs.getString("User_name"), rs.getString("Email"), rs.getString("Phone_number"), r, rs.getString("Avarta"), rs.getInt("isBanned") == 1, rs.getInt("gender") == 1);
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean insertCustomer(User u) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([Password]\n"
                + "           ,[User_name]\n"
                + "           ,[Email]\n"
                + "           ,[Phone_number]\n"
                + "           ,[Role_id]\n"
                + "           ,[Avarta]\n"
                + "           ,[gender])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM [User] WHERE [User_name] = ? OR [Email] = ?");
            ps.setString(1, u.getUser_name());
            ps.setString(2, u.getEmail());
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                return false;
            }
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getPassword());
            st.setString(2, u.getUser_name());
            st.setString(3, u.getEmail());
            st.setString(4, u.getPhone_number());
            st.setInt(5, u.getRole().getId());
            st.setString(6, u.getAvarta());
            st.setInt(7, u.isGender() ? 1 : 0);
            st.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void updateUser(int id, boolean isBanned, int roleId) {
        String sql = "UPDATE [dbo].[User]\n"
                + "           SET [Role_id] = ?\n"
                + "           ,[isBanned] = ?\n"
                + "WHERE [User_Id] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleId);
            st.setInt(2, isBanned ? 1 : 0);
            st.setInt(3, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void insertCustomerByGoogleAccount(GoogleAcount u, String pass, String img) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([Password]\n"
                + "           ,[User_name]\n"
                + "           ,[Email]\n"
                + "           ,[Phone_number]\n"
                + "           ,[Role_id]\n"
                + "           ,[Avarta]\n"
                + "           ,[gender])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?, 0)";
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
            e.printStackTrace();
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
                + "      ,[isBanned]\n"
                + "      ,[gender]\n"
                + "	  FROM [dbo].[User]\n"
                + "  where User_Id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            Role_DAO rd = new Role_DAO();
            if (rs.next()) {
                Role r = rd.getRoleById(rs.getInt("Role_id"));
                User u = new User(rs.getInt("User_Id"), rs.getString("Password"), rs.getString("User_name"), rs.getString("Email"), rs.getString("Phone_number"), r, rs.getString("Avarta"), rs.getInt("isBanned") == 1, rs.getBoolean("gender"));
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
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
                + "      ,[isBanned]\n"
                + "      ,[gender]\n"
                + "	  FROM [dbo].[User]\n"
                + "  where Email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            Role_DAO rd = new Role_DAO();
            if (rs.next()) {
                Role r = rd.getRoleById(rs.getInt("Role_id"));
                User u = new User(rs.getInt("User_Id"), rs.getString("Password"), rs.getString("User_name"), rs.getString("Email"), rs.getString("Phone_number"), r, rs.getString("Avarta"), rs.getInt("isBanned") == 1, rs.getInt("gender") == 1);
                return u;
            }
        } catch (SQLException e) {
            e.printStackTrace();
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
            e.printStackTrace();
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
            e.printStackTrace();
        }
    }

    public void changeInfor(String username, String email, String phone, boolean gender) {
        String spl = "UPDATE [dbo].[User]\n"
                + "   SET [User_name] = ?\n"
                + "      ,[Phone_number] = ?\n"
                + "      ,[gender] = ?\n"
                + " WHERE Email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setString(1, username);
            st.setString(2, phone);
            st.setBoolean(3, gender);
            st.setString(4, email);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
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
                + "      ,[isBanned]\n"
                + "      ,[gender]\n"
                + "  FROM [Feds].[dbo].[User] WHERE Role_id != 1\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            Role_DAO rd = new Role_DAO();
            if (rs.next()) {
                Role r = rd.getRoleById(rs.getInt("Role_id"));
                User u = new User(rs.getInt("User_Id"), rs.getString("Password"), rs.getString("User_name"), rs.getString("Email"), rs.getString("Phone_number"), r, rs.getString("Avarta"), rs.getInt("isBanned") == 1, rs.getInt("gender") == 1);
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
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
            e.printStackTrace();
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
            e.printStackTrace();
        }
        return totalNumberOfUsers;
    }

    public int Paging(String search, String searchBy) {
        int totalNumberOfUsers = 0;
        String sql = "SELECT COUNT([User_Id]) AS TotalCount FROM [User] u";
        if (search != null && !search.isEmpty()) {
            if ("User".equals(searchBy)) {
                sql += " WHERE u.[User_name] LIKE ?";
            } else if ("Email".equals(searchBy)) {
                sql += " WHERE u.[Email] LIKE ?";
            } else if ("Phone".equals(searchBy)) {
                sql += " WHERE u.[Phone_number] LIKE ?";
            }
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (search != null && !search.isEmpty()) {
                st.setString(1, "%" + search + "%");
            }
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalNumberOfUsers = rs.getInt("TotalCount");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return totalNumberOfUsers;
    }

    public User getCustomerByID(User u) {
        String spl = "select User_Id, User_name, Email, Phone_number\n"
                + "from [User]\n"
                + "Where User_Id = ?";
        User user = null;
        try {
            PreparedStatement st = connection.prepareStatement(spl);
            st.setInt(1, u.getUser_Id());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setUser_Id(rs.getInt(1));
                user.setUser_name(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPhone_number(rs.getString(4));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return user;
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
                + "      ,[isBanned]\n"
                + "      ,[gender]\n"
                + "  FROM [Feds].[dbo].[User] WHERE Role_id != 1\n";
        switch (sortBy) {
            case "ID":
                sql += " ORDER BY [User_Id]";
                break;
            case "Fullname":
                sql += " ORDER BY [User_name]";
                break;
            case "Email":
                sql += " ORDER BY [Email]";
                break;
            case "Role":
                sql += " ORDER BY [Role_id]";
                break;
            case "Mobile":
                sql += " ORDER BY [Phone_number]";
                break;
        }
        sql += " OFFSET " + (page - 1) * 9 + " ROWS FETCH NEXT 9 ROWS ONLY;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            Role_DAO rd = new Role_DAO();
            while (rs.next()) {
                Role r = rd.getRoleById(rs.getInt("Role_id"));
                User u = new User(rs.getInt("User_Id"), rs.getString("Password"), rs.getString("User_name"), rs.getString("Email"), rs.getString("Phone_number"), r, rs.getString("Avarta"), rs.getInt("isBanned") == 1, rs.getInt("gender") == 1);
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getUserCount() {
        int total = 0;
        String sql = "SELECT Count([User_Id]) as Total\n"
                + "  FROM [Feds].[dbo].[User] WHERE Role_id != 1\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt("Total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    public List<User> getUserPage(int page) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT [User_Id]\n"
                + "	  ,[Password]\n"
                + "      ,[User_name]\n"
                + "      ,[Email]\n"
                + "      ,[Phone_number]\n"
                + "      ,[Role_id]\n"
                + "      ,[Avarta]\n"
                + "      ,[isBanned]\n"
                + "      ,[gender]\n"
                + "  FROM [Feds].[dbo].[User] WHERE Role_id != 1 ORDER BY [User_Id] OFFSET " + (page - 1) * 9 + " ROWS FETCH NEXT 9 ROWS ONLY;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            Role_DAO rd = new Role_DAO();
            while (rs.next()) {
                Role r = rd.getRoleById(rs.getInt("Role_id"));
                User u = new User(rs.getInt("User_Id"), rs.getString("Password"), rs.getString("User_name"), rs.getString("Email"), rs.getString("Phone_number"), r, rs.getString("Avarta"), rs.getInt("isBanned") == 1, rs.getInt("gender") == 1);
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getUserSearchCount(String search, String SearchBy) {
        int total = 0;
        String sql = "SELECT Count([User_Id]) as Total\n"
                + "  FROM [Feds].[dbo].[User]\n";
        switch (SearchBy) {
            case "name":
                sql += " WHERE [User_name] LIKE '%" + search + "%'";
                break;
            case "email":
                sql += " WHERE [Email] LIKE '%" + search + "%'";
                break;
            case "mobile":
                sql += " WHERE [Phone_number] LIKE '%" + search + "%'";
                break;
        }
        sql += " AND Role_id != 1";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt("Total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

    public List<User> getUserSearch(String search, String SearchBy, int page) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT [User_Id]\n"
                + "	  ,[Password]\n"
                + "      ,[User_name]\n"
                + "      ,[Email]\n"
                + "      ,[Phone_number]\n"
                + "      ,[Role_id]\n"
                + "      ,[Avarta]\n"
                + "      ,[isBanned]\n"
                + "      ,[gender]\n"
                + "  FROM [Feds].[dbo].[User]\n";
        switch (SearchBy) {
            case "name":
                sql += " WHERE [User_name] LIKE '%" + search + "%'";
                break;
            case "email":
                sql += " WHERE [Email] LIKE '%" + search + "%'";
                break;
            case "mobile":
                sql += " WHERE [Phone_number] LIKE '%" + search + "%'";
                break;
        }
        sql += " AND Role_id != 1";
        sql += " ORDER BY [User_Id] OFFSET " + (page - 1) * 9 + " ROWS FETCH NEXT 9 ROWS ONLY;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            Role_DAO rd = new Role_DAO();
            while (rs.next()) {
                Role r = rd.getRoleById(rs.getInt("Role_id"));
                User u = new User(rs.getInt("User_Id"), rs.getString("Password"), rs.getString("User_name"), rs.getString("Email"), rs.getString("Phone_number"), r, rs.getString("Avarta"), rs.getInt("isBanned") == 1, rs.getInt("gender") == 1);
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<User> getUserSearchAndSort(String search, String SearchBy, String SortBy, int page) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT [User_Id]\n"
                + "	  ,[Password]\n"
                + "      ,[User_name]\n"
                + "      ,[Email]\n"
                + "      ,[Phone_number]\n"
                + "      ,[Role_id]\n"
                + "      ,[Avarta]\n"
                + "      ,[isBanned]\n"
                + "      ,[gender]\n"
                + "  FROM [Feds].[dbo].[User]\n";
        switch (SearchBy) {
            case "name":
                sql += " WHERE [User_name] LIKE '%" + search + "%'";
                break;
            case "email":
                sql += " WHERE [Email] LIKE '%" + search + "%'";
                break;
            case "mobile":
                sql += " WHERE [Phone_number] LIKE '%" + search + "%'";
                break;
        }
        sql += " AND Role_id != 1";
        switch (SortBy) {
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
        sql += " OFFSET " + (page - 1) * 9 + " ROWS FETCH NEXT 9 ROWS ONLY;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            Role_DAO rd = new Role_DAO();
            while (rs.next()) {
                Role r = rd.getRoleById(rs.getInt("Role_id"));
                User u = new User(rs.getInt("User_Id"), rs.getString("Password"), rs.getString("User_name"), rs.getString("Email"), rs.getString("Phone_number"), r, rs.getString("Avarta"), rs.getInt("isBanned") == 1, rs.getInt("gender") == 1);
                list.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int newlyRegistered() {
        int total = 0;
        String sql = "SELECT Count(User_Id) as Total FROM [User] WHERE CreateAt >= getdate() - 7";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt("Total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }

}
