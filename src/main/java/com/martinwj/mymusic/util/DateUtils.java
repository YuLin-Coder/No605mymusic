package com.martinwj.mymusic.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/12 10:52
 * @version: 1.0
 */
public class DateUtils {

    /**
     * 获取时间字符串
     * @param date
     * @return
     */
    public static String getDateString(Date date){
        DateFormat dt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dt.format(date);
    }

    /**
     * 获取当前的时间字符串
     * @return
     */
    public static String getDateString() {
        return getDateString(new Date());
    }
}
