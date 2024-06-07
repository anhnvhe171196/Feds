/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.dals;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.models.BillOrder;

/**
 *
 * @author Trong
 */
public class BillOrder_DAO extends DBContext {

    public List<BillOrder> getBillOrder(int id) {
        List<BillOrder> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "    B.Bill_id, \n"
                + "    P.Product_name, \n"
                + "    PR.Price, \n"
                + "    P.Product_img, \n"
                + "    B.Status,\n"
                + "	O.Payment\n"
                + "FROM \n"
                + "    [Feds].[dbo].[Bill] B\n"
                + "JOIN \n"
                + "    [Feds].[dbo].[Order] O ON B.Bill_id = O.Bill_id\n"
                + "JOIN \n"
                + "    [Feds].[dbo].[Product] P ON O.Product_id = P.Product_id\n"
                + "JOIN \n"
                + "    [Feds].[dbo].[Price] PR ON P.Product_id = PR.Product_id\n"
                + "WHERE \n"
                + "     B.Bill_Id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                BillOrder bo = new BillOrder(rs.getInt("Bill_id"), rs.getString("Product_name"), rs.getDouble("Price"),
                                             rs.getString("Product_img"), rs.getString("Status"), rs.getString("Payment"));
                list.add(bo);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public static void main(String[] args) {
        BillOrder_DAO dao = new BillOrder_DAO();
        int billId = 1; // Thay giá trị này bằng ID của hóa đơn bạn muốn kiểm tra

        List<BillOrder> orders = dao.getBillOrder(billId);

        for (BillOrder order : orders) {
            System.out.println("Bill ID: " + order.getBill_id());
            System.out.println("Product Name: " + order.getProduct_name());
            System.out.println("Price: " + order.getPrice());
            System.out.println("Product Image: " + order.getProduct_img());
;            System.out.println("Status: " + order.getStatus());
            System.out.println("Payment: " + order.getPayment());
            System.out.println("----------");
        }
    }
    
}
