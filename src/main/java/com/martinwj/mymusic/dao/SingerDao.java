package com.martinwj.mymusic.dao;

import com.martinwj.mymusic.entity.Singer;

import java.util.List;
import java.util.Map;

/**
 * @ClassName: SingerDao
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-09 17:10
 */
public interface SingerDao {

    /**
     * 通过歌手id查找歌手信息
     * @param singerId
     * @return
     */
    Singer getSingerBySingerId(int singerId);

    /**
     * 根据英文名的首字母，查找歌手
     * @param initials 英文首字母
     * @return
     */
    List<Singer> getSingerByEnglishName(String initials);

    /**
     * 通过歌手姓名查找歌手信息
     * @param singerName
     * @return
     */
    Singer getSingerBySingerName(String singerName);

    /**
     * 获取所有歌手数量
     * @return
     */
    long getAllSingersCount(Map<String, String[]> condition);

    /**
     * 分页条件查询
     * @param start 起始页
     * @param rows 每页的数据条数
     * @param condition 条件
     * @return
     */
    List<Singer> findSingersByPage(int start, int rows, Map<String, String[]> condition);

    /**
     * 根据ID，更新歌手信息
     * @param singer
     * @return
     */
    int updateSinger(Singer singer);

    /**
     * 根据singerID，删除歌手信息
     * @param singerId
     * @return
     */
    int deleteSingerBySIngerId(int singerId);

    /**
     * 添加歌手信息
     * @param singer
     * @return
     */
    int addSinger(Singer singer);

    /**
     * 查询所有的歌手信息
     * @return
     */
    List<Singer> getAllSingers();

    /**
     * 根据歌手姓名模糊查询歌手信息
     * @param info
     * @return
     */
    List<Singer> findSingersByName(String info);

    /**
     * 根据歌手姓名增加歌手的热度
     * @param singerName
     * @return
     */
    int updateSingerAccessCountBySingerName(String singerName);

    /**
     * 根据歌曲ID查询歌手信息
     * @param songId
     * @return
     */
    Singer getSingerBySongId(Integer songId);
}
