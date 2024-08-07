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
        String sql = """
                     INSERT INTO [dbo].[Contact]
                                ([User_Id]
                                ,[Email]
                                ,[Subject]
                                ,[Phone]
                                ,[Message]
                                ,[Date]
                                ,[Status])
                          VALUES
                                (?,?,?,?,?, GETDATE(), N'Chưa gửi')""";
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
        String sql = """
                     INSERT INTO [dbo].[Contact]
                                ([Name]
                                ,[Email]
                                ,[Subject]
                                ,[Phone]
                                ,[Message]
                                ,[Date]
                                ,[Status])
                          VALUES
                                (?,?,?,?,?, GETDATE(), N'Chưa gửi')""";
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
                Contact u = new Contact(rs.getString("Contact_id"), rs.getString("UserName"), rs.getString("Email"), rs.getString("Subject"),
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

            String sql = """
                         SELECT c.Contact_id,
                                 c.[User_Id],
                                 c.Email,
                                 c.Phone,
                                 c.Subject,
                                 c.Message,
                                 c.Date,
                                 c.Status,
                                 CASE 
                                     WHEN c.[User_Id] IS NULL THEN c.[Name]
                                     ELSE COALESCE(u.[User_name], 'Unknown')
                                 END AS [Username]
                         FROM 
                                 Contact AS c
                             LEFT JOIN 
                                 [User] AS u ON c.[User_id] = u.[User_id]
                             
                         WHERE c.Email LIKE ? OR c.Phone LIKE ?
                         ORDER BY 
                                 c.[Contact_id] desc """;
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + value + "%");
            ps.setString(2, "%" + value + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Contact c = new Contact(rs.getString("Contact_id"), rs.getString("UserName"), rs.getString("Email"), rs.getString("Subject"),
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
        String sql = """
                     SELECT
                                                  c.Contact_id,
                                     c.[User_Id],
                                     c.Email,
                                     c.Phone,
                                     c.Subject,
                                     c.Message,
                                     c.Date,
                                     c.Status,
                                     CASE 
                                         WHEN c.[User_Id] IS NULL THEN c.[Name]
                                         ELSE COALESCE(u.[User_name], 'Unknown')
                                     END AS [Username]
                                                         FROM 
                                     Contact AS c
                                 LEFT JOIN 
                                     [User] AS u ON c.[User_id] = u.[User_id]
                                 ORDER BY 
                                     c.[Contact_id] desc""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Contact c = new Contact(rs.getString("Contact_id"), rs.getString("UserName"), rs.getString("Email"), rs.getString("Subject"),
                        rs.getString("Phone"),
                        rs.getString("Message"), rs.getString("Date"), rs.getString("Status"));
                list.add(c);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void upDateRely(int contact_id) {
        String sql = """
                     UPDATE [dbo].[Contact]
                     SET [Status] = N'Đã gửi'
                     WHERE Contact_id = ? """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, contact_id);

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
