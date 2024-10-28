package com.martinwj.mymusic.controller.admin.song;

import com.martinwj.mymusic.entity.Song;
import com.martinwj.mymusic.entity.Type;
import com.martinwj.mymusic.service.SongService;
import com.martinwj.mymusic.service.TypeService;
import com.martinwj.mymusic.service.impl.SongServiceImpl;
import com.martinwj.mymusic.service.impl.TypeServiceImpl;
import com.martinwj.mymusic.util.DateUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author: Martin（靖王）
 * @description: TODO 修改歌曲信息
 * @date: 2020/11/13 15:26
 * @version: 1.0
 */
@WebServlet("/admin/updateSongServlet")
public class UpdateSongServlet extends HttpServlet {

    private SongService songService = null;
    private TypeService typeService = null;

    @Override
    public void init() throws ServletException {
        songService = new SongServiceImpl();
        typeService = new TypeServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取修改表单
        String songId = request.getParameter("songId");
        String playerCount = request.getParameter("update_playerCount_" + songId);
        String downloadCount = request.getParameter("update_downloadCount_" + songId);
        String collectionCount = request.getParameter("update_collectionCount_" + songId);
        String type = request.getParameter("update_songType_" + songId);
        String initialType = request.getParameter("initialType_" + songId);
        String lyric = request.getParameter("updateLyric_" + songId);
        System.out.println(type);

        // 封装数据
        Song song = new Song();
        song.setSongId(Integer.parseInt(songId));
        song.setPlayCount(Integer.parseInt(playerCount));
        song.setDownloadCount(Integer.parseInt(downloadCount));
        song.setCollectionCount(Integer.parseInt(collectionCount));
        song.setType(type);
        song.setLyric(lyric);
        song.setUpdateDate(DateUtils.getDateString());
        System.out.println(song);

        // 调用service执行修改操作
        int flag = songService.updateSong(song);

        // 判断现在的类型和原类型是否一致
        if(!type.equals(initialType)){
            String[] typeSplit = type.split(",");
            String[] initialSplitType = initialType.split(",");
            for(String s : typeSplit){
                // 如果原分类字符串不包含s，则修改类型的歌曲数量
                if(!initialType.contains(s)){
                    if(typeService.getTypeByName(s) != null){
                        typeService.updateTypeByName(s, true);
                    }else {
                        Type t = new Type();
                        t.setName(s);
                        t.setSongCount(1);
                        typeService.addType(t);
                    }
                }
            }
            for(String s : initialSplitType){
                if(!type.contains(s)) {
                    typeService.updateTypeByName(s, false);
                }
            }
        }

        // 跳转查询所有Servlet
        response.sendRedirect(request.getContextPath()+"/admin/findSongByPageServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
