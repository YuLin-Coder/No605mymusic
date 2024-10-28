package com.martinwj.mymusic.service;

import com.martinwj.mymusic.entity.Comment;
import com.martinwj.mymusic.entity.PageBean;
import com.martinwj.mymusic.entity.Song;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/17 19:45
 * @version: 1.0
 */
public interface CommentService {
    /**
     * 根据歌手ID获取所有评论
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
     * @param userId
     * @param username
     * @param songId
     * @param commentMsg
     * @return
     */
    int addComment(int userId, String username, String songId, String songName, String commentMsg);

    /**
     * 增加点赞数
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
     * 条件查询，获取评论
     * @param currentPage
     * @param rows
     * @param condition
     * @return
     */
    PageBean<Comment> findCommentsByPage(String currentPage, String rows, Map<String, String[]> condition);

    /**
     * 根据评论ID修改评论内容
     * @param commentId
     * @param newCommentContext
     * @return
     */
    int updateCommentContext(int commentId, String newCommentContext);

    /**
     * 删除选中的评论信息
     * @param ids
     * @return
     */
    List<Integer> delCommentByCommentIds(String[] ids);

    /**
     * 根据歌曲ID删除评论信息
     * @param songId
     * @return
     */
    int delCommentBySongId(int songId);

    /**
     * 获取最新的 num 条信息
     * @return
     */
    List<Comment> getNewComment(int num);
}
