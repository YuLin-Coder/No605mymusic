package com.martinwj.mymusic.controller.admin.singer;

import com.martinwj.mymusic.entity.Song;
import com.martinwj.mymusic.service.SingerService;
import com.martinwj.mymusic.service.SongService;
import com.martinwj.mymusic.service.impl.SingerServiceImpl;
import com.martinwj.mymusic.service.impl.SongServiceImpl;
import com.martinwj.mymusic.util.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/14 11:00
 * @version: 1.0
 */
@WebServlet("/admin/deleteSingerServlet")
public class DeleteSingerServlet extends HttpServlet {

    private SingerService singerService = null;
    private SongService songService = null;

    @Override
    public void init() throws ServletException {
        singerService = new SingerServiceImpl();
        songService = new SongServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.获取所有id
        String[] ids = request.getParameterValues("singerId");
        System.out.println(Arrays.toString(ids));

        for(String id : ids) {
            // 删除歌曲是先删除其歌曲信息
            List<Song> list = songService.getSongBySingerId(Integer.parseInt(id));
            for (Song song : list) {
                ServletUtils.deleteSong(song.getSongId());
            }
        }

        // 2.调用service删除 歌手信息
        List<Integer> list = singerService.deleteSingerBySingerId(ids);

        //3.跳转查询所有Servlet
        response.sendRedirect(request.getContextPath()+"/admin/findSingerByPageServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
