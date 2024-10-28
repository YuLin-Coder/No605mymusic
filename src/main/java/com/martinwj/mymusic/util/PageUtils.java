package com.martinwj.mymusic.util;

import com.martinwj.mymusic.service.SingerService;
import com.martinwj.mymusic.service.impl.SingerServiceImpl;
import com.martinwj.mymusic.service.impl.SongServiceImpl;

import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @ClassName: PageUtils
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-09 17:26
 */
public class PageUtils {

    public static void getSql(StringBuilder sb, Map<String, String[]> condition, List<Object> parms){

        if(condition == null){
            return ;
        }

        // 遍历map集合
        Set<String> keySet = condition.keySet();
        for(String key : keySet){
            //排除分页条件参数
            if("currentPage".equals(key) || "rows".equals(key)){
                continue;
            }
            // 获取value
            String value = condition.get(key)[0];
            //判断value是否有值
            if(value != null && !"".equals(value)) {
                if(key.equals("singerName")){
                    key = "singerId";
                    SingerService service = new SingerServiceImpl();
                    value = String.valueOf(service.getSingerBySingerName(value).getSingerId());
                }
                if(key.equals("accessCount") || key.equals("collectionCount")
                    || key.equals("downloadCount") || key.equals("playCount")){
                    sb.append(" and " + key + " >= ?");
                    parms.add(value);
                } else {
                    //有值
                    sb.append(" and " + key + " like ? ");
                    // ? 条件的值
                    parms.add("%" + value + "%");
                }
            }
        }
    }

}
