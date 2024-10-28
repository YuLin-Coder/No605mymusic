package com.martinwj.mymusic.controller.admin.singer;

import com.martinwj.mymusic.entity.PageBean;
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
import java.util.Arrays;
import java.util.Map;

/**
 * @ClassName: ${NAME}
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-14 9:41
 */
@WebServlet("/admin/findSingerByPageServlet")
public class FindSingerByPageServlet extends HttpServlet {

    private SingerService singerService = null;

    @Override
    public void init() throws ServletException {
        singerService = new SingerServiceImpl();
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
        Map<String, String[]> singerCondition = request.getParameterMap();

        //2.调用service查询
        PageBean<Singer> singerPb = singerService.findSingersByPage(currentPage, rows, singerCondition);
        System.out.println(singerPb);

        //3.将PageBean存入session
        HttpSession session = request.getSession();
        for(String s : singerCondition.keySet()){
            System.out.println(s + " : " + Arrays.toString(singerCondition.get(s)));
            session.setAttribute("singerKeyName", singerCondition.get(s)[0]);
        }
        session.setAttribute("singerPb", singerPb);
        session.setAttribute("singerCondition", singerCondition);// 将查询条件存入request
        request.getRequestDispatcher("/page/manager/singer.jsp").forward(request, response);

//        Gson gson = new Gson();
//        String json = gson.toJson(pb);
//        System.out.println(json);

//        ServletUtils.sendToPage(response, json);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
