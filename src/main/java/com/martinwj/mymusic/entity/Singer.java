package com.martinwj.mymusic.entity;

import java.util.Date;

/**
 * @ClassName: Singer
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-09 15:24
 *
 * 歌手bean
 */
public class Singer {

    // 编号
    private int singerId;
    // 歌手名称
    private String name;
    // 歌手英文名
    private String englishName;
    // 性别（0女1男2组合3未知）
    private int sex;
    // 头像
    private String pic;
    // 生日
    private String birth;
    // 地区
    private String location;
    // 个人简介
    private String introduction;
    // 热度，访问次数，默认0
    private int accessCount;
    // 收藏次数
    private int collectionCount;
    // 出道日期
    private String debutDate;

    public Singer() {
    }

    public Singer(int singerId, String name, String englishName, int sex, String pic, String birth, String location, String introduction, int accessCount, int collectionCount, String debutDate) {
        this.singerId = singerId;
        this.name = name;
        this.englishName = englishName;
        this.sex = sex;
        this.pic = pic;
        this.birth = birth;
        this.location = location;
        this.introduction = introduction;
        this.accessCount = accessCount;
        this.collectionCount = collectionCount;
        this.debutDate = debutDate;
    }

    public int getSingerId() {
        return singerId;
    }

    public void setSingerId(int singerId) {
        this.singerId = singerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public int getAccessCount() {
        return accessCount;
    }

    public void setAccessCount(int accessCount) {
        this.accessCount = accessCount;
    }

    public int getCollectionCount() {
        return collectionCount;
    }

    public void setCollectionCount(int collectionCount) {
        this.collectionCount = collectionCount;
    }

    public void setDebutDate(String debutDate) {
        this.debutDate = debutDate;
    }

    public String getLocation() {
        return location;
    }

    public String getEnglishName() {
        return englishName;
    }

    public void setEnglishName(String englishName) {
        this.englishName = englishName;
    }

    public String getDebutDate() {
        return debutDate;
    }

    @Override
    public String toString() {
        return "Singer{" +
                "singerId=" + singerId +
                ", name='" + name + '\'' +
                ", englishName='" + englishName + '\'' +
                ", sex=" + sex +
                ", pic='" + pic + '\'' +
                ", birth='" + birth + '\'' +
                ", location='" + location + '\'' +
                ", introduction='" + introduction + '\'' +
                ", accessCount=" + accessCount +
                ", collectionCount=" + collectionCount +
                ", debutDate='" + debutDate + '\'' +
                '}';
    }
}
