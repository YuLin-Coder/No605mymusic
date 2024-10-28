package com.martinwj.mymusic.filter;

import com.martinwj.mymusic.entity.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/17 9:20
 * @version: 1.0
 */
@WebFilter("/page/user/person/*")
public class AUserFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if(user == null){
            request.setCharacterEncoding("utf-8");
            System.out.println("用户未登录！");
            // 未登录则直接跳转到登陆界面
//            request.setAttribute("titleMsg", "哎呀！");
//            request.setAttribute("textMsg", "出了些问题，您还没进行登录，请登录后再试");
//            String url = request.getContextPath() + "/page/user/login.jsp";
//            request.setAttribute("urlMsg", url);
//            request.setAttribute("pageMsg", "登录");
//            request.setAttribute("codeMsg", "");
            response.sendRedirect(request.getContextPath() + "/page/user/login.jsp");
//            request.getRequestDispatcher("/page/user/login.jsp").forward(request, response);
            return ;
        } else {
            System.out.println("用户已登录！");
            chain.doFilter(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
