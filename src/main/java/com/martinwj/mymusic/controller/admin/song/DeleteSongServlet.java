package com.martinwj.mymusic.controller.admin.song;

import com.martinwj.mymusic.dao.SongDao;
import com.martinwj.mymusic.dao.impl.SongDaoImpl;
import com.martinwj.mymusic.entity.Song;
import com.martinwj.mymusic.service.CommentService;
import com.martinwj.mymusic.service.SongService;
import com.martinwj.mymusic.service.TypeService;
import com.martinwj.mymusic.service.impl.CommentServiceImpl;
import com.martinwj.mymusic.service.impl.SongServiceImpl;
import com.martinwj.mymusic.service.impl.TypeServiceImpl;
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
 * @date: 2020/11/13 14:11
 * @version: 1.0
 */
@WebServlet("/admin/deleteSongServlet")
public class DeleteSongServlet extends HttpServlet {

    private SongService songService = null;
    private TypeService typeService = null;
    private CommentService commentService = null;

    @Override
    public void init() throws ServletException {
        songService = new SongServiceImpl();
        typeService = new TypeServiceImpl();
        commentService = new CommentServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.获取所有id
        String[] ids = request.getParameterValues("songId");
        System.out.println(Arrays.toString(ids));

        // 删除的同时，修改该类别的歌曲数目
        ServletUtils.deleteSong(ids);

        //3.跳转查询所有Servlet
        response.sendRedirect(request.getContextPath()+"/admin/findSongByPageServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
