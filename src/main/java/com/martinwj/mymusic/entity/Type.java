package com.martinwj.mymusic.entity;

/**
 * @author: Martin（靖王）
 * @description: TODO 音乐类型
 * @date: 2020/11/16 17:20
 * @version: 1.0
 */
public class Type {
    // 编号
    private Integer typeId;
    // 类型名称
    private String name;
    // 该类型歌曲数量
    private int songCount;

    public Type() {
    }

    public Type(Integer typeId, String name, int songCount) {
        this.typeId = typeId;
        this.name = name;
        this.songCount = songCount;
    }

    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSongCount() {
        return songCount;
    }

    public void setSongCount(int songCount) {
        this.songCount = songCount;
    }

    @Override
    public String toString() {
        return "Type{" +
                "typeId=" + typeId +
                ", name='" + name + '\'' +
                ", songCount=" + songCount +
                '}';
    }
}
