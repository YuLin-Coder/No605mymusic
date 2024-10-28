package com.martinwj.mymusic.controller.user.song.album;

import com.martinwj.mymusic.entity.PageBean;
import com.martinwj.mymusic.entity.Song;
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
 * @date: 2020/11/17 16:59
 * @version: 1.0
 */
@WebServlet("/addMusicToPlayListServlet")
public class AddMusicToPlayListServlet extends HttpServlet {

    private SongService songService = null;

    @Override
    public void init() throws ServletException {
        songService = new SongServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("向播放列表增加一首歌曲");
        String songId = request.getParameter("songId");
        String page = request.getParameter("page");
        Song song = songService.getSongById(Integer.parseInt(songId));

        HttpSession session = request.getSession();
        LinkedHashSet<Song> songPlayList = (LinkedHashSet<Song>) session.getAttribute("songPlayList");

        if(songPlayList == null) {
            songPlayList = new LinkedHashSet<Song>();
        }

        // 判断列表是否已经存在该歌曲
        boolean flag = true;
        for(Song s : songPlayList) {
            if(s.getSongId() == song.getSongId())
                flag = false;
        }
        // flag为true，则说明播放列表中不存在该歌曲。
        if(flag) {
            songPlayList.add(song);
        }

        // 增加播放数量
        songService.addPlayCountBySongId(song.getSongId());

        //
        session.setAttribute("songPlayList", songPlayList);

        // 重定向到album-single页面
        response.sendRedirect(request.getContextPath() + page);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
