package com.martinwj.mymusic.service.impl;

import com.martinwj.mymusic.dao.CommentDao;
import com.martinwj.mymusic.dao.impl.CommentDaoImpl;
import com.martinwj.mymusic.entity.Comment;
import com.martinwj.mymusic.entity.PageBean;
import com.martinwj.mymusic.entity.User;
import com.martinwj.mymusic.service.CommentService;
import com.martinwj.mymusic.service.CommonService;
import com.martinwj.mymusic.util.DateUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/17 19:46
 * @version: 1.0
 */
public class CommentServiceImpl extends CommonService<Comment> implements CommentService {

    private CommentDao commentDao = null;

    public CommentServiceImpl(){
        commentDao = new CommentDaoImpl();
    }


    @Override
    public List<Comment> getCommentsBySongId(int start, int rows, int songId) {
        return commentDao.getCommentsBySongId(start, rows, songId);
    }

    @Override
    public int getCommentsCountBySongId(int songId) {
        return commentDao.getCommentsCountBySongId(songId);
    }

    @Override
    public int addComment(int userId, String username, String songId, String songName, String commentMsg) {
        Comment comment = new Comment();
        comment.setUserId(userId);
        comment.setUsername(username);
        comment.setSongId(Integer.parseInt(songId));
        comment.setSongName(songName);
        comment.setContext(commentMsg);
        comment.setCreateDate(DateUtils.getDateString());
        comment.setUp(0);
        comment.setType(0);
        return commentDao.addComment(comment);
    }

    @Override
    public int addCommentUp(int commentId) {
        return commentDao.addCommentUp(commentId);
    }

    @Override
    public int getAllCommentsCount(Map<String, String[]> condition) {
        return commentDao.getAllCommentsCount(condition);
    }

    @Override
    public PageBean<Comment> findCommentsByPage(String _currentPage, String _rows, Map<String, String[]> condition) {
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);
        if(currentPage <= 0){
            currentPage = 1;
        }
        int totalCount = Math.toIntExact(commentDao.getAllCommentsCount(condition));
        int start = (currentPage - 1) * rows;
        List<Comment> list = commentDao.findCommentsByPage(start, rows, condition);

        return findByPage(currentPage, rows, condition, totalCount, start, list);
    }

    @Override
    public int updateCommentContext(int commentId, String newCommentContext) {
        return commentDao.updateCommentContext(commentId, newCommentContext);
    }

    @Override
    public List<Integer> delCommentByCommentIds(String[] ids) {

        List<Integer> list = new ArrayList<>();
        for(String id : ids) {
            list.add(commentDao.delCommentByCommentId(Integer.parseInt(id)));
        }
        return list;
    }

    @Override
    public int delCommentBySongId(int songId) {
        return commentDao.delCommentBySongId(songId);
    }

    @Override
    public List<Comment> getNewComment(int num) {
        return commentDao.getNewComment(num);
    }
}
