package com.martinwj.mymusic.entity;

import java.util.List;
import java.util.Map;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/18 9:43
 * @version: 1.0
 */
public class CommentWithSong {

    // 总记录数
    private int totalCount;
    // 总页码
    private int totalPage;
    // 当前页码
    private int currentPage;
    // 每页数据的条数
    private int rows;

    // 歌曲
    private Song song;
    // 评论列表（每页的信息）
    private Map<User, Comment> commentMap;
    // 歌曲的歌手信息
    private Singer singer;

    public CommentWithSong(){}

    public CommentWithSong(int totalCount, int totalPage, int currentPage, int rows, Song song, Map<User, Comment> commentMap, Singer singer) {
        this.totalCount = totalCount;
        this.totalPage = totalPage;
        this.currentPage = currentPage;
        this.rows = rows;
        this.song = song;
        this.commentMap = commentMap;
        this.singer = singer;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public Song getSong() {
        return song;
    }

    public void setSong(Song song) {
        this.song = song;
    }

    public Map<User, Comment> getCommentMap() {
        return commentMap;
    }

    public void setCommentMap(Map<User, Comment> commentMap) {
        this.commentMap = commentMap;
    }

    public Singer getSinger() {
        return singer;
    }

    public void setSinger(Singer singer) {
        this.singer = singer;
    }

    @Override
    public String toString() {
        return "CommentWithSong{" +
                "totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", currentPage=" + currentPage +
                ", rows=" + rows +
                ", song=" + song +
                ", commentMap=" + commentMap +
                ", singer=" + singer +
                '}';
    }
}
