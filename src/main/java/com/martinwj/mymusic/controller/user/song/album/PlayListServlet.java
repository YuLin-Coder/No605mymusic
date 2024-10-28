package com.martinwj.mymusic.controller.user.song.album;

import com.martinwj.mymusic.entity.PageBean;
import com.martinwj.mymusic.entity.Song;
import com.martinwj.mymusic.entity.User;
import com.martinwj.mymusic.service.SongService;
import com.martinwj.mymusic.service.impl.SongServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/17 11:45
 * @version: 1.0
 */
@WebServlet("/playListServlet")
public class PlayListServlet extends HttpServlet {

    private SongService songService = null;

    @Override
    public void init() throws ServletException {
        songService = new SongServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("添加到播放列表");
        String page = request.getParameter("page");

        HttpSession session = request.getSession();
        PageBean<Song> songPage = (PageBean<Song>) session.getAttribute("songPage");
        LinkedHashSet<Song> songPlayList = (LinkedHashSet<Song>) session.getAttribute("songPlayList");
        if(songPlayList == null) {
            songPlayList = new LinkedHashSet<Song>();
        }

        if(songPage != null && (songPage.getList() != null && songPage.getList().size() != 0)) {
            // 添加到默认歌单列表
            songPlayList.addAll(songPage.getList());

            // 增加这些音乐的播放数量
            for(Song song : songPage.getList()) {
                songService.addPlayCountBySongId(song.getSongId());
            }
        }

        session.setAttribute("songPlayList", songPlayList);
        // 重定向到album-single页面
        response.sendRedirect(request.getContextPath() + page);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
