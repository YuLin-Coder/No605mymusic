package com.martinwj.mymusic.controller.type;

import com.martinwj.mymusic.entity.Type;
import com.martinwj.mymusic.service.TypeService;
import com.martinwj.mymusic.service.impl.TypeServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/16 17:38
 * @version: 1.0
 */
@WebServlet("/getAllTypesServlet")
public class GetAllTypesServlet extends HttpServlet {
    private TypeService typeService = null;

    @Override
    public void init() throws ServletException {
        typeService = new TypeServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Type> allTypes = typeService.getAllTypes();
        StringBuilder sb = new StringBuilder();
        for(Type type : allTypes){
            sb.append(type.getName()).append(",");
        }
        request.getSession().setAttribute("allTypes", allTypes);
        request.getSession().setAttribute("types", sb.toString());
        // 重定向到分类页面
        response.sendRedirect(request.getContextPath() + "/page/user/categories.jsp");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
