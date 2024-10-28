package com.martinwj.mymusic.service.impl;

import com.martinwj.mymusic.dao.TypeDao;
import com.martinwj.mymusic.dao.impl.TypeDaoImpl;
import com.martinwj.mymusic.entity.Type;
import com.martinwj.mymusic.service.TypeService;

import java.util.List;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/16 17:33
 * @version: 1.0
 */
public class TypeServiceImpl implements TypeService {

    private TypeDao typeDao = null;

    public TypeServiceImpl(){
        typeDao = new TypeDaoImpl();
    }

    @Override
    public int addType(Type type) {
        return typeDao.addType(type);
    }

    @Override
    public List<Type> getAllTypes() {
        return typeDao.getAllTypes();
    }

    @Override
    public Type getTypeByName(String name) {
        return typeDao.getTypeByName(name);
    }

    @Override
    public int delTypeById(int id) {
        return typeDao.delTypeById(id);
    }

    @Override
    public int delTypeByName(String name) {
        return typeDao.delTypeByName(name);
    }

    @Override
    public int updateTypeById(Type type) {
        return typeDao.updateTypeById(type);
    }

    @Override
    public int updateTypeByName(String name, boolean flag) {
        return typeDao.updateTypeByName(name, flag);
    }

    @Override
    public List<Type> getTypesBySongCount(int i) {
        return typeDao.getTypesBySongCount(i);
    }
}
