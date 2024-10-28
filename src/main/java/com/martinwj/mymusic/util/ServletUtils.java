package com.martinwj.mymusic.util;

import com.martinwj.mymusic.entity.Song;
import com.martinwj.mymusic.entity.Type;
import com.martinwj.mymusic.service.*;
import com.martinwj.mymusic.service.impl.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;

/**
 * @ClassName: ServletUtils
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-09 19:47
 */
public class ServletUtils {

    private static SongService songService = new SongServiceImpl();
    private static CommentService commentService = new CommentServiceImpl();
    private static TypeService typeService = new TypeServiceImpl();
    private static SingerService singerService = new SingerServiceImpl();
    private static UserService userService = new UserServiceImpl();

    /**
     * 将数据发送给前端界面
     * @param resp
     * @param jsonStr
     * @throws IOException
     */
    public static void sendToPage(HttpServletResponse resp, String jsonStr) throws IOException {
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("application/json; charset=utf-8");
        PrintWriter writer = resp.getWriter();
        writer.print(jsonStr);
    }

    /**
     * 设置用户数量、专辑数量、歌手数量、歌曲数量的 session
     * @param session
     */
    public static void setNumber(HttpSession session) {
        // 更新Type的数量信息
        for(Type type : typeService.getAllTypes()) {
            type.setSongCount((int) songService.getAllSongsCountByType(type.getName()));
            typeService.updateTypeById(type);
        }
        session.setAttribute("singerNumber", singerService.getAllSingersCount(new HashMap<>()));
        session.setAttribute("songNumber", songService.getAllSongsCount(new HashMap<>()));
        session.setAttribute("commentNumber", commentService.getAllCommentsCount(new HashMap<>()));
        session.setAttribute("userNumber", userService.getAllUsersCount(new HashMap<>()));
    }

    /**
     * 清空session
     * @param request
     */
    public static void initSession(HttpServletRequest request){
        Enumeration em = request.getSession().getAttributeNames();
        while(em.hasMoreElements()){
            request.getSession().removeAttribute(em.nextElement().toString());
        }
    }

    /**
     * 根据单个ID删除歌曲信息
     * @param id
     */
    public static void deleteSong(int id){
        Song song = null;

        song = songService.getSongById(id);
        String type = song.getType();
        // 2.调用service删除
        // 先删除歌曲的评论信息
        commentService.delCommentBySongId(id);
        // 删除歌曲，同时修改歌曲类型的值
        if(songService.deleteSongBySongId(id) > 0) {
            for (String str : type.split(",")) {
                typeService.updateTypeByName(str, false);
            }
        }
    }

    /**
     * 根据多个歌曲ID删除歌曲信息
     * @param ids
     */
    public static void deleteSong(String[] ids){
        for(String id : ids) {
            deleteSong(Integer.parseInt(id));
        }
    }
}
