package com.martinwj.mymusic.controller.user.home;

import com.martinwj.mymusic.entity.Comment;
import com.martinwj.mymusic.entity.Singer;
import com.martinwj.mymusic.entity.Song;
import com.martinwj.mymusic.entity.Type;
import com.martinwj.mymusic.service.CommentService;
import com.martinwj.mymusic.service.SingerService;
import com.martinwj.mymusic.service.SongService;
import com.martinwj.mymusic.service.TypeService;
import com.martinwj.mymusic.service.impl.CommentServiceImpl;
import com.martinwj.mymusic.service.impl.SingerServiceImpl;
import com.martinwj.mymusic.service.impl.SongServiceImpl;
import com.martinwj.mymusic.service.impl.TypeServiceImpl;
import org.apache.commons.collections.list.TypedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/20 10:04
 * @version: 1.0
 */
@WebServlet("/homePageServlet")
public class HomePageServlet extends HttpServlet {

    private SongService songService = null;
    private SingerService singerService = null;
    private CommentService commentService = null;
    private TypeService typeService = null;

    @Override
    public void init() throws ServletException {
        songService = new SongServiceImpl();
        singerService = new SingerServiceImpl();
        commentService = new CommentServiceImpl();
        typeService = new TypeServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        // 获取10条数量的新更新的音乐
        List<Song> songList = songService.getNewMusic(10);

        // 存入map，并获取相应的歌手信息
        // 新发行音乐栏 的信息
        Map<Singer, Song> singerSongMap = new HashMap<>();
        for(Song song : songList) {
            Singer singer = singerService.getSingerBySingerId(song.getSingerId());
            singerSongMap.put(singer, song);
        }
        session.setAttribute("singerSongMap", singerSongMap);

        // 最新回复内容栏信息
        List<Comment> comments = commentService.getNewComment(5);
        session.setAttribute("comments", comments);

        // 最近最受欢迎的歌曲列表
        List<Type> typeList = typeService.getTypesBySongCount(8);
        List<Map<Singer, Song>> list = new ArrayList<>();
        for(int i = 0; i < typeList.size(); i++) {
            Map<Singer, Song> temp = new HashMap<>();
            // 如果是双数页的话，则查询8条数据，如果是单数页，则查询6条数据  ：为了页面的排版
            int num = (i + 1) % 2 == 0 ? 8 : 6;
            for (Song song : songService.getSongByTypeWithRank(typeList.get(i), 0.36, 0.45, 0.19, num)) {
                temp.put(singerService.getSingerBySingerId(song.getSingerId()), song);
            }
            list.add(temp);
        }
        session.setAttribute("typeRankList", typeList);
        session.setAttribute("songRankList", list);

        response.sendRedirect(request.getContextPath() + "/page/user/index.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
