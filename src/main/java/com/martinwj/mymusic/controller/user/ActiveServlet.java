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
 * @date: 2020/11/16 15:15
 * @version: 1.0
 */
@WebServlet("/user/activeServlet")
public class ActiveServlet extends HttpServlet {

    private UserService userService = null;

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String codeParm = request.getParameter("code");
        String username = request.getParameter("username");
        String code = (String) request.getSession().getAttribute("code");
        User user = userService.getUserByUsername(username);

        if (user != null && user.getActive() == 0) {
            if (code == null || code == "") {
                if(userService.delUserByUsername(username) > 0){
                    request.setAttribute("titleMsg", "哎呀！");
                    request.setAttribute("textMsg", "出了些问题。您要找的页面不见了");
                    String url = request.getContextPath() + "/page/user/register.jsp";
                    request.setAttribute("urlMsg", url);
                    request.setAttribute("pageMsg", "注册");
                    request.setAttribute("codeMsg", "404");
                } else {
                    request.setAttribute("titleMsg", "激活失败！");
                    request.setAttribute("textMsg", "用户信息激活时间间隔过长，用户信息已失效，请重新注册！");
                    String url = request.getContextPath() + "/page/user/register.jsp";
                    request.setAttribute("urlMsg", url);
                    request.setAttribute("pageMsg", "注册");
                    request.setAttribute("codeMsg", "");
                }
            }
            else if(code.equals(codeParm)) {
                // 修改用户激活状态
                if(userService.updateUserActive(username) > 0) {
                    request.setAttribute("titleMsg", "激活成功！");
                    request.setAttribute("textMsg", "您已经登陆成功啦，请前往登陆吧！");
                    String url = request.getContextPath() + "/page/user/login.jsp";
                    request.setAttribute("urlMsg", url);
                    request.setAttribute("pageMsg", "登陆");
                    request.setAttribute("codeMsg", "");
                } else {
                    request.setAttribute("titleMsg", "哎呀！");
                    request.setAttribute("textMsg", "出了些问题。您要找的页面不见了");
                    String url = request.getContextPath() + "/page/user/register.jsp";
                    request.setAttribute("urlMsg", url);
                    request.setAttribute("pageMsg", "注册");
                    request.setAttribute("codeMsg", "404");
                }
            } else {
                request.setAttribute("titleMsg", "哎呀！");
                request.setAttribute("textMsg", "出了些问题。您要找的页面不见了");
                String url = request.getContextPath() + "/page/user/register.jsp";
                request.setAttribute("urlMsg", url);
                request.setAttribute("pageMsg", "注册");
                request.setAttribute("codeMsg", "404");
            }
        } else {
            request.setAttribute("titleMsg", "哎呀！");
            request.setAttribute("textMsg", "出了些问题。您要激活的用户信息不存在，请重新注册吧");
            String url = request.getContextPath() + "/page/user/register.jsp";
            request.setAttribute("urlMsg", url);
            request.setAttribute("pageMsg", "注册");
            request.setAttribute("codeMsg", "");
        }
        request.getRequestDispatcher("/page/user/message.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
