package com.martinwj.mymusic.entity;

import java.util.List;

/**
 * @author: Martin（靖王）
 * @description: TODO 用户收藏
 * @date: 2020/11/19 20:16
 * @version: 1.0
 */
public class UserSaved {

    // 歌单和歌曲的实体类关联
    private SongListWithSong songListWithSong;

    // 歌单 信息
    private SongList songList;

    // 用户信息
    private User user;

    // 歌单的所有歌曲信息
    private List<Song> list;

    public UserSaved() {
    }

    public UserSaved(SongListWithSong songListWithSong, SongList songList, User user, List<Song> list) {
        this.songListWithSong = songListWithSong;
        this.songList = songList;
        this.user = user;
        this.list = list;
    }

    public SongListWithSong getSongListWithSong() {
        return songListWithSong;
    }

    public void setSongListWithSong(SongListWithSong songListWithSong) {
        this.songListWithSong = songListWithSong;
    }

    public SongList getSongList() {
        return songList;
    }

    public void setSongList(SongList songList) {
        this.songList = songList;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Song> getList() {
        return list;
    }

    public void setList(List<Song> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "UserSaved{" +
                "songListWithSong=" + songListWithSong +
                ", songList=" + songList +
                ", user=" + user +
                ", list=" + list +
                '}';
    }
}
