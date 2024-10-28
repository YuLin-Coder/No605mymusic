package com.martinwj.mymusic.dao;

import com.martinwj.mymusic.entity.User;

import java.util.List;
import java.util.Map;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/16 10:57
 * @version: 1.0
 */
public interface UserDao {

    /**
     * 根据登陆账号判断当前账号是否已经被注册
     * @param username
     * @return
     */
    User getUserByUsername(String username);

    /**
     * 根据用户名判断，用户名不能重名，查找当前用户名是否已经被使用
     * @param name
     * @return
     */
    User getUserByName(String name);

    /**
     * 根据邮箱判断当前邮箱绑定的用户个数
     * 邮箱账号不唯一
     * 如果绑定的个数大于3，则不能再绑定
     * @param email
     * @return
     */
    List<User> getUserByEmail(String email);

    /**
     * 查找该手机是否已经被绑定，手机号唯一绑定，因为可以用手机号登陆
     * @param phone
     * @return
     */
    User getUserByPhone(String phone);

    /**
     * 添加用户
     * @param user
     * @return
     */
    int addUser(User user);

    /**
     * 通过用户名删除用户信息
     * @param username
     * @return
     */
    int delUserByUsername(String username);

    /**
     * 用户登陆，用过账号密码查找用户信息
     * @param parms
     * @return
     */
    User getUserByLogin(Object[] parms);

    /**
     * 更新用户状态
     * @param username
     * @return
     */
    int updateUserActive(String username);

    /**
     * 根据UserID获取User信息
     * @param userId
     * @return
     */
    User getUserByUserId(int userId);

    /**
     * 根据条件获取所有用户数
     * @param condition
     * @return
     */
    long getAllUsersCount(Map<String, String[]> condition);

    /**
     * 分页拿到当前页数据
     * @param start
     * @param rows
     * @param condition
     * @return
     */
    List<User> findUsersByPage(int start, int rows, Map<String, String[]> condition);

    /**
     * 修改密码
     * @param newPassword
     * @return
     */
    int updateUserPassword(int userId, String newPassword);

    /**
     * 根据ID删除用户信息
     * @param id
     * @return
     */
    Integer delUserByUserId(int id);
}
