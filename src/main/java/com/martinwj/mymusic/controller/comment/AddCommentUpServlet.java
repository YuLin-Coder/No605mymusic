package com.martinwj.mymusic.controller.comment;

import com.martinwj.mymusic.service.CommentService;
import com.martinwj.mymusic.service.impl.CommentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/18 14:04
 * @version: 1.0
 */
@WebServlet("/addCommentUpServlet")
public class AddCommentUpServlet extends HttpServlet {

    private CommentService commentService = null;

    @Override
    public void init() throws ServletException {
        commentService = new CommentServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 获取参数
        String commentId = request.getParameter("commentId");
        String songId = request.getParameter("songId");

        //
        int flag = commentService.addCommentUp(Integer.parseInt(commentId));

        response.sendRedirect(request.getContextPath() + "/commentMusicServlet?songId=" + songId);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
