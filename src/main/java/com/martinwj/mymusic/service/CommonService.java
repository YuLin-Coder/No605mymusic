package com.martinwj.mymusic.service;

import com.martinwj.mymusic.dao.CommonDao;
import com.martinwj.mymusic.entity.PageBean;
import com.martinwj.mymusic.entity.Song;

import java.util.List;
import java.util.Map;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/14 9:57
 * @version: 1.0
 */
public abstract class CommonService<T> {

    /**
     * 分页条件查询
     * @param currentPage 当前页
     * @param rows 每页数据的条数
     * @param condition 条件
     * @param totalCount 总页数
     * @Param start 分页条 开始的页数
     * @param list 当前页的数据
     * @return
     */
    public PageBean<T> findByPage(int currentPage, int rows, Map<String, String[]> condition, int totalCount, int start, List<T> list) {

        //1.创建空的PageBean对象
        PageBean<T> pageBean = new PageBean<T>();
        //2.设置参数
        pageBean.setCurrentPage(currentPage);
        pageBean.setRows(rows);

        //3.调用dao查询总记录数
        pageBean.setTotalCount(totalCount);

        //4.调用dao查询List集合
        //计算开始的记录索引
        pageBean.setList(list);

        //5.计算总页码
        int totalPage = (totalCount % rows)  == 0 ? totalCount/rows : (totalCount/rows) + 1;
        pageBean.setTotalPage(totalPage);

        // 计算页面显示的起始页数和结束页数
        int startPage = 0, endPage = 0;
        if(totalPage > 5){
            if(currentPage > 3) {
                if (currentPage + 2 <= totalPage) {
                    startPage = currentPage - 2;
                    endPage = currentPage + 2;
                } else {
                    endPage = totalPage;
                    startPage = totalPage - 5;
                }
            }else {
                startPage = 1;
                endPage = 5;
            }
        } else {
            startPage = 1;
            endPage = totalPage;
        }

        pageBean.setStartPage(startPage);
        pageBean.setEndPage(endPage);

        return pageBean;

    }

}
