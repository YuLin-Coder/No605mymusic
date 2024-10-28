package com.martinwj.mymusic.entity;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/15 22:26
 * @version: 1.0
 *
 * 歌单
 */
public class Singerlist {
    // 歌单ID
    private int songListId;
    // 歌单名称
    private String name;
    // 用户ID
    private int userId;
    // 热度，该歌单被访问次数
    private int accessCount;
    // 歌单简介
    private String introduction;
    // 歌单收藏次数
    private int collectionCount;
    // 歌单标签
    private String tags;
    // 歌单图标
    private String photoUrl;
    // 歌单创建日期
    private String createDate;
    // 歌单更新日期
    private String updateDate;

    public Singerlist(){

    }

    public Singerlist(int songListId, String name, int userId, int accessCount, String introduction, int collectionCount, String tags, String photoUrl, String createDate, String updateDate) {
        this.songListId = songListId;
        this.name = name;
        this.userId = userId;
        this.accessCount = accessCount;
        this.introduction = introduction;
        this.collectionCount = collectionCount;
        this.tags = tags;
        this.photoUrl = photoUrl;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }

    public int getSongListId() {
        return songListId;
    }

    public void setSongListId(int songListId) {
        this.songListId = songListId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getAccessCount() {
        return accessCount;
    }

    public void setAccessCount(int accessCount) {
        this.accessCount = accessCount;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public int getCollectionCount() {
        return collectionCount;
    }

    public void setCollectionCount(int collectionCount) {
        this.collectionCount = collectionCount;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    @Override
    public String toString() {
        return "Singerlist{" +
                "songListId=" + songListId +
                ", name='" + name + '\'' +
                ", userId=" + userId +
                ", accessCount=" + accessCount +
                ", introduction='" + introduction + '\'' +
                ", collectionCount=" + collectionCount +
                ", tags='" + tags + '\'' +
                ", photoUrl='" + photoUrl + '\'' +
                ", createDate='" + createDate + '\'' +
                ", updateDate='" + updateDate + '\'' +
                '}';
    }
}
