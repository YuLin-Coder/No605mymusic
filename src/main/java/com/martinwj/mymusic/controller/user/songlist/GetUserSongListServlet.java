package com.martinwj.mymusic.controller.user.songlist;

import com.martinwj.mymusic.service.SongListService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/18 14:46
 * @version: 1.0
 */
@WebServlet("/user/person/getUserSongListServlet")
public class GetUserSongListServlet extends HttpServlet {

    private SongListService songListService = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 

        // 重定向到个人资料
        response.sendRedirect(request.getContextPath() + "/page/user/person/profile.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
