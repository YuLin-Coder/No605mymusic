package com.martinwj.mymusic.dao;

import com.martinwj.mymusic.entity.Song;
import com.martinwj.mymusic.entity.Type;

import java.util.List;
import java.util.Map;

/**
 * @ClassName: SongDao
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-09 17:10
 */
public interface SongDao {

    /**
     * 添加一首歌曲到数据库
     * @param song
     * @return
     */
    int addSong(Song song);

    /**
     * 通过songID查找Song
     * @param id
     * @return
     */
    Song findSongById(int id);

    /**
     * 通过歌手ID查找歌曲
     * @param singerId
     * @return
     */
    List<Song> findSongBySingerId(int singerId);

    /**
     * 获取所以所有的音乐数量
     * @return
     */
    Long getAllSongsCount(Map<String, String[]> condition);

    /**
     * 分页条件查询
     * @param start 当前页
     * @param rows 每页的数据条数
     * @param condition 条件
     * @return
     */
    List<Song> findSongsByPage(int start, int rows, Map<String, String[]> condition);

    /**
     *
     * @param songId
     * @return
     */
    int deleteSong(int songId);

    /**
     * 根据ID去修改歌曲信息
     * @param song
     * @return 修改结果
     */
    int updateSong(Song song);

    /**
     * 根据歌名，查找歌曲
     * @param value
     * @return
     */
    Song findSongByName(String value);

    /**
     * 获取某歌手的所有的歌曲
     * @param singerName
     * @return
     */
    List<Song> findSongBySingerName(int start, int rows, String singerName);

    /**
     * 根据歌手名称，查找所有歌曲
     * @param singerName
     * @return
     */
    long getAllSongsCountBySingerName(String singerName);

    /**
     * 根据歌曲类型获取歌曲数量
     * @param songType
     * @return
     */
    long findSongsCountByType(String songType);

    /**
     * 根据类型查找音乐
     * @param start
     * @param rows
     * @param songType
     * @return
     */
    List<Song> findSongsByType(int start, int rows, String songType);

    /**
     * 根据歌曲、歌手、类型名称模糊查询
     * @param name 名称
     * @return
     */
    List<Song> findSongByNameLike(String name);

    /**
     * 根据歌曲ID增加播放次数
     * @param songId
     */
    int addPlayCountBySongId(int songId);

    /**
     * 获取i首音乐信息
     * @param i
     * @return
     */
    List<Song> getNewMusic(int i);

    /**
     * 根据歌曲类型 以及播放次数、下载次数、收藏次数的权重比例查询前 num 条数据
     * 播放次数、下载次数、收藏次数的权重 和为1
     * @param type 歌曲类型
     * @param playCountWeight 播放次数权重
     * @param downloadCountWeight 下载次数的权重
     * @param collectionCountWeight 收藏次数的权重值
     * @param num 查询几条数据
     * @return
     */
    List<Song> getSongByTypeWithRank(Type type, double playCountWeight, double downloadCountWeight, double collectionCountWeight, int num);
}
