package com.martinwj.mymusic.dao.impl;

import com.martinwj.mymusic.dao.BaseDao;
import com.martinwj.mymusic.dao.TypeDao;
import com.martinwj.mymusic.entity.Type;
import com.martinwj.mymusic.util.JavaBeanUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/16 17:26
 * @version: 1.0
 */
public class TypeDaoImpl extends BaseDao<Type> implements TypeDao {
    @Override
    public int addType(Type type) {
        String sql = "insert into type values(?, ?, ?)";
        return update(sql, JavaBeanUtils.beanToList(type).toArray());
    }

    @Override
    public List<Type> getAllTypes() {
        String sql = "select * from type";
        return getBeanList(sql);
    }

    @Override
    public Type getTypeByName(String name) {
        String sql = "select * from type where name=?";
        return getBean(sql, name);
    }

    @Override
    public int delTypeById(int id) {
        String sql = "delete from type where typeId=?";
        return update(sql, id);
    }

    @Override
    public int delTypeByName(String name) {
        String sql = "delete from type where name=?";
        return update(sql, name);
    }

    @Override
    public int updateTypeById(Type type) {
        String sql = "update type set name=?, songCount=? where typeId=?";
        List<Object> list = new ArrayList<>();
        list.add(type.getName());
        list.add(type.getSongCount());
        list.add(type.getTypeId());
        return update(sql, list.toArray());
    }

    @Override
    public int updateTypeByName(String name, boolean flag) {
        String sql;
        if(flag){
            sql = "update type set songCount=songCount+1 where name=?";
        } else {
            sql = "update type set songCount=songCount-1 where name=?";
        }
        return update(sql, name);
    }

    @Override
    public List<Type> getTypesBySongCount(int i) {
        String sql = "select * from type where songCount >= 5 order by songCount limit 0, ?";
        return getBeanList(sql, i);
    }
}
