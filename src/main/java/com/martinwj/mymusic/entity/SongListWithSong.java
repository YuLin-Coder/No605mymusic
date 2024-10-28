package com.martinwj.mymusic.entity;

/**
 * @author: Martin（靖王）
 * @description: TODO 歌单对应的所有歌曲列表
 * @date: 2020/11/15 22:33
 * @version: 1.0
 */
public class SongListWithSong {
    // 歌单歌曲ID
    private int id;
    // 歌单编号
    private int songListId;
    // 歌曲编号
    private int songId;
    // 添加时间
    private String createDate;

    public SongListWithSong(){}

    public SongListWithSong(int id, int songListId, int songId, String createDate) {
        this.id = id;
        this.songListId = songListId;
        this.songId = songId;
        this.createDate = createDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSongListId() {
        return songListId;
    }

    public void setSongListId(int songListId) {
        this.songListId = songListId;
    }

    public int getSongId() {
        return songId;
    }

    public void setSongId(int songId) {
        this.songId = songId;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "SongListWithSong{" +
                "id=" + id +
                ", songListId=" + songListId +
                ", songId=" + songId +
                ", createDate='" + createDate + '\'' +
                '}';
    }
}
