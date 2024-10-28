package com.martinwj.mymusic.dao;

import com.martinwj.mymusic.entity.Comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/17 19:44
 * @version: 1.0
 */
public interface CommentDao {
    /**
     *  根据歌曲ID获取所有评论信息
     * @param songId
     * @return
     */
    List<Comment> getCommentsBySongId(int start, int rows, int songId);

    /**
     * 根据歌曲ID获取评论总数
     * @param songId
     * @return
     */
    int getCommentsCountBySongId(int songId);

    /**
     * 添加一条评论
     * @return
     */
    int addComment(Comment comment);

    /**
     * 增加评论点赞数
     * @param commentId
     * @return
     */
    int addCommentUp(int commentId);

    /**
     * 根据条件获取所有的评论数量
     * @param condition
     * @return
     */
    int getAllCommentsCount(Map<String, String[]> condition);

    /**
     * 分页获取评论数
     * @param start
     * @param rows
     * @param condition
     * @return
     */
    List<Comment> findCommentsByPage(int start, int rows, Map<String, String[]> condition);

    /**
     * 根据评论编号更新评论内容
     * @param commentId
     * @param newCommentContext
     * @return
     */
    int updateCommentContext(int commentId, String newCommentContext);

    /**
     * 根据评论编号，删除评论信息
     * @param commentId
     * @return
     */
    Integer delCommentByCommentId(int commentId);

    /**
     * 根据歌曲ID删除评论信息
     * @param songId
     * @return
     */
    int delCommentBySongId(int songId);

    /**
     * 获取最新的 num 条评论信息
     * @param num
     * @return
     */
    List<Comment> getNewComment(int num);
}
