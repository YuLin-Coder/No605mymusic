package com.martinwj.mymusic.dao.impl;

import com.martinwj.mymusic.dao.BaseDao;
import com.martinwj.mymusic.dao.CommonDao;
import com.martinwj.mymusic.dao.SongDao;
import com.martinwj.mymusic.entity.Song;
import com.martinwj.mymusic.entity.Type;
import com.martinwj.mymusic.util.JavaBeanUtils;
import com.martinwj.mymusic.util.PageUtils;
import org.junit.Test;

import java.util.*;

/**
 * @ClassName: SongDaoImpl
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-09 17:14
 */
public class SongDaoImpl extends CommonDao<Song> implements SongDao {

    @Override
    public int addSong(Song song) {
        String sql = "insert into song values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        return update(sql, JavaBeanUtils.beanToList(song).toArray());
    }

    @Override
    public Song findSongById(int id) {
        String sql = "select * from song where songId=?";
        return getBean(sql, id);
    }

    @Override
    public List<Song> findSongBySingerId(int singerId) {
        String sql = "select * from song where singerId=?";
        return getBeanList(sql, singerId);
    }

    @Override
    public Long getAllSongsCount(Map<String, String[]> condition) {
        String sql = "select count(*) from song where 1=1";
        return getAllCount(sql ,condition);
    }

    @Override
    public List<Song> findSongsByPage(int start, int rows, Map<String, String[]> condition) {
        String sql = "select * from song where 1=1";
        return findByPage(sql, start, rows, condition);
    }

    @Override
    public int deleteSong(int songId) {
        String sql = "delete from song where songId=?";
        return update(sql, songId);
    }

    @Override
    public int updateSong(Song song) {
        String sql = "update song set playCount=?, downloadCount=?, collectionCount=?, updateDate=?, lyric=?, type=? where songId=?";
        Object[] objects = {
                song.getPlayCount(),
                song.getDownloadCount(),
                song.getCollectionCount(),
                song.getUpdateDate(),
                song.getLyric(),
                song.getType(),
                song.getSongId()
        };
        int flag = update(sql, objects);
        System.out.println(flag);
        return flag;
    }

    @Override
    public Song findSongByName(String value) {
        String sql = "select * from song where name=?";
        return getBean(sql, value);
    }

    @Override
    public List<Song> findSongBySingerName(int start, int rows, String singerName) {
        String sql = "select * from song where singerName=? limit ?, ? ";
        List<Object> list = new ArrayList<Object>();
        list.add(singerName);
        list.add(start);
        list.add(rows);
        return getBeanList(sql, list.toArray());
    }

    @Override
    public long getAllSongsCountBySingerName(String singerName) {
        String sql = "select count(*) from song where singerName=?";
        return (long) getValue(sql, singerName);
    }

    @Override
    public long findSongsCountByType(String songType) {
        String sql = "select count(*) from song where type like ?";
        String param = "%" + songType + "%";
        return (long) getValue(sql, param);
    }

    @Override
    public List<Song> findSongsByType(int start, int rows, String songType) {
        String sql = "select * from song where type like ? limit ?, ? ";
        List<Object> list = new ArrayList<Object>();
        list.add("%" + songType + "%");
        list.add(start);
        list.add(rows);
        return getBeanList(sql, list.toArray());
    }

    @Override
    public List<Song> findSongByNameLike(String name) {
        String sql = "select * from song where 1=1 and ((name like ?) or (singerName like ?) or (type like ?))";
        List<Object> list = new ArrayList<Object>();
        name = "%" + name + "%";
        list.add(name);
        list.add(name);
        list.add(name);
        return getBeanList(sql, list.toArray());
    }

    @Override
    public int addPlayCountBySongId(int songId) {
        String sql = "update song set playCount=playCount+1 where songId=?";
        return update(sql, songId);
    }

    @Override
    public List<Song> getNewMusic(int i) {
        String sql = "SELECT * FROM song ORDER BY updateDate desc limit 0, ?";
        return getBeanList(sql, i);
    }

    @Override
    public List<Song> getSongByTypeWithRank(Type type, double playCountWeight, double downloadCountWeight, double collectionCountWeight, int num) {
        String sql = "select * from song where type like ? order by (playCount * ? + downloadCount * ? + collectionCount * ? ) desc limit 0, ?";
        List<Object> list = new ArrayList<>();
        list.add("%" + type.getName() + "%");
        list.add(playCountWeight);
        list.add(downloadCountWeight);
        list.add(collectionCountWeight);
        list.add(num);
        return getBeanList(sql, list.toArray());
    }
}
