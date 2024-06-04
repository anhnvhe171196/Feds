/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.dals;

import vn.fpt.edu.models.Bill1;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.models.Bill;

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

    public List<Bill1> getSumRevenueByDay(String startDate, String endDate) {
        List<Bill1> list = new ArrayList<>();
        String sql = "SELECT\n"
                + "    Date AS Ngay,\n"
                + "    SUM(Total_price) AS TongTien\n"
                + "FROM\n"
                + "    [Feds].[dbo].[Bill]\n"
                + "WHERE\n"
                + "    Date BETWEEN ? AND ?\n"
                + "    AND Status = 'Hoàn Thành'\n"
                + "GROUP BY\n"
                + "    Date\n"
                + "ORDER BY\n"
                + "    Date ASC;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, startDate);
            st.setString(2, endDate);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                Bill1 bill = new Bill1();
                bill.setDate(rs.getString(1));

                bill.setTotal_price(rs.getInt(2));
                list.add(bill);

            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getSumOfDoneBill() {
        int sumOfDoneBill = 0;
        String sql = "SELECT SUM(Total_price) AS Sum \n"
                + "FROM [Feds].[dbo].[Bill] \n"
                + "WHERE Status = 'Hoàn Thành' AND CONVERT(DATE, [Date]) = CONVERT(DATE, GETDATE());";
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

    public List<Bill1> getBillAllWithUserToday() {
        List<Bill1> list = new ArrayList<>();
        String sql = "SELECT Bill.*, U.User_name\n"
                + "FROM Bill\n"
                + "JOIN [User] AS U ON Bill.User_Id = U.User_Id\n"
                + "WHERE CONVERT(date, Bill.Date) = CONVERT(date, GETDATE());"; // Sử dụng GETDATE() để lấy ngày hiện tại
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Bill1 u = new Bill1(rs.getInt("Bill_Id"), rs.getDouble("Total_price"), rs.getString("Date"), rs.getInt("User_id"), rs.getString("Address"), rs.getString("Status"), rs.getString("User_name"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Bill1> getBillAllWithUser() {
        List<Bill1> list = new ArrayList<>();
        String sql = "SELECT Bill.*, U.User_name\n"
                + "FROM Bill\n"
                + "JOIN [User] AS U ON Bill.User_Id = U.User_Id\n";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Bill1 u = new Bill1(rs.getInt("Bill_Id"), rs.getDouble("Total_price"), rs.getString("Date"), rs.getInt("User_id"), rs.getString("Address"), rs.getString("Status"), rs.getString("User_name"));
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

    public int getNumberOrderUser(int id, String status) {
        int numberOrder = 0;
        String sql = "select count(b.Bill_Id)\n"
                + "from Bill as b \n"
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
        String sql = "select count(b.Bill_Id)\n"
                + "from Bill as b \n"
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

    public double getSumOfBillByUserId(int id) {
        double sumOfDoneBill = 0;
        String sql = "SELECT SUM(Total_price)\n"
                + "FROM Bill\n"
                + "WHERE User_id = ? and Status != N'Hoàn Thành';";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                sumOfDoneBill = rs.getDouble(1);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return sumOfDoneBill;
    }

    public Bill getBillByID(int bill_id) {
        String sql = "SELECT [Bill_Id]\n"
                + "      ,[Total_price]\n"
                + "      ,[Date]\n"
                + "      ,[User_id]\n"
                + "      ,[Address]\n"
                + "      ,[Status]\n"
                + "  FROM [dbo].[Bill]\n"
                + "  where Bill_Id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, bill_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User_DAO u = new User_DAO();
                return new Bill(rs.getInt("Bill_Id"), rs.getDouble("Total_price"), rs.getDate("Date"), rs.getString("Address"), rs.getString("Status"), u.getCustomerByID(rs.getInt("User_id")));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Bill1> searchBills(String value) {
        List<Bill1> list = new ArrayList<>();
        try {

            String sql = "SELECT Bill.*, U.User_name FROM Bill JOIN [User] AS U ON Bill.User_Id = U.User_Id "
                    + "WHERE Bill.Bill_Id LIKE ? OR U.User_name LIKE ?  OR Bill.Status LIKE ? OR Bill.Address LIKE ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "%" + value + "%");
            ps.setString(2, "%" + value + "%");
            ps.setString(3, "%" + value + "%");
            ps.setString(4, "%" + value + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Bill1 u = new Bill1(rs.getInt(1), rs.getDouble(2), rs.getString(3), rs.getInt(4),
                        rs.getString(5), rs.getString(6), rs.getString(7));
                list.add(u);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Bill1> getBillAllWithUserSortByValue(String type) {
        List<Bill1> list = new ArrayList<>();
        String sql = "SELECT Bill.*, U.User_name\n"
                + "FROM Bill\n"
                + "JOIN [User] AS U ON Bill.User_Id = U.User_Id\n"
                + "ORDER BY Bill.Total_price " + type + ";";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Bill1 u = new Bill1(rs.getInt("Bill_Id"), rs.getDouble("Total_price"), rs.getString("Date"),
                        rs.getInt("User_id"), rs.getString("Address"), rs.getString("Status"), rs.getString("User_name"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Bill1> getBillAllWithUserPagingSQL(int pageIndex, int numOfBill) {
        List<Bill1> list = new ArrayList<>();
        String sql = "exec PagingBill ?,?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, pageIndex);
            st.setInt(2, numOfBill);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Bill1 u = new Bill1(rs.getInt(1), rs.getDouble(2), rs.getString(3), rs.getInt(4),
                        rs.getString(5), rs.getString(6), rs.getString(7));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public int getNumOfPageBillList(int numOfBillInScreen) {
        int numOfPages = 0;
        String sql = "DECLARE @NumberBillPerPage INT = ?\n"
                + "SELECT CEILING(COUNT(*) * 1.0 / @NumberBillPerPage) AS TotalPages\n"
                + "FROM Bill;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, numOfBillInScreen);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                numOfPages = rs.getInt("TotalPages");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return numOfPages;
    }

    public List<Bill1> getBillAllWithUserSortByDate(String type) {
        List<Bill1> list = new ArrayList<>();
        String sql = "SELECT Bill.*, U.User_name\n"
                + "FROM Bill\n"
                + "JOIN [User] AS U ON Bill.User_Id = U.User_Id\n"
                + "ORDER BY Bill.Date " + type + ";";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Bill1 u = new Bill1(rs.getInt("Bill_Id"), rs.getDouble("Total_price"), rs.getString("Date"),
                        rs.getInt("User_idf"), rs.getString("Address"), rs.getString("Status"), rs.getString("User_name"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Bill1> getBillAllWithUserSortByBillId(String type) {
        List<Bill1> list = new ArrayList<>();
        String sql = "SELECT Bill.*, U.User_name\n"
                + "FROM Bill\n"
                + "JOIN [User] AS U ON Bill.User_Id = U.User_Id\n"
                + "ORDER BY Bill.Bill_Id " + type + ";";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Bill1 u = new Bill1(rs.getInt("Bill_Id"), rs.getDouble("Total_price"), rs.getString("Date"),
                        rs.getInt("User_id"), rs.getString("Address"), rs.getString("Status"), rs.getString("User_name"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
            
        }
        return list;
    }
    
    
    
    
}
