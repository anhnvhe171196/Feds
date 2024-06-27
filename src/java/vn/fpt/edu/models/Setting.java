/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package vn.fpt.edu.models;

/**
 *
 * @author TGDD
 */
public class Setting {
    Role role;
    boolean view;
    boolean buy;
    boolean feedback;
    boolean sell;
    boolean edit;
    boolean delete;
    boolean create;

    public Setting(Role role, boolean view, boolean buy, boolean feedback, boolean sell, boolean edit, boolean delete, boolean create) {
        this.role = role;
        this.view = view;
        this.buy = buy;
        this.feedback = feedback;
        this.sell = sell;
        this.edit = edit;
        this.delete = delete;
        this.create = create;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public boolean isView() {
        return view;
    }

    public void setView(boolean view) {
        this.view = view;
    }

    public boolean isBuy() {
        return buy;
    }

    public void setBuy(boolean buy) {
        this.buy = buy;
    }

    public boolean isFeedback() {
        return feedback;
    }

    public void setFeedback(boolean feedback) {
        this.feedback = feedback;
    }

    public boolean isSell() {
        return sell;
    }

    public void setSell(boolean sell) {
        this.sell = sell;
    }

    public boolean isEdit() {
        return edit;
    }

    public void setEdit(boolean edit) {
        this.edit = edit;
    }

    public boolean isDelete() {
        return delete;
    }

    public void setDelete(boolean delete) {
        this.delete = delete;
    }

    public boolean isCreate() {
        return create;
    }

    public void setCreate(boolean create) {
        this.create = create;
    }
}
