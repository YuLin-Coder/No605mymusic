package com.martinwj.mymusic.controller.admin.comment;

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
 * @date: 2020/11/18 17:23
 * @version: 1.0
 */
@WebServlet("/admin/updateCommentServlet")
public class UpdateCommentServlet extends HttpServlet {

    private CommentService commentService = null;

    @Override
    public void init() throws ServletException {
        commentService = new CommentServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String commentId = request.getParameter("commentId");
        String newCommentContext = request.getParameter("updateContext_" + commentId);

        System.out.println("修改评论内容：" + newCommentContext);
        // 调用service 修改评论内容
        int flag = commentService.updateCommentContext(Integer.parseInt(commentId), newCommentContext);

        // 跳转查询所有Servlet
        response.sendRedirect(request.getContextPath()+"/admin/findCommentByPageServlet");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}