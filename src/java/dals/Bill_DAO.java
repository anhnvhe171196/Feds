/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dals;

import entities.Bill;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Trong
 */
public class Bill_DAO extends DBContext {

    public int getNumOfBillCurrentDate() {
        int numOfBill = 0;
        String sql = "SELECT COUNT(*) AS NumberOfBills \n"
                + "FROM [Feds].[dbo].[Bill] \n"
                + "WHERE CONVERT(DATE, [Date]) = CONVERT(DATE, GETDATE());";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                numOfBill = rs.getInt("NumberOfBills");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return numOfBill;
    }

    public int getSumOfDoneBill() {
        int sumOfDoneBill = 0;
        String sql = "SELECT SUM(Total_price) AS Sum \n"
                + "FROM [Feds].[dbo].[Bill] \n"
                + "WHERE Status = 'Done' AND CONVERT(DATE, [Date]) = CONVERT(DATE, GETDATE());";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                sumOfDoneBill = rs.getInt("Sum");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return sumOfDoneBill;
    }

    public List<Bill> getBillAllWithUser() {
        List<Bill> list = new ArrayList<>();
        String sql = "SELECT Bill.*, U.User_name\n"
                + "FROM Bill\n"
                + "JOIN [User] AS U ON Bill.User_Id = U.User_Id;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Bill u = new Bill(rs.getInt("Bill_Id"), rs.getDouble("Total_price"), rs.getString("Date"), rs.getInt("User_id"), rs.getString("Address"), rs.getString("Status"), rs.getString("User_name"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public double getSumOfBillByMonth(int month) {
    double sumOfDoneBill = 0;
    String sql = "SELECT SUM(Total_price) AS TongTienBanDuoc\n"
            + "FROM Bill\n"
            + "WHERE MONTH(Date) = ?;";
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setInt(1, month);
        ResultSet rs = st.executeQuery();
        while (rs.next()) {
            sumOfDoneBill = rs.getDouble("TongTienBanDuoc");
        }
    } catch (SQLException e) {
        System.out.println(e);
    }
    return sumOfDoneBill;
}


    public static void main(String[] args) {
        // Tạo một đối tượng Bill_DAO
        Bill_DAO billDAO = new Bill_DAO();
        double a = billDAO.getSumOfBillByMonth(5);
        List<Bill> billList = billDAO.getBillAllWithUser();

        // In ra danh sách các Bill đã lấy được
        System.out.println(a);

        }
    }

