package com.martinwj.mymusic.controller.admin.song;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.martinwj.mymusic.entity.PageBean;
import com.martinwj.mymusic.entity.Song;
import com.martinwj.mymusic.service.SongService;
import com.martinwj.mymusic.service.impl.SongServiceImpl;
import com.martinwj.mymusic.util.ServletUtils;
import net.sf.json.JSON;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;

/**
 * @ClassName: ${NAME}
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-09 19:41
 */
@WebServlet("/admin/findSongByPageServlet")
public class FindSongByPageServlet extends HttpServlet {

    private SongService songService = null;

    @Override
    public void init() throws ServletException {
        songService = new SongServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        // 获取参数
        String currentPage = request.getParameter("currentPage");// 当前页码
        String rows = request.getParameter("rows");// 每页显示条数

        if(currentPage == null || "".equals(currentPage)){
            currentPage = "1";
        }

        if(rows == null || "".equals(rows)){
            rows = "6";
        }

        //获取条件查询参数
        Map<String, String[]> condition = request.getParameterMap();

        //2.调用service查询
        PageBean<Song> pb = songService.findSongsByPage(currentPage, rows, condition);
        System.out.println(pb);

        //3.将PageBean存入session
        HttpSession session = request.getSession();
        for(String s : condition.keySet()){
            System.out.println(s + " : " + Arrays.toString(condition.get(s)));
            session.setAttribute("keyName", condition.get(s)[0]);
        }
        session.setAttribute("pb", pb);
        session.setAttribute("condition", condition);// 将查询条件存入request
        request.getRequestDispatcher("/page/manager/music.jsp").forward(request, response);

//        Gson gson = new Gson();
//        String json = gson.toJson(pb);
//        System.out.println(json);

//        ServletUtils.sendToPage(response, json);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
