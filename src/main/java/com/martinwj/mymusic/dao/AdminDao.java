package com.martinwj.mymusic.dao;

import com.martinwj.mymusic.entity.Admin;

/**
 * @ClassName: AdminDao
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-08 16:19
 */
public interface AdminDao {

    /**
     * 查找用户名是否存在
     * @param username
     * @return
     */
    String usernameIsExit(String username);

    /**
     * 管理员登录，通过用户输入的用户名密码获取Admin对象。
     * @param admin
     * @return
     */
    Admin getAdmin(Admin admin);

}
