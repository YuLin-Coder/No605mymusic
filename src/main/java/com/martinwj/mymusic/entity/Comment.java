package com.martinwj.mymusic.entity;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/15 22:09
 * @version: 1.0
 *
 * 评论表实体
 */
public class Comment {
    // 主键
    private int id;
    // 用户ID
    private int userId;
    // 用户名
    private String username;
    // 评论类型（0歌曲1歌单2专辑）
    private int type;
    // 歌曲ID
    private Integer songId;
    // 歌曲名称
    private String songName;
    // 歌单ID
    private Integer songListId;
    // 歌但名称
    private String songListName;
    // 专辑ID
    private Integer cdId;
    // 歌手名称
    private String singerName;
    // 评论内容
    private String context;
    // 评论时间
    private String createDate;
    // 点赞次数
    private int up;

    public Comment() {
    }

    public Comment(int id, int userId, String username, int type, Integer songId, String songName, Integer songListId, String songListName, Integer cdId, String singerName, String context, String createDate, int up) {
        this.id = id;
        this.userId = userId;
        this.username = username;
        this.type = type;
        this.songId = songId;
        this.songName = songName;
        this.songListId = songListId;
        this.songListName = songListName;
        this.cdId = cdId;
        this.singerName = singerName;
        this.context = context;
        this.createDate = createDate;
        this.up = up;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Integer getSongId() {
        return songId;
    }

    public void setSongId(Integer songId) {
        this.songId = songId;
    }

    public String getSongName() {
        return songName;
    }

    public void setSongName(String songName) {
        this.songName = songName;
    }

    public Integer getSongListId() {
        return songListId;
    }

    public void setSongListId(Integer songListId) {
        this.songListId = songListId;
    }

    public String getSongListName() {
        return songListName;
    }

    public void setSongListName(String songListName) {
        this.songListName = songListName;
    }

    public Integer getCdId() {
        return cdId;
    }

    public void setCdId(Integer cdId) {
        this.cdId = cdId;
    }

    public String getSingerName() {
        return singerName;
    }

    public void setSingerName(String singerName) {
        this.singerName = singerName;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public int getUp() {
        return up;
    }

    public void setUp(int up) {
        this.up = up;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", userId=" + userId +
                ", username='" + username + '\'' +
                ", type=" + type +
                ", songId=" + songId +
                ", songName='" + songName + '\'' +
                ", songListId=" + songListId +
                ", songListName='" + songListName + '\'' +
                ", cdId=" + cdId +
                ", singerName='" + singerName + '\'' +
                ", context='" + context + '\'' +
                ", createDate='" + createDate + '\'' +
                ", up=" + up +
                '}';
    }
}
