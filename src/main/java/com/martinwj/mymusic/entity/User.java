package com.martinwj.mymusic.entity;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/15 22:16
 * @version: 1.0
 */
public class User {
    // 用户编号
    private int userId;
    // 用户账号
    private String username;
    // 用户密码
    private String password;
    // 用户名称
    private String name;
    // 用户性别
    private int sex;
    // 邮箱
    private String email;
    // 手机
    private String phone;
    // 生日
    private String birth;
    // 用户类型
    private int type;
    // 用户个人签名
    private String sign;
    // 个人头像
    private String avatar;
    // 用户创建日期
    private String createDate;
    // 用户信息更新日期
    private String updateDate;
    // VIP用户，VIP到期日期
    private String vipDate;
    // 用户激活状态
    private int active;

    public User() {
    }

    public User(int userId, String username, String password, String name, int sex, String email, String phone, String birth, int type, String sign, String avatar, String createDate, String updateDate, String vipDate, int active) {
        this.userId = userId;
        this.username = username;
        this.password = password;
        this.name = name;
        this.sex = sex;
        this.email = email;
        this.phone = phone;
        this.birth = birth;
        this.type = type;
        this.sign = sign;
        this.avatar = avatar;
        this.createDate = createDate;
        this.updateDate = updateDate;
        this.vipDate = vipDate;
        this.active = active;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    public String getVipDate() {
        return vipDate;
    }

    public void setVipDate(String vipDate) {
        this.vipDate = vipDate;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId=" + userId +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", sex=" + sex +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", birth='" + birth + '\'' +
                ", type=" + type +
                ", sign='" + sign + '\'' +
                ", avatar='" + avatar + '\'' +
                ", createDate='" + createDate + '\'' +
                ", updateDate='" + updateDate + '\'' +
                ", vipDate='" + vipDate + '\'' +
                ", active=" + active +
                '}';
    }
}
