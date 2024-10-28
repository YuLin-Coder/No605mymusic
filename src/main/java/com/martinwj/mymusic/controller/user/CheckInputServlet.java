package com.martinwj.mymusic.controller.user;

import com.martinwj.mymusic.entity.User;
import com.martinwj.mymusic.service.UserService;
import com.martinwj.mymusic.service.impl.UserServiceImpl;
import com.martinwj.mymusic.util.ServletUtils;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/16 11:12
 * @version: 1.0
 */
@WebServlet("/user/checkInputServlet")
public class CheckInputServlet extends HttpServlet {

    private UserService userService = null;

    @Override
    public void init() throws ServletException {
        userService = new UserServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> params = request.getParameterMap();

        JSONObject jsonObject = new JSONObject();
        User user = null;
        List<User> list = null;
        for ( String key : params.keySet()) {
            if ("username".equals(key)){
                user = userService.getUserByUsername(params.get(key)[0]);
                System.out.println("username -> " + key + "  :  " + params.get(key)[0]);
            } else if ("name".equals(key)){
                user = userService.getUserByName(params.get(key)[0]);
                System.out.println("name -> " + key + "  :  " + params.get(key)[0]);
            } else if("email".equals(key)) {
                list = userService.getUserByEmail(params.get(key)[0]);
                System.out.println("email -> " + key + "  :  " + params.get(key)[0]);
            }
        }
        if(user == null && ( list == null || list.size() < 3 ) ) {
            jsonObject.put("status", "ok");
        } else {
            jsonObject.put("status", "error");
        }
        System.out.println(jsonObject.toString());
        ServletUtils.sendToPage(response, jsonObject.toString());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
