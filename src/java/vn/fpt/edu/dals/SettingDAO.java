/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.dals;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import vn.fpt.edu.models.Role;
import vn.fpt.edu.models.Setting;

/**
 *
 * @author TGDD
 */
public class SettingDAO extends DBContext {
    public ArrayList<Setting> getAllSettings(int page, int itemCount) {
        ArrayList<Setting> arr = new ArrayList();
        String sql = "SELECT settings.*, [Role].Role_Name FROM settings join [Role] on settings.Role_Id = [Role].Role_Id ORDER BY Role_Id OFFSET ? ROWS FETCH NEXT ? ROW ONLY;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (page-1)*itemCount);
            st.setInt(2, itemCount);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role r = new Role(rs.getInt("Role_Id"), rs.getString("Role_Name"));
                arr.add(new Setting(r, rs.getInt("View") == 1, rs.getInt("Buy") == 1, rs.getInt("Feedback") == 1, rs.getInt("Sell") == 1, rs.getInt("Edit") == 1, rs.getInt("Delete") == 1, rs.getInt("Create") == 1));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return arr;
    }
    
    public ArrayList<Setting> getAllSettingSort(int page, int itemCount, String sort, String type) {
        ArrayList<Setting> arr = new ArrayList();
        String sql = "SELECT settings.*, [Role].Role_Name FROM settings join [Role] on settings.Role_Id = [Role].Role_Id ORDER BY "+sort+" "+type+" OFFSET ? ROWS FETCH NEXT ? ROW ONLY;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, (page-1)*itemCount);
            st.setInt(2, itemCount);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role r = new Role(rs.getInt("Role_Id"), rs.getString("Role_Name"));
                arr.add(new Setting(r, rs.getInt("View") == 1, rs.getInt("Buy") == 1, rs.getInt("Feedback") == 1, rs.getInt("Sell") == 1, rs.getInt("Edit") == 1, rs.getInt("Delete") == 1, rs.getInt("Create") == 1));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return arr;
    }
    
    public int allSettingsCount() {
        int total = 0;
        String sql = "SELECT Count(settings.Role_Id) as Count FROM settings";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt("Count");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return total;
    }
    
    public ArrayList<Setting> getSearchSettings(int page, int itemCount, String search) {
        ArrayList<Setting> arr = new ArrayList();
        String sql = "SELECT settings.*, [Role].Role_Name FROM settings join [Role] on settings.Role_Id = [Role].Role_Id WHERE [Role].Role_Name LIKE ? ORDER BY Role_Id OFFSET ? ROWS FETCH NEXT ? ROW ONLY;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%"+search+"%");
            st.setInt(2, (page-1)*itemCount);
            st.setInt(3, itemCount);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role r = new Role(rs.getInt("Role_Id"), rs.getString("Role_Name"));
                arr.add(new Setting(r, rs.getInt("View") == 1, rs.getInt("Buy") == 1, rs.getInt("Feedback") == 1, rs.getInt("Sell") == 1, rs.getInt("Edit") == 1, rs.getInt("Delete") == 1, rs.getInt("Create") == 1));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return arr;
    }
    
    public ArrayList<Setting> getSearchSettingSort(int page, int itemCount, String search, String sort, String type) {
        ArrayList<Setting> arr = new ArrayList();
        String sql = "SELECT settings.*, [Role].Role_Name FROM settings join [Role] on settings.Role_Id = [Role].Role_Id WHERE [Role].Role_Name LIKE ? ORDER BY "+sort+" "+type+" OFFSET ? ROWS FETCH NEXT ? ROW ONLY;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%"+search+"%");
            st.setInt(2, (page-1)*itemCount);
            st.setInt(3, itemCount);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role r = new Role(rs.getInt("Role_Id"), rs.getString("Role_Name"));
                arr.add(new Setting(r, rs.getInt("View") == 1, rs.getInt("Buy") == 1, rs.getInt("Feedback") == 1, rs.getInt("Sell") == 1, rs.getInt("Edit") == 1, rs.getInt("Delete") == 1, rs.getInt("Create") == 1));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return arr;
    }
    
    public int searchSettingsCount(String search) {
        int total = 0;
        String sql = "SELECT Count(settings.Role_Id) as Count FROM settings join [Role] on settings.Role_Id = [Role].Role_Id WHERE [Role].Role_Name LIKE ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%"+search+"%");
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                total = rs.getInt("Count");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return total;
    }
}
