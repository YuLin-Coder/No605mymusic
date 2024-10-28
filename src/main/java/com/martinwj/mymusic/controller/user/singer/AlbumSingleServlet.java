package com.martinwj.mymusic.controller.user.singer;

import com.martinwj.mymusic.entity.PageBean;
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

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/17 10:45
 * @version: 1.0
 */
@WebServlet("/albumSingleServlet")
public class AlbumSingleServlet extends HttpServlet {
    private SongService songService = null;
    private SingerService singerService = null;

    @Override
    public void init() throws ServletException {
        songService = new SongServiceImpl();
        singerService = new SingerServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 获取参数
        String singerName = request.getParameter("singerName");
        String _currentPage = request.getParameter("currentPage");// 当前页码
        String _rows = request.getParameter("rows");// 每页显示条数

        // 增加该歌手的热度
        singerService.updateSingerAccessCountBySingerName(singerName);

        if(_currentPage == null || "".equals(_currentPage)){
            _currentPage = "1";
        }

        if(_rows == null || "".equals(_rows)){
            _rows = "10";
        }

        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);

        PageBean<Song> songPage = new PageBean<>();

        int totalCount = Math.toIntExact(songService.getAllSongsCountBySingerName(singerName));
        // 计算总页码
        int totalPage = (totalCount % rows)  == 0 ? (totalCount / rows) : (totalCount/rows) + 1;
        songPage.setTotalPage(totalPage);
        // 计算当前页码
        if(currentPage <= 0){
            currentPage = totalPage;
        } else if(currentPage > totalPage) {
            currentPage = 1;
        }
        songPage.setCurrentPage(currentPage);

        int start = (currentPage - 1) * rows;

        // 获取该歌手的所有歌曲
        List<Song> allSongs = songService.getSongBySingerName(start, rows, singerName);
        Singer singer = singerService.getSingerBySingerName(singerName);

        songPage.setList(allSongs);
        songPage.setTotalCount(totalCount);


        songPage.setRows(rows);
        songPage.setTotalPage(totalPage);

        // 添加到session
        HttpSession session = request.getSession();
        session.setAttribute("songPage", songPage);
        session.setAttribute("singer", singer);
        // 重定向到album-single页面
        response.sendRedirect(request.getContextPath() + "/page/user/album-single.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
