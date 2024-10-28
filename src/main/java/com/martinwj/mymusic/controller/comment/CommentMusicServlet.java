package com.martinwj.mymusic.controller.comment;

import com.martinwj.mymusic.entity.*;
import com.martinwj.mymusic.service.CommentService;
import com.martinwj.mymusic.service.SingerService;
import com.martinwj.mymusic.service.SongService;
import com.martinwj.mymusic.service.UserService;
import com.martinwj.mymusic.service.impl.CommentServiceImpl;
import com.martinwj.mymusic.service.impl.SingerServiceImpl;
import com.martinwj.mymusic.service.impl.SongServiceImpl;
import com.martinwj.mymusic.service.impl.UserServiceImpl;

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
 * @date: 2020/11/17 19:44
 * @version: 1.0
 */
@WebServlet("/commentMusicServlet")
public class CommentMusicServlet extends HttpServlet {

    private CommentService commentService = null;
    private SongService songService = null;
    private SingerService singerService = null;
    private UserService userService = null;

    @Override
    public void init() throws ServletException {
        commentService = new CommentServiceImpl();
        songService = new SongServiceImpl();
        singerService = new SingerServiceImpl();
        userService = new UserServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取歌手ID
        String songId = request.getParameter("songId");
        System.out.println(songId);
        // 定义评论对象
        CommentWithSong commentSong = new CommentWithSong();
        User user;
        // 根据歌曲ID获取歌曲信息
        Song song = songService.getSongById(Integer.parseInt(songId));
        song.setLyric(song.getLyric().replace("\n", "<br>"));
        commentSong.setSong(song);
        System.out.println(song);
        // 根据歌曲的歌手名获取歌手信息
        Singer singer = singerService.getSingerBySingerId(song.getSingerId());
        commentSong.setSinger(singer);

        // 分页的信息
        String _currentPage = request.getParameter("currentPage");// 当前页码
        String _rows = request.getParameter("rows");// 每页显示条数

        if(_currentPage == null || "".equals(_currentPage)){
            _currentPage = "1";
        }

        if(_rows == null || "".equals(_rows)){
            _rows = "10";
        }

        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);
        commentSong.setRows(rows);

        // 获取总的评论数
        int totalCount = commentService.getCommentsCountBySongId(Integer.parseInt(songId));
        commentSong.setTotalCount(totalCount);
        // 计算总页码
        int totalPage = (totalCount % rows)  == 0 ? (totalCount / rows) : (totalCount/rows) + 1;
        commentSong.setTotalPage(totalPage);
        // 计算当前页码
        if(currentPage <= 0){
            currentPage = totalPage;
        } else if(currentPage > totalPage) {
            currentPage = 1;
        }
        commentSong.setCurrentPage(currentPage);

        int start = (currentPage - 1) * rows;

        // 获取评论列表
        List<Comment> comments = commentService.getCommentsBySongId(start, rows, Integer.parseInt(songId));

        Map<User, Comment> map = new HashMap<User, Comment>();
        for(Comment comment : comments) {
            user = userService.getUserByUserId(comment.getUserId());
            comment.setContext(comment.getContext().replace("\n", "<br>"));
            map.put(user, comment);
        }
        commentSong.setCommentMap(map);

        HttpSession session = request.getSession();
        session.setAttribute("commentSong", commentSong);

        response.sendRedirect(request.getContextPath() + "/page/user/comment-music.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
