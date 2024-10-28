package com.martinwj.mymusic.dao.impl;

import com.martinwj.mymusic.dao.AdminDao;
import com.martinwj.mymusic.dao.BaseDao;
import com.martinwj.mymusic.entity.Admin;
import org.junit.Test;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * @ClassName: AdminDaoImpl
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-08 16:19
 */
public class AdminDaoImpl extends BaseDao<Admin> implements AdminDao {

    @Override
    public String usernameIsExit(String username) {
        String sql = "select username from admin where username=?";
        return (String) getValue(sql, username);
    }

    @Override
    public Admin getAdmin(Admin admin) {
        String sql = "select * from admin where username=? and password=?";
        return getBean(sql, admin.getUsername(), admin.getPassword());
    }

    @Test
    public void test(){
        Admin admin = new Admin(1, "admin", "admin", null, null);
        System.out.println(getAdmin(admin));
        System.out.println(usernameIsExit("admin"));
    }
}
