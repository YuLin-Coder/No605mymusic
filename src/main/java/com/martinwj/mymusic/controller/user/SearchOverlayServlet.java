package com.martinwj.mymusic.controller.user;

import com.martinwj.mymusic.entity.SearchOverlay;
import com.martinwj.mymusic.entity.Singer;
import com.martinwj.mymusic.entity.Song;
import com.martinwj.mymusic.service.SingerService;
import com.martinwj.mymusic.service.SongService;
import com.martinwj.mymusic.service.impl.SingerServiceImpl;
import com.martinwj.mymusic.service.impl.SongServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/19 15:37
 * @version: 1.0
 */
@WebServlet("/searchOverlayServlet")
public class SearchOverlayServlet extends HttpServlet {

    private SingerService singerService = null;
    private SongService songService = null;

    @Override
    public void init() throws ServletException {
        singerService = new SingerServiceImpl();
        songService = new SongServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchOverlay = request.getParameter("searchOverlay");
        String servletPath = request.getParameter("servletPath");
        SearchOverlay search = new SearchOverlay();

        search.setInfo(searchOverlay);
        // 查询歌手信息
        Map<Singer, Integer> map = new HashMap<>();
        List<Singer> singerList = singerService.getSingerByName(searchOverlay);
        for(Singer singer : singerList) {
            map.put(singer, (int) songService.getAllSongsCountBySingerName(singer.getName()));
        }
        search.setMap(map);

        // 查询歌曲信息
        List<Song> songsList = songService.getSongByNameLike(searchOverlay);
        search.setList(songsList);

        HttpSession session = request.getSession();
        session.setAttribute("searchInfo", search);

        response.sendRedirect(request.getContextPath() + "/page/user/search-result.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
