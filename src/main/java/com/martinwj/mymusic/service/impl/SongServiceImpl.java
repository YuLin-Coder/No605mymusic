package com.martinwj.mymusic.service.impl;

import com.martinwj.mymusic.dao.SongDao;
import com.martinwj.mymusic.dao.impl.SongDaoImpl;
import com.martinwj.mymusic.entity.PageBean;
import com.martinwj.mymusic.entity.Song;
import com.martinwj.mymusic.entity.Type;
import com.martinwj.mymusic.service.CommonService;
import com.martinwj.mymusic.service.SongService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: SongServiceImpl
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-09 17:08
 */
public class SongServiceImpl extends CommonService<Song> implements SongService {

    private SongDao songDao = null;

    public SongServiceImpl(){
        songDao = new SongDaoImpl();
    }

    @Override
    public int addSong(Song song) {
        return songDao.addSong(song);
    }

    @Override
    public Song getSongById(int id) {
        return songDao.findSongById(id);
    }

    @Override
    public long getAllSongsCount(Map<String, String[]> condition) {
        return songDao.getAllSongsCount(condition);
    }

    @Override
    public PageBean<Song> findSongsByPage(String _currentPage, String _rows, Map<String, String[]> condition) {
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);
        if(currentPage <= 0){
            currentPage = 1;
        }
        int totalCount = Math.toIntExact(songDao.getAllSongsCount(condition));
        int start = (currentPage - 1) * rows;
        List<Song> list = songDao.findSongsByPage(start, rows, condition);

        return findByPage(currentPage, rows, condition, totalCount, start, list);

//        int currentPage = Integer.parseInt(_currentPage);
//        int rows = Integer.parseInt(_rows);
//
//        if(currentPage <= 0){
//            currentPage = 1;
//        }
//        //1.创建空的PageBean对象
//        PageBean<Song> pageBean = new PageBean<Song>();
//        //2.设置参数
//        pageBean.setCurrentPage(currentPage);
//        pageBean.setRows(rows);
//
//        //3.调用dao查询总记录数
//        int totalCount = Math.toIntExact(songDao.getAllSongsCount(condition));
//        pageBean.setTotalCount(totalCount);
//
//        //4.调用dao查询List集合
//        //计算开始的记录索引
//        int start = (currentPage - 1) * rows;
//        List<Song> list = songDao.findSongsByPage(start, rows, condition);
//        pageBean.setList(list);
//
//        //5.计算总页码
//        int totalPage = (totalCount % rows)  == 0 ? totalCount/rows : (totalCount/rows) + 1;
//        pageBean.setTotalPage(totalPage);
//
//        // 计算页面显示的起始页数和结束页数
//        int startPage = 0, endPage = 0;
//        if(totalPage > 5){
//            if(currentPage > 3) {
//                if (currentPage + 2 <= totalPage) {
//                    startPage = currentPage - 2;
//                    endPage = currentPage + 2;
//                } else {
//                    endPage = totalPage;
//                    startPage = totalPage - 5;
//                }
//            }else {
//                startPage = 1;
//                endPage = 5;
//            }
//        } else {
//            startPage = 1;
//            endPage = totalPage;
//        }
//
//        pageBean.setStartPage(startPage);
//        pageBean.setEndPage(endPage);
//
//        return pageBean;

    }

    @Override
    public int updateSong(Song song) {
        return songDao.updateSong(song);
    }

    @Override
    public List<Integer> deleteSongBySongId(String[] ids) {
        List<Integer> list = new ArrayList<Integer>();
        // 遍历所有的ID，然后去删除
        for(int i = 0; i < ids.length; i++) {
            list.add(songDao.deleteSong(Integer.parseInt(ids[i])));
        }
        return list;
    }

    @Override
    public Integer deleteSongBySongId(String id) {
        return songDao.deleteSong(Integer.parseInt(id));
    }

    @Override
    public Integer deleteSongBySongId(int id) {
        return songDao.deleteSong(id);
    }

    @Override
    public Song getSongByName(String value) {
        return songDao.findSongByName(value);
    }

    @Override
    public List<Song> getSongBySingerName(int start, int rows, String singerName) {
        return songDao.findSongBySingerName(start, rows, singerName);
    }

    @Override
    public long getAllSongsCountBySingerName(String singerName) {
        return songDao.getAllSongsCountBySingerName(singerName);
    }

    @Override
    public long getAllSongsCountByType(String songType) {
        return songDao.findSongsCountByType(songType);
    }

    @Override
    public List<Song> getSongByType(int start, int rows, String songType) {
        return songDao.findSongsByType(start, rows, songType);
    }

    @Override
    public List<Song> getSongBySingerId(int singerId) {
        return songDao.findSongBySingerId(singerId);
    }

    @Override
    public List<Song> getSongByNameLike(String name) {
        return songDao.findSongByNameLike(name);
    }

    @Override
    public int addPlayCountBySongId(int songId) {
        return songDao.addPlayCountBySongId(songId);
    }

    @Override
    public List<Song> getNewMusic(int i) {
        return songDao.getNewMusic(i);
    }

    @Override
    public List<Song> getSongByTypeWithRank(Type type, double playCountWeight, double downloadCountWeight, double collectionCountWeight, int num) {
        return songDao.getSongByTypeWithRank(type, playCountWeight, downloadCountWeight, collectionCountWeight, num);
    }
}
