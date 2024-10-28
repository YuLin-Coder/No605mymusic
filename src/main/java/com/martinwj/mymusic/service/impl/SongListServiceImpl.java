package com.martinwj.mymusic.service.impl;

import com.martinwj.mymusic.dao.SongListDao;
import com.martinwj.mymusic.dao.impl.SongListDaoImpl;
import com.martinwj.mymusic.service.SongListService;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/18 14:52
 * @version: 1.0
 */
public class SongListServiceImpl implements SongListService {

    private SongListDao songListDao = null;

    public SongListServiceImpl() {
        songListDao = new SongListDaoImpl();
    }

}
