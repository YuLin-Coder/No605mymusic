package com.martinwj.mymusic.controller.user;

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
 * @date: 2020/11/16 15:41
 * @version: 1.0
 */
@WebServlet("/user/loginServlet")
public class LoginServlet extends HttpServlet {

    private UserService userService = null;

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userService.getUserByLogin(username, password);
        if(user == null) {
            request.setAttribute("titleMsg", "登陆失败！");
            request.setAttribute("textMsg", "哎呀！<br>出了些问题，您要的页面不见了，请稍后再试");
            String url = request.getContextPath() + "/page/user/login.jsp";
            request.setAttribute("urlMsg", url);
            request.setAttribute("pageMsg", "登陆");
            request.setAttribute("codeMsg", "404");
            request.getRequestDispatcher("/page/user/message.jsp").forward(request, response);
        } else if(user.getActive() == 0) {
            request.setAttribute("titleMsg", "登陆失败！");
            request.setAttribute("textMsg", "哎呀！<br>小主，您还没有进行邮箱激活呢，请激活后再试！");
            String url = request.getContextPath() + "/page/user/login.jsp";
            request.setAttribute("urlMsg", url);
            request.setAttribute("pageMsg", "登陆");
            request.setAttribute("codeMsg", "");
            request.getRequestDispatcher("/page/user/message.jsp").forward(request, response);
        } else if(user.getActive() == 1) {
            // 登陆成功，跳转到主页
            // 将用户信息存入session
            request.getSession().setAttribute("user", user);
            response.sendRedirect(request.getContextPath() + "/page/user/index.jsp");
        } else {
            request.setAttribute("titleMsg", "哎呀！");
            request.setAttribute("textMsg", "出了些问题，您要的页面不见了，请稍后再试");
            String url = request.getContextPath() + "/page/user/login.jsp";
            request.setAttribute("urlMsg", url);
            request.setAttribute("pageMsg", "登陆");
            request.setAttribute("codeMsg", "404");
            request.getRequestDispatcher("/page/user/message.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
