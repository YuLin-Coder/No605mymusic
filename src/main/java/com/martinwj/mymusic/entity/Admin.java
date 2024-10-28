package com.martinwj.mymusic.entity;

/**
 * @ClassName: Admin
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-06 20:29
 */
public class Admin {
    private int adminId;
    private String username;
    private String password;
    private String adminName;
    private String userType;

    public Admin() {
    }

    public Admin(int adminId, String username, String password, String adminName, String userType) {
        this.adminId = adminId;
        this.username = username;
        this.password = password;
        this.adminName = adminName;
        this.userType = userType;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminId=" + adminId +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", adminName='" + adminName + '\'' +
                ", userType='" + userType + '\'' +
                '}';
    }
}
