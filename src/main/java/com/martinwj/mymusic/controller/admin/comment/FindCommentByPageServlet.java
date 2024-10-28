package com.martinwj.mymusic.controller.admin.comment;

import com.martinwj.mymusic.entity.Comment;
import com.martinwj.mymusic.entity.PageBean;
import com.martinwj.mymusic.entity.Song;
import com.martinwj.mymusic.service.CommentService;
import com.martinwj.mymusic.service.impl.CommentServiceImpl;

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
 * @date: 2020/11/18 16:42
 * @version: 1.0
 */
@WebServlet("/admin/findCommentByPageServlet")
public class FindCommentByPageServlet extends HttpServlet {

    private CommentService commentService = null;

    @Override
    public void init() throws ServletException {
        commentService = new CommentServiceImpl();
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

        // 对参数进行修改


        //2.调用service查询
        PageBean<Comment> pb = commentService.findCommentsByPage(currentPage, rows, condition);
        System.out.println(pb);

        for(Comment comment : pb.getList()) {
            comment.setContext(comment.getContext().replace("\n", "<br>"));
        }

        //3.将PageBean存入session
        HttpSession session = request.getSession();
        for(String s : condition.keySet()){
            System.out.println(s + " : " + Arrays.toString(condition.get(s)));
            session.setAttribute("commentKeyName", condition.get(s)[0]);
        }
        session.setAttribute("commentPb", pb);
        session.setAttribute("commentCondition", condition);// 将查询条件存入request
        request.getRequestDispatcher("/page/manager/comment.jsp").forward(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
