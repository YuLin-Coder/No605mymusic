package com.martinwj.mymusic.controller.admin.singer;

import com.martinwj.mymusic.entity.Singer;
import com.martinwj.mymusic.service.SingerService;
import com.martinwj.mymusic.service.impl.SingerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/14 10:44
 * @version: 1.0
 */
@WebServlet("/admin/updateSingerServlet")
public class UpdateSingerServlet extends HttpServlet {

    private SingerService singerService = null;

    @Override
    public void init() throws ServletException {
        singerService = new SingerServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取修改表单
        String singerId = request.getParameter("singerId");
        String accessCount = request.getParameter("update_accessCount_" + singerId);
        String collectionCount = request.getParameter("update_collectionCount_" + singerId);
        String location = request.getParameter("update_singerLocation_" + singerId);
        String introduction = request.getParameter("updateIntroduction_" + singerId);

        // 封装数据
        Singer singer = new Singer();
        singer.setSingerId(Integer.parseInt(singerId));
        singer.setAccessCount(Integer.parseInt(accessCount));
        singer.setCollectionCount(Integer.parseInt(collectionCount));
        singer.setLocation(location);
        singer.setIntroduction(introduction);
        System.out.println(singer);

        // 调用service执行修改操作
        int flag = singerService.updateSinger(singer);

        // 跳转查询所有Servlet
        response.sendRedirect(request.getContextPath()+"/admin/findSingerByPageServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
