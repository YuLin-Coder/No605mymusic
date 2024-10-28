package com.martinwj.mymusic.dao.impl;

import com.martinwj.mymusic.dao.BaseDao;
import com.martinwj.mymusic.dao.CommentDao;
import com.martinwj.mymusic.dao.CommonDao;
import com.martinwj.mymusic.entity.Comment;
import com.martinwj.mymusic.util.JavaBeanUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/17 19:45
 * @version: 1.0
 */
public class CommentDaoImpl extends CommonDao<Comment> implements CommentDao {
    @Override
    public List<Comment> getCommentsBySongId(int start, int rows, int songId) {
        String sql = "select * from comment where songId=? limit ?, ? ";
        List<Object> list = new ArrayList<>();
        list.add(songId);
        list.add(start);
        list.add(rows);
        return getBeanList(sql, list.toArray());
    }

    @Override
    public int getCommentsCountBySongId(int songId) {
        String sql = "select count(*) from comment where songId=?";
        return ((Long) getValue(sql, songId)).intValue();
    }

    @Override
    public int addComment(Comment comment) {
        String sql = "insert into comment values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        return update(sql, JavaBeanUtils.beanToList(comment).toArray());
    }

    @Override
    public int addCommentUp(int commentId) {
        String sql = "update comment set up=up+1 where id=?";
        return update(sql, commentId);
    }

    @Override
    public int getAllCommentsCount(Map<String, String[]> condition) {
        String sql = "select count(*) from comment where 1=1";
        return (int) getAllCount(sql ,condition);
    }

    @Override
    public List<Comment> findCommentsByPage(int start, int rows, Map<String, String[]> condition) {
        String sql = "select * from comment where 1=1";
        return findByPage(sql, start, rows, condition);
    }

    @Override
    public int updateCommentContext(int commentId, String newCommentContext) {
        String sql = "update comment set context=? where id=?";
        List<Object> list = new ArrayList<>();
        list.add(newCommentContext);
        list.add(commentId);
        return update(sql, list.toArray());
    }

    @Override
    public Integer delCommentByCommentId(int commentId) {
        String sql = "delete from comment where id=?";
        return update(sql, commentId);
    }

    @Override
    public int delCommentBySongId(int songId) {
        String sql = "delete from comment where songId=?";
        return update(sql, songId);
    }

    @Override
    public List<Comment> getNewComment(int num) {
        String sql = "select * from comment c where c.id in " +
                " (select SUBSTRING_INDEX(GROUP_CONCAT(id order by createDate desc), ',', 1) from `comment` " +
                " GROUP BY songId ORDER BY createDate desc) " +
                " order by c.createDate desc limit 0, ? ";
        return getBeanList(sql, num);
    }
}
