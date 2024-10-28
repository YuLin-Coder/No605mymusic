package com.martinwj.mymusic.controller.comment;

import com.martinwj.mymusic.entity.User;
import com.martinwj.mymusic.service.CommentService;
import com.martinwj.mymusic.service.impl.CommentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/18 11:20
 * @version: 1.0
 */
@WebServlet("/user/person/addCommentMusicServlet")
public class AddCommentMusicServlet extends HttpServlet {

    private CommentService commentService = null;

    @Override
    public void init() throws ServletException {
        commentService = new CommentServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取表单参数
        String commentMsg = request.getParameter("commentMsg");
        String songId = request.getParameter("songId");
        String songName = request.getParameter("songName");
        // 获取用户信息
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        // 如果用户未登录，则跳转到让用户登陆的界面
        if(user == null) {
            request.setCharacterEncoding("utf-8");
            System.out.println("用户未登录！");
            request.setAttribute("titleMsg", "哎呀！");
            request.setAttribute("textMsg", "出了些问题，您还没进行登录，请登录后再试");
            String url = request.getContextPath() + "/page/user/login.jsp";
            request.setAttribute("urlMsg", url);
            request.setAttribute("pageMsg", "登录");
            request.setAttribute("codeMsg", "");
            request.getRequestDispatcher("/page/user/message.jsp").forward(request, response);
            return;
        }

        int userId = user.getUserId();
        String username = user.getName();

        // 调用service添加到数据库
        int flag = commentService.addComment(userId, username, songId, songName, commentMsg);

        // 重定向到comment-music.jsp页面
        response.sendRedirect(request.getContextPath() + "/commentMusicServlet?songId=" + songId);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
