package vn.fpt.edu.dals;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.models.Contact;

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
                + "           ,[Message]\n"
                + "           ,[Date])\n"
                + "           ,[Date]\n"
                + "           ,[Status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?, GETDATE(), N'Chưa gửi')";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, user_id);
            st.setString(2, email);
            st.setString(3, suject);
            st.setString(4, phone);
            st.setString(5, message);

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void insertFeedBack2(String name, String email, String suject, String phone, String message) {
        String sql = "INSERT INTO [dbo].[Contact]\n"
                + "           ([Name]\n"
                + "           ,[Email]\n"
                + "           ,[Subject]\n"
                + "           ,[Phone]\n"
                + "           ,[Message]\n"
                + "           ,[Date]\n"
                + "           ,[Status])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?, GETDATE(), N'Chưa gửi')";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, email);
            st.setString(3, suject);
            st.setString(4, phone);
            st.setString(5, message);

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Contact> getAllContact(int pageIndex, int numOfContact) {
        List<Contact> list = new ArrayList<>();
        String sql = "exec PagingContact ?,?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pageIndex);
            st.setInt(2, numOfContact);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Contact u = new Contact(rs.getString("UserName"), rs.getString("Email"), rs.getString("Subject"),
                        rs.getString("Phone"),
                        rs.getString("Message"), rs.getString("Date"), rs.getString("Status"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getNumOfPageContactList(int numOfContactInScreen) {
        int numOfPages = 0;
        String sql = "DECLARE @NumberBillPerPage INT = ?\n"
                + "SELECT CEILING(COUNT(*) * 1.0 / @NumberBillPerPage) AS TotalPages\n"
                + "FROM Contact;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, numOfContactInScreen);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                numOfPages = rs.getInt("TotalPages");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return numOfPages;
    }

    public List<Contact> searchContact(String value) {
        List<Contact> list = new ArrayList<>();

        try {

            String sql = "SELECT TOP (1000) \n"
                    + "u.[User_name] AS [UserName]\n"
                    + "      ,c.[Email]\n"
                    + "      ,[Subject]\n"
                    + "      ,[Phone]\n"
                    + "      ,[Message]\n"
                    + "      ,[Date]\n"
                    + "      ,[Status]\n"
                    + "  FROM Contact c\n"
                    + "  JOIN \n"
                    + "      [User] AS u ON c.[User_Id] = u.[User_id]\n"
                    + "  WHERE  c.Email LIKE ? OR U.User_name LIKE ?  and [Status] != N'Đã gửi' ";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + value + "%");
            ps.setString(2, "%" + value + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Contact c = new Contact(rs.getString("UserName"), rs.getString("Email"), rs.getString("Subject"),
                        rs.getString("Phone"),
                        rs.getString("Message"), rs.getString("Date"), rs.getString("Status"));
                list.add(c);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Contact> getContactAllWithUser() {
        List<Contact> list = new ArrayList<>();
        String sql = "SELECT\n"
                + "               u.[User_name] AS [UserName]\n"
                + "                   ,c.[Email]\n"
                + "                     ,[Subject]\n"
                + "                    ,[Phone]\n"
                + "                   ,[Message]\n"
                + "      ,[Status]\n"
                + "                  ,[Date]\n"
                + "              FROM Contact c\n"
                + "                JOIN \n"
                + "                   [User] AS u ON c.[User_Id] = u.[User_id]\n"
                + "				   ORDER BY \n"
                + "        c.Date Desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Contact c = new Contact(rs.getString("UserName"), rs.getString("Email"), rs.getString("Subject"),
                        rs.getString("Phone"),
                        rs.getString("Message"), rs.getString("Date"), rs.getString("Status"));
                list.add(c);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void upDateRely(String email, String subject, String message) {
        String sql = """
                     UPDATE [dbo].[Contact]
                     SET [Status] = N'\u0110\u00e3 g\u1eedi'
                     WHERE Email = ? and Subject = ? and Message = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, subject);
            st.setString(3, message);

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}



