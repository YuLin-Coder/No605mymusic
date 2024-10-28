package com.martinwj.mymusic.entity;

import java.util.List;

/**
 * @ClassName: PageBean
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-09 15:12
 *
 * 分页bean
 */
public class PageBean<T> {

    // 总记录数
    private int totalCount;
    // 总页码
    private int totalPage;
    // 每页的数据
    private List<T> list;
    // 当前页码
    private int currentPage;
    // 每页数据的条数
    private int rows;
    // 开始页数
    private int startPage;
    // 结束页数
    private int endPage;


    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", list=" + list +
                ", currentPage=" + currentPage +
                ", rows=" + rows +
                ", startPage=" + startPage +
                ", endPage=" + endPage +
                '}';
    }
}
