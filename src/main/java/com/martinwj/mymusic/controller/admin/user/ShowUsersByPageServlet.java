package com.martinwj.mymusic.controller.admin.user;

import com.martinwj.mymusic.entity.PageBean;
import com.martinwj.mymusic.entity.Song;
import com.martinwj.mymusic.entity.User;
import com.martinwj.mymusic.service.UserService;
import com.martinwj.mymusic.service.impl.UserServiceImpl;

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
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/18 15:02
 * @version: 1.0
 */
@WebServlet("/admin/showUsersByPageServlet")
public class ShowUsersByPageServlet extends HttpServlet {

    private UserService userService = null;

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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

//        for(String key : condition.keySet()) {
//            if("sex".equals(key)) {
//                String value = condition.get(key)[0];
//                int sex = Integer.parseInt(value);
//                sex = sex ==
//
//            }
//        }
        System.out.println(condition);

        //2.调用service查询
        PageBean<User> pb = userService.findUsersByPage(currentPage, rows, condition);
        System.out.println(pb);

        //3.将PageBean存入session
        HttpSession session = request.getSession();
        for(String s : condition.keySet()){
            System.out.println(s + " : " + Arrays.toString(condition.get(s)));
            session.setAttribute("userKeyName", condition.get(s)[0]);
        }
        session.setAttribute("userPb", pb);
        session.setAttribute("userCondition", condition);// 将查询条件存入request
        request.getRequestDispatcher("/page/manager/user.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
