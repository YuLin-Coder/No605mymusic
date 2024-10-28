package com.martinwj.mymusic.service;

import com.martinwj.mymusic.entity.PageBean;
import com.martinwj.mymusic.entity.Song;
import com.martinwj.mymusic.entity.Type;

import java.util.List;
import java.util.Map;

/**
 * @ClassName: SongService
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-09 15:40
 */
public interface SongService {
    /**
     * 添加歌曲
     * @param song
     * @return
     */
    int addSong(Song song);

    /**
     * 通过ID去查找歌曲
     * @param id
     * @return
     */
    Song getSongById(int id);

    /**
     * 获取所以所有的音乐数量
     * @return
     */
    long getAllSongsCount(Map<String, String[]> condition);

    /**
     * 分页条件查询
     * @param currentPage 当前页
     * @param rows 每页的数据条数
     * @param condition 条件
     * @return
     */
    PageBean<Song> findSongsByPage(String currentPage, String rows, Map<String, String[]> condition);

    /**
     * 修改歌曲信息
     * @param song
     * @return
     */
    int updateSong(Song song);

    /**
     * 根据歌曲ID删除歌曲
     * @param ids 歌曲ID列表
     * @return
     */
    List<Integer> deleteSongBySongId(String[] ids);

    /**
     * 根据歌曲ID删除歌曲
     * @param id 歌曲ID
     * @return
     */
    Integer deleteSongBySongId(String id);

    /**
     * 根据歌曲ID删除歌曲
     * @param id 歌曲ID
     * @return
     */
    Integer deleteSongBySongId(int id);

    /**
     * 根据歌名查找歌曲
     * @param value
     * @return
     */
    Song getSongByName(String value);

    /**
     * 获取某歌手的所有的歌曲
     * @param singerName
     * @return
     */
    List<Song> getSongBySingerName(int start, int rows, String singerName);

    /**
     * 根据歌手名称，查找所有歌曲
     * @param singerName
     * @return
     */
    long getAllSongsCountBySingerName(String singerName);

    /**
     * 根据类型查找音乐数量
     * @param songType
     * @return
     */
    long getAllSongsCountByType(String songType);

    /**
     * 根据类型查找所有音乐列表
     * @param start
     * @param rows
     * @param songType
     * @return
     */
    List<Song> getSongByType(int start, int rows, String songType);

    /**
     * 根据歌手编号获得歌曲信息
     * @param singerId
     * @return
     */
    List<Song> getSongBySingerId(int singerId);

    /**
     * 根据名称 进行 模糊查询 歌曲信息
     * @param name 名称
     * @return
     */
    List<Song> getSongByNameLike(String name);

    /**
     * 根据歌曲编号增加播放数量
     * @param songId
     */
    int addPlayCountBySongId(int songId);

    /**
     * 获取i数量的音乐
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
