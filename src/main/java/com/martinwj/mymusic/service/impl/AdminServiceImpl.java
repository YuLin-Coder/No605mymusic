package com.martinwj.mymusic.service.impl;

import com.martinwj.mymusic.dao.AdminDao;
import com.martinwj.mymusic.dao.impl.AdminDaoImpl;
import com.martinwj.mymusic.entity.Admin;
import com.martinwj.mymusic.service.AdminService;

/**
 * @ClassName: AdminServiceImpl
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-09 15:34
 */
public class AdminServiceImpl implements AdminService {

    // Dao层对象的引用
    private AdminDao adminDao = null;

    public AdminServiceImpl(){
        adminDao = new AdminDaoImpl();
    }

    @Override
    public String usernameIsExit(String username) {
        return adminDao.usernameIsExit(username);
    }

    @Override
    public Admin getAdmin(String usernmae, String password) {
        // 封装admin对象
        Admin admin = new Admin(0, usernmae, password, null, null);
        return adminDao.getAdmin(admin);
    }
}
