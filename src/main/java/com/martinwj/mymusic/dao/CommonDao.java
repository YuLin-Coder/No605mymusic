package com.martinwj.mymusic.dao;

import com.martinwj.mymusic.entity.Song;
import com.martinwj.mymusic.util.PageUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/14 9:45
 * @version: 1.0
 */
public abstract class CommonDao<T> extends BaseDao<T> {
    /**
     *  获取所有的数量
     * @param condition
     * @return
     */
    public long getAllCount(String sql, Map<String, String[]> condition) {
        StringBuilder sb = new StringBuilder(sql);
        // 定义参数集合
        List<Object> parms = new ArrayList<Object>();

        PageUtils.getSql(sb, condition, parms);

        System.out.println(sb.toString());
        System.out.println(parms);

        return (long) getValue(sb.toString(), parms.toArray());
    }

    /**
     * 分页条件查询
     * @param start 当前页
     * @param rows 每页的数据条数
     * @param condition 条件
     * @return
     */
    public List<T> findByPage(String sql, int start, int rows, Map<String, String[]> condition) {
        StringBuilder sb = new StringBuilder(sql);
        // 定义参数集合
        List<Object> parms = new ArrayList<Object>();

        PageUtils.getSql(sb, condition, parms);

        //添加分页查询
        sb.append(" limit ?,? ");
        //添加分页查询参数值
        parms.add(start);
        parms.add(rows);
        sql = sb.toString();

        System.out.println(sb.toString());
        System.out.println(parms);

        return getBeanList(sb.toString(), parms.toArray());
    }
}
