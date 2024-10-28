package com.martinwj.mymusic.service;

import com.martinwj.mymusic.entity.Admin;

/**
 * @ClassName: AdminService
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-09 15:32
 */
public interface AdminService {

    /**
     * 获取用户名是否存在
     * @param username
     * @return
     */
    String usernameIsExit(String username);

    /**
     * 封装admin，并去Dao层获取该管理员账号信息
     * @param usernmae
     * @param password
     * @return
     */
    Admin getAdmin(String usernmae, String password);
}
