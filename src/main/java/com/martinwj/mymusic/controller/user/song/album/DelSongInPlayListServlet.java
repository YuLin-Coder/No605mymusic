package com.martinwj.mymusic.controller.user.song.album;

import com.martinwj.mymusic.entity.PageBean;
import com.martinwj.mymusic.entity.Song;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.LinkedHashSet;
import java.util.List;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/17 16:49
 * @version: 1.0
 */
@WebServlet("/delSongInPlayListServlet")
public class DelSongInPlayListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String songId = request.getParameter("songId");
        String page = request.getParameter("page");
        System.out.println(page);
        int id= Integer.parseInt(songId);

        HttpSession session = request.getSession();
        LinkedHashSet<Song> songPlayList = (LinkedHashSet<Song>) session.getAttribute("songPlayList");

        System.out.println("删除之前：" + songPlayList.size());
        // 从播放列表中移除该音乐
        for(Song song : songPlayList){
            if(song.getSongId() == id) {
                songPlayList.remove(song);
                break;
            }
        }
        System.out.println("删除之后：" + songPlayList.size());
        session.setAttribute("songPlayList", songPlayList);

        // 重定向到album-single页面
        response.sendRedirect(request.getContextPath() + page);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
