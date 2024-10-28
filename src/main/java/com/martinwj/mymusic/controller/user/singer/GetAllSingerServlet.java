package com.martinwj.mymusic.controller.user.singer;

import com.martinwj.mymusic.entity.Singer;
import com.martinwj.mymusic.service.SingerService;
import com.martinwj.mymusic.service.impl.SingerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/17 10:20
 * @version: 1.0
 */
@WebServlet("/getAllSingerServlet")
public class GetAllSingerServlet extends HttpServlet {

    private SingerService singerService = null;

    @Override
    public void init() throws ServletException {
        singerService = new SingerServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 拿到所有的歌手信息
        List<Singer> allSingers = singerService.getAllSingers();
        System.out.println(allSingers);
        // 添加到session
        HttpSession session = request.getSession();
        session.setAttribute("allSingers", allSingers);
        // 重定向到专辑页面
        response.sendRedirect(request.getContextPath() + "/page/user/albums.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
