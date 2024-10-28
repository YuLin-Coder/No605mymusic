package com.martinwj.mymusic.controller.user;

import com.martinwj.mymusic.entity.User;
import com.martinwj.mymusic.service.UserService;
import com.martinwj.mymusic.service.impl.UserServiceImpl;
import com.martinwj.mymusic.util.CodeUtils;
import com.martinwj.mymusic.util.DateUtils;
import com.martinwj.mymusic.util.EmailUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.util.Date;
import java.util.Map;
import java.util.Random;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/16 10:47
 * @version: 1.0
 */
@WebServlet("/user/registerServlet")
public class RegisterServlet extends HttpServlet {

    private UserService userService = null;

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取参数
        Map<String, String[]> params = request.getParameterMap();

        // 默认给一个头像
        Random random = new Random();
        String pic = "page/user/assets/img/demo/u" + (random.nextInt(13) + 1) + ".png";

        User user = new User();
        user.setUsername(params.get("username")[0]);
        user.setName(params.get("name")[0]);
        user.setEmail(params.get("email")[0]);
        user.setPassword(params.get("password")[0]);
        user.setSex(0);
        user.setType(0);
        Date date = new Date();
        String dateString = DateUtils.getDateString(date);
        user.setCreateDate(dateString);
        user.setUpdateDate(dateString);
        user.setActive(0);
        user.setAvatar(pic);

        int i = userService.addUser(user);
        if(i > 0) {
            String code = CodeUtils.getStringRandom(6);
            request.getSession().setAttribute("code", code);
            String contextPath = request.getContextPath();
            System.out.println("contextPath: " + contextPath);
            System.out.println("code: " + code);
            EmailUtils.sendMessage(request, user.getUsername(), code, user.getEmail());
            request.setAttribute("titleMsg", "注册成功！");
            request.setAttribute("textMsg", "请前往填写的邮箱激活！");
            String url = request.getContextPath() + "/page/user/login.jsp";
            request.setAttribute("urlMsg", url);
            request.setAttribute("pageMsg", "登陆");
            request.setAttribute("codeMsg", "");
        } else {
            request.setAttribute("titleMsg", "注册失败！");
            request.setAttribute("textMsg", "哎呀！<br>出了些问题，您要的页面不见了，请稍后再试");
            String url = request.getContextPath() + "/page/user/register.jsp";
            request.setAttribute("urlMsg", url);
            request.setAttribute("pageMsg", "注册");
            request.setAttribute("codeMsg", "404");
        }
        request.getRequestDispatcher("/page/user/message.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
