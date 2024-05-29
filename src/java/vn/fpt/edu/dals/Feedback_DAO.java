/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.dals;

import vn.fpt.edu.models.FeedBack;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.models.Bill;
import vn.fpt.edu.models.Product1;
import vn.fpt.edu.models.User;

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


    public List<FeedBack> getFeedbackAllWithUser() {
    List<FeedBack> list = new ArrayList<>();
    String sql = "SELECT F.Comment, F.Date AS FeedbackDate, F.Rating, F.Img, " +
                 "B.Bill_id, B.Total_price, B.Date AS BillDate, B.Address, B.Status, " +
                 "U.User_Id, U.User_name, U.Password, U.Email, U.Phone_number, U.Avarta " +
                 "FROM FeedBack AS F " +
                 "JOIN Bill AS B ON F.Bill_Id = B.Bill_id " +
                 "JOIN [User] AS U ON B.User_Id = U.User_Id";

    try {
        PreparedStatement st = connection.prepareStatement(sql);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            // Tạo đối tượng User
            User user = new User();
            user.setUser_Id(rs.getInt("User_Id"));
            user.setUser_name(rs.getString("User_name"));
            user.setPassword(rs.getString("Password"));
            user.setEmail(rs.getString("Email"));
            user.setPhone_number(rs.getString("Phone_number"));
            user.setAvarta(rs.getString("Avarta"));

            // Tạo đối tượng Bill
            Bill bill = new Bill();
            bill.setBill_id(rs.getInt("Bill_id"));
            bill.setTotal_price(rs.getDouble("Total_price"));
            bill.setDate(rs.getString("BillDate"));
            bill.setAddress(rs.getString("Address"));
            bill.setStatus(rs.getString("Status"));
            bill.setUser(user);

            // Tạo đối tượng Feedback
            FeedBack feedback = new FeedBack();
            feedback.setComment(rs.getString("Comment"));
            feedback.setDate(rs.getDate("FeedbackDate"));
            feedback.setRating(rs.getInt("Rating"));
            feedback.setBill(bill);
            feedback.setImg(rs.getString("Img"));

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

   
}
