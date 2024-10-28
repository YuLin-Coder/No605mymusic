package com.martinwj.mymusic.dao.impl;

import com.martinwj.mymusic.dao.CommonDao;
import com.martinwj.mymusic.dao.UserDao;
import com.martinwj.mymusic.entity.User;
import com.martinwj.mymusic.util.JavaBeanUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/16 10:58
 * @version: 1.0
 */
public class UserDaoImpl extends CommonDao<User> implements UserDao {


    @Override
    public User getUserByUsername(String username) {
        String sql = "select * from user where username=?";
        return getBean(sql, username);
    }

    @Override
    public User getUserByName(String name) {
        String sql = "select * from user where name=?";
        return getBean(sql, name);
    }

    @Override
    public List<User> getUserByEmail(String email) {
        String sql = "select * from user where email=?";
        return getBeanList(sql, email);
    }

    @Override
    public User getUserByPhone(String phone) {
        String sql = "select * from user where phone=?";
        return getBean(sql, phone);
    }

    @Override
    public int addUser(User user) {
        String sql = "insert into user values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        return update(sql, JavaBeanUtils.beanToList(user).toArray());
    }

    @Override
    public int delUserByUsername(String username) {
        String sql = "delete from user where username=?";
        return update(sql, username);
    }

    @Override
    public User getUserByLogin(Object[] parms) {
        String sql = "select * from user where username=? and password=?";
        return getBean(sql, parms);
    }

    @Override
    public int updateUserActive(String username) {
        String sql = "update user set active=1 where username=?";
        return update(sql, username);
    }

    @Override
    public User getUserByUserId(int userId) {
        String sql = "select * from user where userId=?";
        return getBean(sql, userId);
    }

    @Override
    public long getAllUsersCount(Map<String, String[]> condition) {
        String sql = "select count(*) from user where 1=1";
        return getAllCount(sql ,condition);
    }

    @Override
    public List<User> findUsersByPage(int start, int rows, Map<String, String[]> condition) {
        String sql = "select * from user where 1=1";
        return findByPage(sql, start, rows, condition);
    }

    @Override
    public int updateUserPassword(int userId, String newPassword) {
        String sql = "update user set password=? where userId=?";
        List<Object> list = new ArrayList<>();
        list.add(newPassword);
        list.add(userId);
        return update(sql, list.toArray());
    }

    @Override
    public Integer delUserByUserId(int id) {
        String sql = "delete from user where userId=?";
        return update(sql, id);
    }
}
