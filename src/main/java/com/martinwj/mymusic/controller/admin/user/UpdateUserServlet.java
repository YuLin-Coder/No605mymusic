package com.martinwj.mymusic.controller.admin.user;

import com.martinwj.mymusic.entity.User;
import com.martinwj.mymusic.service.UserService;
import com.martinwj.mymusic.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/18 16:05
 * @version: 1.0
 */
@WebServlet("/admin/updateUserServlet")
public class UpdateUserServlet extends HttpServlet {

    private UserService userService = null;

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        String oldPassword = request.getParameter("old_password_" + userId);
        String newPassword = request.getParameter("update_password_" + userId);

        System.out.println("修改密码：" + oldPassword + "  :  " + newPassword);
        if(!newPassword.equals(oldPassword)) {
            // 调用service 修改密码
            int flag = userService.updateUserPassword(Integer.parseInt(userId), newPassword);
        }

        // 跳转查询所有Servlet
        response.sendRedirect(request.getContextPath()+"/admin/showUsersByPageServlet");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
