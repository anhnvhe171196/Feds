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

    public List<Bill> getBillAll() {
        List<Bill> list = new ArrayList<>();
        String sql = "SELECT [Bill_id]\n"
                + "	  ,[Total_price]\n"
                + "      ,[Date]\n"
                + "      ,[User_id]\n"
                + "      ,[Address]\n"
                + "      ,[Status]\n"
                + "  FROM [Feds].[dbo].[Bill]\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Bill u = new Bill(rs.getInt("Bill_Id"), rs.getDouble("Total_price"), rs.getDate("Date"), rs.getInt("User_id"), rs.getString("Address"), rs.getString("Status"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

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
                Bill u = new Bill(rs.getInt("Bill_Id"), rs.getDouble("Total_price"), rs.getDate("Date"), rs.getInt("User_id"), rs.getString("Address"), rs.getString("Status"), rs.getString("User_name"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public static void main(String[] args) {
        // Tạo một đối tượng Bill_DAO
        Bill_DAO billDAO = new Bill_DAO();
        
        // Gọi phương thức getBillAllWithUser để lấy danh sách Bill cùng với thông tin User
        List<Bill> billList = billDAO.getBillAllWithUser();
        
        // In ra danh sách các Bill đã lấy được
        for (Bill bill : billList) {
            System.out.println("Bill ID: " + bill.getBill_id());
            System.out.println("Total Price: " + bill.getTotal_price());
            System.out.println("Date: " + bill.getDate());
            System.out.println("User ID: " + bill.getUser_id());
            System.out.println("Address: " + bill.getAddress());
            System.out.println("Status: " + bill.getStatus());
            System.out.println("User Name: " + bill.getUser_name());
            System.out.println("-----------------------------");
        }
    }
}
