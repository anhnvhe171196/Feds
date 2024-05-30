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
import vn.fpt.edu.models.Product;

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

    public double avgRatingOfProduct(int id) {
        double avg = 0;
        String sql = "select AVG(Rating)\n"
                + "from FeedBack\n"
                + "where Product_id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                avg = rs.getDouble(1);
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
}
