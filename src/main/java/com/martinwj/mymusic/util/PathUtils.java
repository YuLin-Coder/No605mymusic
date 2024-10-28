package com.martinwj.mymusic.util;

import java.net.URL;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/12 10:46
 * @version: 1.0
 */
public class PathUtils {

    /**
     * 获取项目根目录地址
     * @return
     */
    public String getPath(){
        URL url = getClass().getProtectionDomain().getCodeSource().getLocation();
        String str = url.toString();
        int end = url.toString().indexOf("WEB-INF");
        int start = url.toString().indexOf("/") + 1;
        return str.substring(start, end);
    }

    public static String getProjectURL(){
        return new PathUtils().getPath();
    }

}
