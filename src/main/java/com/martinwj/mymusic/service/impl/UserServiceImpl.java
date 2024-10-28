package com.martinwj.mymusic.service.impl;

import com.martinwj.mymusic.dao.UserDao;
import com.martinwj.mymusic.dao.impl.UserDaoImpl;
import com.martinwj.mymusic.entity.PageBean;
import com.martinwj.mymusic.entity.Song;
import com.martinwj.mymusic.entity.User;
import com.martinwj.mymusic.service.CommonService;
import com.martinwj.mymusic.service.UserService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/16 11:09
 * @version: 1.0
 */
public class UserServiceImpl extends CommonService<User> implements UserService {

    private UserDao userDao = null;

    public UserServiceImpl(){
        userDao = new UserDaoImpl();
    }

    @Override
    public User getUserByUserId(int userId) {
        return userDao.getUserByUserId(userId);
    }

    @Override
    public User getUserByUsername(String username) {
        return userDao.getUserByUsername(username);
    }

    @Override
    public User getUserByName(String name) {
        return userDao.getUserByName(name);
    }

    @Override
    public List<User> getUserByEmail(String email) {
        return userDao.getUserByEmail(email);
    }

    @Override
    public User getUserByPhone(String phone) {
        return userDao.getUserByPhone(phone);
    }

    @Override
    public int addUser(User user) {
        return userDao.addUser(user);
    }

    @Override
    public int delUserByUsername(String username) {
        return userDao.delUserByUsername(username);
    }

    @Override
    public User getUserByLogin(String username, String password) {
        List<String> list = new ArrayList<>();
        list.add(username);
        list.add(password);
        return userDao.getUserByLogin(list.toArray());
    }

    @Override
    public int updateUserActive(String username) {
        return userDao.updateUserActive(username);
    }

    @Override
    public PageBean<User> findUsersByPage(String _currentPage, String _rows, Map<String, String[]> condition) {
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);
        if(currentPage <= 0){
            currentPage = 1;
        }
        int totalCount = Math.toIntExact(userDao.getAllUsersCount(condition));
        int start = (currentPage - 1) * rows;
        List<User> list = userDao.findUsersByPage(start, rows, condition);

        return findByPage(currentPage, rows, condition, totalCount, start, list);
    }

    @Override
    public int getAllUsersCount(Map<String, String[]> condition) {
        return (int) userDao.getAllUsersCount(condition);
    }

    @Override
    public int updateUserPassword(int userId, String newPassword) {
        return userDao.updateUserPassword(userId, newPassword);
    }

    @Override
    public List<Integer> delUserByUserIds(String[] ids) {

        List<Integer> list = new ArrayList<>();
        for (String id : ids) {
            list.add(userDao.delUserByUserId(Integer.parseInt(id)));
        }
        return list;
    }
}
