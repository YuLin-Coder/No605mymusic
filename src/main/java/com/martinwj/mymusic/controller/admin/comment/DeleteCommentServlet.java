package com.martinwj.mymusic.controller.admin.comment;

import com.martinwj.mymusic.service.CommentService;
import com.martinwj.mymusic.service.impl.CommentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/18 17:22
 * @version: 1.0
 */
@WebServlet("/admin/deleteCommentServlet")
public class DeleteCommentServlet extends HttpServlet {

    private CommentService commentService = null;

    @Override
    public void init() throws ServletException {
        commentService = new CommentServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1.获取所有id
        String[] ids = request.getParameterValues("commentId");
        System.out.println("删除的评论ID有：" + Arrays.toString(ids));

        // 2.调用service删除
        List<Integer> list = commentService.delCommentByCommentIds(ids);

        //3.跳转查询所有Servlet
        response.sendRedirect(request.getContextPath()+"/admin/findCommentByPageServlet");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
