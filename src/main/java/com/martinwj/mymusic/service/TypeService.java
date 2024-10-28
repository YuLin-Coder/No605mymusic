package com.martinwj.mymusic.service;

import com.martinwj.mymusic.entity.Type;

import java.util.List;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/16 17:32
 * @version: 1.0
 */
public interface TypeService {
    /**
     * 新增音乐类型
     * @param type
     * @return
     */
    int addType(Type type);

    /**
     * 获取所有的 音乐类型
     * @return
     */
    List<Type> getAllTypes();

    /**
     * 根据类型名称查找类型
     * @param name
     * @return
     */
    Type getTypeByName(String name);

    /**
     * 根据ID删除类型
     * @param id 类型ID
     * @return
     */
    int delTypeById(int id);

    /**
     * 根据类型名删除类型
     * @param name
     * @return
     */
    int delTypeByName(String name);

    /**
     * 根据ID更新类型名
     * @param type
     * @return
     */
    int updateTypeById(Type type);

    /**
     * 根据类型名更新类型数量
     * @param name
     * @param flag 为true时，表示数量+1，为false时表示数量-1
     * @return
     */
    int updateTypeByName(String name, boolean flag);

    /**
     * 获取最近歌曲数量前 i 的歌曲类型
     * @param i
     * @return
     */
    List<Type> getTypesBySongCount(int i);
}
