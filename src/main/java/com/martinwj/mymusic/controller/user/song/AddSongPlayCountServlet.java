package com.martinwj.mymusic.controller.user.song;

import com.martinwj.mymusic.service.SongService;
import com.martinwj.mymusic.service.impl.SongServiceImpl;
import com.martinwj.mymusic.util.ServletUtils;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/19 17:28
 * @version: 1.0
 */
@WebServlet("/addSongPlayCountServlet")
public class AddSongPlayCountServlet extends HttpServlet {

    private SongService songService = null;

    @Override
    public void init() throws ServletException {
        songService = new SongServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String songId = request.getParameter("songId");
        System.out.println("添加歌曲ID为 " + songId + " 的播放数量！");
        // 增加歌曲的播放次数
        songService.addPlayCountBySongId(Integer.parseInt(songId));

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", "ok");
        ServletUtils.sendToPage(response, jsonObject.toString());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
