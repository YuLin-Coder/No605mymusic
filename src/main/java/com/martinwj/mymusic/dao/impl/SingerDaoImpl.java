package com.martinwj.mymusic.dao.impl;

import com.martinwj.mymusic.dao.BaseDao;
import com.martinwj.mymusic.dao.CommonDao;
import com.martinwj.mymusic.dao.SingerDao;
import com.martinwj.mymusic.entity.PageBean;
import com.martinwj.mymusic.entity.Singer;
import com.martinwj.mymusic.entity.Song;
import com.martinwj.mymusic.util.JavaBeanUtils;
import com.martinwj.mymusic.util.PageUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: SingerDaoImpl
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-09 17:12
 */
public class SingerDaoImpl extends CommonDao<Singer> implements SingerDao {

    @Override
    public Singer getSingerBySingerId(int singerId) {
        String sql = "select * from singer where singerId=?";
        return getBean(sql, singerId);
    }

    @Override
    public List<Singer> getSingerByEnglishName(String initials) {
        String sql = "select * from singer where englishName like '?%' ";
        return getBeanList(sql, initials);
    }

    @Override
    public Singer getSingerBySingerName(String singerName) {
        String sql = "select * from singer where name=?";
        return getBean(sql, singerName);
    }

    @Override
    public long getAllSingersCount(Map<String, String[]> condition) {
        String sql = "select count(*) from singer where 1=1";
        return getAllCount(sql, condition);
    }

    @Override
    public List<Singer> findSingersByPage(int start, int rows, Map<String, String[]> condition) {
        String sql = "select * from singer where 1=1";
        return findByPage(sql, start, rows, condition);
    }

    @Override
    public int updateSinger(Singer singer) {
        String sql = "update singer set accessCount=?, collectionCount=?, location=?, introduction=? where singerId=?";
        Object[] objects = {
                singer.getAccessCount(),
                singer.getCollectionCount(),
                singer.getLocation(),
                singer.getIntroduction(),
                singer.getSingerId()
        };

        return update(sql, objects);
    }

    @Override
    public int deleteSingerBySIngerId(int singerId) {
        String sql = "delete from singer where singerId=?";
        return update(sql, singerId);
    }

    @Override
    public int addSinger(Singer singer) {
        String sql = "insert into singer values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        return update(sql, JavaBeanUtils.beanToList(singer).toArray());
    }

    @Override
    public List<Singer> getAllSingers() {
        String sql = "select * from singer ORDER BY accessCount desc";
        return getBeanList(sql);
    }

    @Override
    public List<Singer> findSingersByName(String info) {
        String sql = "select * from singer where name like ?";
        info = "%" + info + "%";
        return getBeanList(sql, info);
    }

    @Override
    public int updateSingerAccessCountBySingerName(String singerName) {
        String sql = "update singer set accessCount=accessCount+1 where name=?";
        return update(sql, singerName);
    }

    @Override
    public Singer getSingerBySongId(Integer songId) {
        String sql = "select s.* from singer s, song where s.singerId=song.singerId and song.songId=?";
        return getBean(sql, songId);
    }
}
