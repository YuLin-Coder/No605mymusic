package com.martinwj.mymusic.entity;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/15 22:22
 * @version: 1.0
 *
 * 专辑
 */
public class Cd {
    // 专辑ID
    private int cdId;
    // 专辑名称
    private String name;
    // 专辑封面图片
    private String coverUrl;
    // 该专辑歌曲数量
    private int num;
    // 专辑发布日期（创建日期）
    private String publicDate;
    // 歌手ID
    private int singerId;
    // 简介
    private String introduction;
    // 专辑收藏次数
    private int collectionCount;

    public Cd() {

    }

    public Cd(int cdId, String name, String coverUrl, int num, String publicDate, int singerId, String introduction, int collectionCount) {
        this.cdId = cdId;
        this.name = name;
        this.coverUrl = coverUrl;
        this.num = num;
        this.publicDate = publicDate;
        this.singerId = singerId;
        this.introduction = introduction;
        this.collectionCount = collectionCount;
    }

    public int getCdId() {
        return cdId;
    }

    public void setCdId(int cdId) {
        this.cdId = cdId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCoverUrl() {
        return coverUrl;
    }

    public void setCoverUrl(String coverUrl) {
        this.coverUrl = coverUrl;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public String getPublicDate() {
        return publicDate;
    }

    public void setPublicDate(String publicDate) {
        this.publicDate = publicDate;
    }

    public int getSingerId() {
        return singerId;
    }

    public void setSingerId(int singerId) {
        this.singerId = singerId;
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

    @Override
    public String toString() {
        return "Cd{" +
                "cdId=" + cdId +
                ", name='" + name + '\'' +
                ", coverUrl='" + coverUrl + '\'' +
                ", num=" + num +
                ", publicDate='" + publicDate + '\'' +
                ", singerId=" + singerId +
                ", introduction='" + introduction + '\'' +
                ", collectionCount=" + collectionCount +
                '}';
    }
}
