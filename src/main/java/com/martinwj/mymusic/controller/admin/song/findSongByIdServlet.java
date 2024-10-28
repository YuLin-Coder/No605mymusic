package com.martinwj.mymusic.controller.admin.song;

import com.martinwj.mymusic.entity.Song;
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
 * @date: 2020/11/13 17:21
 * @version: 1.0
 */
@WebServlet("/admin/findSongByIdServlet")
public class findSongByIdServlet extends HttpServlet {

    private SongService songService = null;

    @Override
    public void init() throws ServletException {
        songService = new SongServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String songId = request.getParameter("songId");

        JSONObject jsonObject = new JSONObject();

        if(songId == null){
            jsonObject.put("status", "error");
            ServletUtils.sendToPage(response, jsonObject.toString());
        }
        jsonObject.put("status", "ok");
        Song song = songService.getSongById(Integer.parseInt(songId));
        jsonObject.put("song", song);
        ServletUtils.sendToPage(response, jsonObject.toString());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
