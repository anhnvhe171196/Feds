/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.dals;

import vn.fpt.edu.models.Feedback1;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.models.Bill;
import vn.fpt.edu.models.FeedBack;
import vn.fpt.edu.models.Product1;

/**
 *
 * @author Trong
 */
public class Feedback_DAO extends DBContext {

    public int getNumOfFeedbackCurrentDate() {
        int numOfFeedback = 0;
        String sql = "SELECT COUNT(*) AS NumberOfFeedbacks \n"
                + "FROM [Feds].[dbo].[FeedBack] \n"
                + "WHERE CONVERT(DATE, [Date]) = CONVERT(DATE, GETDATE());";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                numOfFeedback = rs.getInt("NumberOfFeedbacks");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return numOfFeedback;

    }

    public int getTotalNumberOfFeedbacks() {
        int totalNumberOfFeedbacks = 0;
        String sql = "SELECT COUNT(*) AS TotalCount FROM Feedback;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                totalNumberOfFeedbacks = rs.getInt("TotalCount");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return totalNumberOfFeedbacks;
    }

    public List<Feedback1> getFeedbackAllWithUser() {
        List<Feedback1> list = new ArrayList<>();
        String sql = "SELECT F.*, U.User_name\n"
                + "FROM FeedBack AS F\n"
                + "JOIN [User] AS U ON F.User_Id = U.User_Id\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback1 feedback = new Feedback1();
                feedback.setFeedbackId(rs.getInt("Feedback_Id"));
                feedback.setTotalPrice(rs.getDouble("Total_price"));
                feedback.setDate(rs.getString("Date"));
                feedback.setUserId(rs.getInt("User_id"));
                feedback.setAddress(rs.getString("Address"));
                feedback.setStatus(rs.getString("Status"));
                feedback.setUserName(rs.getString("User_name"));
                list.add(feedback);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getNumberOrderUser(int id, String status) {
        int numberOrder = 0;
        String sql = "select count(b.Feedback_Id)\n"
                + "from Feedback as b \n"
                + "where b.Status = ? and b.User_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                numberOrder = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return numberOrder;
    }

    public int getTotalOrderUser(int id) {
        int numberOrder = 0;
        String sql = "select count(b.Feedback_Id)\n"
                + "from Feedback as b \n"
                + "where b.User_id = ? and Status != N'Hoàn Thành'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                numberOrder = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return numberOrder;
    }

    public double getSumOfFeedbackByUserId(int id) {
        double sumOfFeedback = 0;
        String sql = "SELECT SUM(Total_price) AS TotalFeedback\n"
                + "FROM Feedback\n"
                + "WHERE User_id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                sumOfFeedback = rs.getDouble("TotalFeedback");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return sumOfFeedback;
    }

    public int avgRatingOfProduct(int id) {
        int avg = 0;
        String sql = "select AVG(Rating)\n"
                + "from FeedBack\n"
                + "where Product_id = ? and Rating != 0;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                avg = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return avg;
    }

    public int totalFeedBackOfProductById(int id) {
        int avg = 0;
        String sql = "select count(f.Comment)\n"
                + "from FeedBack as f\n"
                + "where Product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                avg = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return avg;
    }

    public List<FeedBack> feedBacksByProductID(int product_id) {
        List<FeedBack> list = new ArrayList<>();
        String sql = "SELECT [Product_id]\n"
                + "      ,[Comment]\n"
                + "      ,[Date]\n"
                + "      ,[Rating]\n"
                + "      ,[Bill_Id]\n"
                + "      ,[Img]\n"
                + "  FROM [dbo].[FeedBack]\n"
                + "  where Product_id = ?\n"
                + "  order by Date desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, product_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Bill_DAO b1 = new Bill_DAO();
                Bill b = b1.getBillByID(rs.getInt("Bill_Id"));
                Product_DAO pd = new Product_DAO();
                Product1 p1 = pd.getProductById(rs.getInt("Product_id"));
                list.add(new FeedBack(p1, rs.getString("Comment"), rs.getDate("Date"), rs.getInt("Rating"), b, rs.getString("Img")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int totalPageOfFeedBackByProductID(int pageIndex, int pageNumber, int productId) {
        int avg = 0;
        String sql = "DECLARE @NumberOfPages INT;\n"
                + "EXEC TotalPageOfFeedBack @PageIndex = ?, @PageNumber = ?, @ProductID = ?,\n"
                + " @NumberOfPages = @NumberOfPages OUTPUT;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pageIndex);
            st.setInt(2, pageNumber);
            st.setInt(3, productId);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                avg = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return avg;
    }

    public List<FeedBack> feedBacksByProductIDSQL(int pageIndex, int pageNumber, int productId) {
        List<FeedBack> list = new ArrayList<>();
        String sql = "exec PagingOfFeedBack ?, ?, ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pageIndex);
            st.setInt(2, pageNumber);
            st.setInt(3, productId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Bill_DAO b1 = new Bill_DAO();
                Bill b = b1.getBillByID(rs.getInt(5));
                Product_DAO pd = new Product_DAO();
                Product1 p1 = pd.getProductById(rs.getInt(1));
                list.add(new FeedBack(p1, rs.getString(2), rs.getDate(3), rs.getInt(4), b, rs.getString(6)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int numberOfRatingByStart(int rating, int productId) {
        int avg = 0;
        String sql = "SELECT count(Rating)\n"
                + "  FROM [dbo].[FeedBack]\n"
                + "  where Rating = ? and Product_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, rating);
            st.setInt(2, productId);

            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                avg = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return avg;
    }

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

    public List<Feedback1> getAllFeedbackPagingSQL(int pageIndex, int numOfFeedback) {
        List<Feedback1> list = new ArrayList<>();
        String sql = "exec PagingFeedback ?,?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pageIndex);
            st.setInt(2, numOfFeedback);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback1 f = new Feedback1(rs.getInt("Feedback_Id"), rs.getString("Date"), rs.getString("User_name"), rs.getInt("Rating"), rs.getInt("FeedbackCount"), rs.getString("Product_name"));
                list.add(f);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback1> getFeedbackAllWithUserSortByDate(String type) {
        List<Feedback1> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    FB.Feedback_Id,\n"
                + "    FB.Date AS Date,\n"
                + "    FB.Rating,\n"
                + "    P.Product_name,\n"
                + "    U.User_name AS User_name,\n"
                + "    COALESCE(FBCounts.Review_Count, 0) AS FeedbackCount\n"
                + "FROM \n"
                + "    [Feds].[dbo].[FeedBack] FB\n"
                + "JOIN \n"
                + "    [Feds].[dbo].[Product] P ON FB.Product_id = P.Product_id\n"
                + "JOIN \n"
                + "    [Feds].[dbo].[Bill] B ON FB.Bill_Id = B.Bill_Id\n"
                + "JOIN \n"
                + "    [Feds].[dbo].[User] U ON B.User_id = U.User_Id\n"
                + "LEFT JOIN (\n"
                + "    SELECT \n"
                + "        Product_id,\n"
                + "        COUNT(*) AS Review_Count\n"
                + "    FROM \n"
                + "        [Feds].[dbo].[FeedBack]\n"
                + "    GROUP BY \n"
                + "        Product_id\n"
                + ") AS FBCounts ON FB.Product_id = FBCounts.Product_id\n"
                + "ORDER BY \n"
                + "    FB.Date " + type + ";";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback1 f = new Feedback1(rs.getInt("Feedback_Id"), rs.getString("Date"), rs.getString("User_name"), rs.getInt("Rating"), rs.getInt("FeedbackCount"), rs.getString("Product_name"));
                list.add(f);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback1> getFeedbackAllWithUser1() {
        List<Feedback1> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    FB.Feedback_Id,\n"
                + "    FB.Date AS Date,\n"
                + "    FB.Rating,\n"
                + "    P.Product_name,\n"
                + "    U.User_name AS User_name,\n"
                + "    COALESCE(FBCounts.Review_Count, 0) AS FeedbackCount\n"
                + "FROM \n"
                + "    [Feds].[dbo].[FeedBack] FB\n"
                + "JOIN \n"
                + "    [Feds].[dbo].[Product] P ON FB.Product_id = P.Product_id\n"
                + "JOIN \n"
                + "    [Feds].[dbo].[Bill] B ON FB.Bill_Id = B.Bill_Id\n"
                + "JOIN \n"
                + "    [Feds].[dbo].[User] U ON B.User_id = U.User_Id\n"
                + "LEFT JOIN (\n"
                + "    SELECT \n"
                + "        Product_id,\n"
                + "        COUNT(*) AS Review_Count\n"
                + "    FROM \n"
                + "        [Feds].[dbo].[FeedBack]\n"
                + "    GROUP BY \n"
                + "        Product_id\n"
                + ") AS FBCounts ON FB.Product_id = FBCounts.Product_id\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback1 f = new Feedback1(rs.getInt("Feedback_Id"), rs.getString("Date"), rs.getString("User_name"), rs.getInt("Rating"), rs.getInt("FeedbackCount"), rs.getString("Product_name"));
                list.add(f);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback1> getFeedbackAllWithUserSortByRating(String type) {
        List<Feedback1> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    FB.Feedback_Id,\n"
                + "    FB.Date AS Date,\n"
                + "    FB.Rating,\n"
                + "    P.Product_name,\n"
                + "    U.User_name AS User_name,\n"
                + "    COALESCE(FBCounts.Review_Count, 0) AS FeedbackCount\n"
                + "FROM \n"
                + "    [Feds].[dbo].[FeedBack] FB\n"
                + "JOIN \n"
                + "    [Feds].[dbo].[Product] P ON FB.Product_id = P.Product_id\n"
                + "JOIN \n"
                + "    [Feds].[dbo].[Bill] B ON FB.Bill_Id = B.Bill_Id\n"
                + "JOIN \n"
                + "    [Feds].[dbo].[User] U ON B.User_id = U.User_Id\n"
                + "LEFT JOIN (\n"
                + "    SELECT \n"
                + "        Product_id,\n"
                + "        COUNT(*) AS Review_Count\n"
                + "    FROM \n"
                + "        [Feds].[dbo].[FeedBack]\n"
                + "    GROUP BY \n"
                + "        Product_id\n"
                + ") AS FBCounts ON FB.Product_id = FBCounts.Product_id\n"
                + "ORDER BY \n"
                + "    FB.Rating " + type + ";";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback1 f = new Feedback1(rs.getInt("Feedback_Id"), rs.getString("Date"), rs.getString("User_name"), rs.getInt("Rating"), rs.getInt("FeedbackCount"), rs.getString("Product_name"));
                list.add(f);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback1> getFeedbackAllWithUserSortByFeedbackID(String type) {
        List<Feedback1> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    FB.Feedback_Id,\n"
                + "    FB.Date AS Date,\n"
                + "    FB.Rating,\n"
                + "    P.Product_name,\n"
                + "    U.User_name AS User_name,\n"
                + "    COALESCE(FBCounts.Review_Count, 0) AS FeedbackCount\n"
                + "FROM \n"
                + "    [Feds].[dbo].[FeedBack] FB\n"
                + "JOIN \n"
                + "    [Feds].[dbo].[Product] P ON FB.Product_id = P.Product_id\n"
                + "JOIN \n"
                + "    [Feds].[dbo].[Bill] B ON FB.Bill_Id = B.Bill_Id\n"
                + "JOIN \n"
                + "    [Feds].[dbo].[User] U ON B.User_id = U.User_Id\n"
                + "LEFT JOIN (\n"
                + "    SELECT \n"
                + "        Product_id,\n"
                + "        COUNT(*) AS Review_Count\n"
                + "    FROM \n"
                + "        [Feds].[dbo].[FeedBack]\n"
                + "    GROUP BY \n"
                + "        Product_id\n"
                + ") AS FBCounts ON FB.Product_id = FBCounts.Product_id\n"
                + "ORDER BY \n"
                + "   Feedback_Id  " + type + ";";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Feedback1 f = new Feedback1(rs.getInt("Feedback_Id"), rs.getString("Date"), rs.getString("User_name"), rs.getInt("Rating"), rs.getInt("FeedbackCount"), rs.getString("Product_name"));
                list.add(f);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Feedback1> searchFeedback(String value) {
        List<Feedback1> list = new ArrayList<>();
        try {
            String sql = """
                         SELECT                   FB.Feedback_Id,
                                                  FB.Date AS Date,
                                                  FB.Rating,
                                                  P.Product_name,
                                                  U.User_name AS User_name,
                                                  COALESCE(FBCounts.Review_Count, 0) AS FeedbackCount
                                              FROM 
                                                  [Feds].[dbo].[FeedBack] FB
                                              JOIN 
                                                  [Feds].[dbo].[Product] P ON FB.Product_id = P.Product_id
                                              JOIN 
                                                  [Feds].[dbo].[Bill] B ON FB.Bill_Id = B.Bill_Id
                                              JOIN 
                                                  [Feds].[dbo].[User] U ON B.User_id = U.User_Id
                                              LEFT JOIN (
                                                  SELECT 
                                                      Product_id,
                                                      COUNT(*) AS Review_Count
                                                  FROM 
                                                      [Feds].[dbo].[FeedBack]
                                                  GROUP BY 
                                                      Product_id
                                              ) AS FBCounts ON FB.Product_id = FBCounts.Product_id
                                              WHERE U.User_name LIKE ? 
                      OR P.Product_name LIKE ? 
                      OR FB.Date LIKE ?;""";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + value + "%");
            ps.setString(2, "%" + value + "%");
            ps.setString(3, "%" + value + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feedback1 f = new Feedback1(rs.getInt("Feedback_Id"), rs.getString("Date"), rs.getString("User_name"), rs.getInt("Rating"), rs.getInt("FeedbackCount"), rs.getString("Product_name"));
                list.add(f);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getNumOfPageFeedbackLists(int numOfFeedbackInScreen) {
        int numOfPages = 0;
        String sql = "DECLARE @NumberFeedbackPerPage INT = ?\n"
                + "SELECT CEILING(COUNT(*) * 1.0 / @NumberFeedbackPerPage) AS TotalPages\n"
                + "FROM Feedback;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, numOfFeedbackInScreen);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                numOfPages = rs.getInt("TotalPages");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return numOfPages;
    }

    public int getNumOfPageBillList(int i) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
