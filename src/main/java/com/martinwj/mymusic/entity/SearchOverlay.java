package com.martinwj.mymusic.entity;

import java.util.List;
import java.util.Map;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/19 15:39
 * @version: 1.0
 */
public class SearchOverlay {

    // 搜索信息
    private String info;
    // 歌手 --- 歌曲数量的键值对
    private Map<Singer, Integer> Map;
    // 歌曲列表
    private List<Song> list;

    public SearchOverlay(){}

    public SearchOverlay(String info, java.util.Map<Singer, Integer> map, List<Song> list) {
        this.info = info;
        Map = map;
        this.list = list;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public java.util.Map<Singer, Integer> getMap() {
        return Map;
    }

    public void setMap(java.util.Map<Singer, Integer> map) {
        Map = map;
    }

    public List<Song> getList() {
        return list;
    }

    public void setList(List<Song> list) {
        this.list = list;
    }

    @Override
    public String toString() {
        return "SearchOverlay{" +
                "info='" + info + '\'' +
                ", Map=" + Map +
                ", list=" + list +
                '}';
    }
}
