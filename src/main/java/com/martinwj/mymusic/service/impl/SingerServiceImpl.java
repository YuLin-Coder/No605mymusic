package com.martinwj.mymusic.service.impl;

import com.martinwj.mymusic.dao.SingerDao;
import com.martinwj.mymusic.dao.impl.SingerDaoImpl;
import com.martinwj.mymusic.entity.PageBean;
import com.martinwj.mymusic.entity.Singer;
import com.martinwj.mymusic.entity.Song;
import com.martinwj.mymusic.service.CommonService;
import com.martinwj.mymusic.service.SingerService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: SingerServiceImpl
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-10 11:17
 */
public class SingerServiceImpl extends CommonService<Singer> implements SingerService {

    private SingerDao singerDao = null;

    public SingerServiceImpl(){
        singerDao = new SingerDaoImpl();
    }

    @Override
    public Singer getSingerBySingerId(int singerId) {
        return singerDao.getSingerBySingerId(singerId);
    }

    @Override
    public List<Singer> getSingerByEnglishName(String initials) {
        return singerDao.getSingerByEnglishName(initials);
    }

    @Override
    public Singer getSingerBySingerName(String singerName) {
        return singerDao.getSingerBySingerName(singerName);
    }

    @Override
    public long getAllSingersCount(Map<String, String[]> condition) {
        return singerDao.getAllSingersCount(condition);
    }

    @Override
    public PageBean<Singer> findSingersByPage(String _currentPage, String _rows, Map<String, String[]> condition) {
        int currentPage = Integer.parseInt(_currentPage);
        int rows = Integer.parseInt(_rows);

        if(currentPage <= 0){
            currentPage = 1;
        }

        int totalCount = Math.toIntExact(singerDao.getAllSingersCount(condition));

        //4.调用dao查询List集合
        //计算开始的记录索引
        int start = (currentPage - 1) * rows;
        List<Singer> list = singerDao.findSingersByPage(start, rows, condition);

        return findByPage(currentPage, rows, condition, totalCount, start, list);
    }

    @Override
    public int updateSinger(Singer singer) {
        return singerDao.updateSinger(singer);
    }

    @Override
    public List<Integer> deleteSingerBySingerId(String[] ids) {
        List<Integer> list = new ArrayList<Integer>();
        // 遍历所有的ID，然后去删除
        for(int i = 0; i < ids.length; i++) {
            list.add(singerDao.deleteSingerBySIngerId(Integer.parseInt(ids[i])));
        }
        return list;
    }

    @Override
    public int addSinger(Singer singer) {
        return singerDao.addSinger(singer);
    }

    @Override
    public List<Singer> getAllSingers() {
        return singerDao.getAllSingers();
    }

    @Override
    public List<Singer> getSingerByName(String info) {
        return singerDao.findSingersByName(info);
    }

    @Override
    public int updateSingerAccessCountBySingerName(String singerName) {
        return singerDao.updateSingerAccessCountBySingerName(singerName);
    }

    @Override
    public Singer getSingerBySongId(Integer songId) {
        return singerDao.getSingerBySongId(songId);
    }
}
