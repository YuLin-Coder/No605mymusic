package com.martinwj.mymusic.util;

import org.apache.commons.beanutils.PropertyUtilsBean;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;

/**
 * @ClassName: JavaBeanUtils
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-09 17:45
 */
public class JavaBeanUtils {

    /**
     * 将javaBean对象转为列表
     * @param obj JavaBean对象
     * @return 数组
     */
    public static <T> ArrayList beanToList(T obj){
        ArrayList<String> list=new ArrayList<String>();
        if (obj == null)
            return null;
        Field[] fields = obj.getClass().getDeclaredFields();
        System.out.println(Arrays.toString(fields));
        try {
            for(int i = 0; i < fields.length; i++){
                try {
                    Field f = obj.getClass().getDeclaredField(fields[i].getName());
                    f.setAccessible(true);
                    T o = (T) f.get(obj);
                    System.out.println(o);
                    if(o != null) {
                        list.add(o.toString());
                    } else {
                        list.add(null);
                    }
                } catch (NoSuchFieldException | IllegalArgumentException | IllegalAccessException e) {
                    e.printStackTrace();
                }
            }
        } catch (SecurityException e) {
            e.printStackTrace();
        }
        System.out.println(list.size());
        return list;
    }

    //将javabean实体类转为map类型，然后返回一个map类型的值
    public static <T> HashMap<String, T> beanToMap(T obj) {
        HashMap<String, T> params = new HashMap<String, T>(0);
        try {
            PropertyUtilsBean propertyUtilsBean = new PropertyUtilsBean();
            PropertyDescriptor[] descriptors = propertyUtilsBean.getPropertyDescriptors(obj);
            for (int i = 0; i < descriptors.length; i++) {
                String name = descriptors[i].getName();
                if (!"class".equals(name)) {
                    params.put(name, (T) propertyUtilsBean.getNestedProperty(obj, name));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return params;
    }

    /**
     * 根据属性，获取get方法
     * @param ob 对象
     * @param name 属性名
     * @return
     * @throws Exception
     */
    public static Object getGetMethod(Object ob , String name)throws Exception{
        Method[] m = ob.getClass().getMethods();
        for(int i = 0; i < m.length; i++){
            if(("get" + name).toLowerCase().equals(m[i].getName().toLowerCase())){
                return m[i].invoke(ob);
            }
        }
        return null;
    }

    /**
     * 根据属性，拿到set方法，并把值set到对象中
     * @param obj 对象
     * @param clazz 对象的class
     * @param filedName 需要设置值得属性
     * @param typeClass
     * @param value
     */
    public static void setValue(Object obj,Class<?> clazz, String filedName, Class<?> typeClass, Object value){
        filedName = removeLine(filedName);
        String methodName = "set" + filedName.substring(0,1).toUpperCase()+filedName.substring(1);
        try{
            Method method =  clazz.getDeclaredMethod(methodName, new Class[]{typeClass});
            method.invoke(obj, new Object[]{getClassTypeValue(typeClass, value)});
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }

    /**
     * 通过class类型获取获取对应类型的值
     * @param typeClass class类型
     * @param value 值
     * @return Object
     */
    private static Object getClassTypeValue(Class<?> typeClass, Object value){
        if(typeClass == int.class  || value instanceof Integer){
            if(null == value){
                return 0;
            }
            return value;
        }else if(typeClass == short.class){
            if(null == value){
                return 0;
            }
            return value;
        }else if(typeClass == byte.class){
            if(null == value){
                return 0;
            }
            return value;
        }else if(typeClass == double.class){
            if(null == value){
                return 0;
            }
            return value;
        }else if(typeClass == long.class){
            if(null == value){
                return 0;
            }
            return value;
        }else if(typeClass == String.class){
            if(null == value){
                return "";
            }
            return value;
        }else if(typeClass == boolean.class){
            if(null == value){
                return true;
            }
            return value;
        }else if(typeClass == BigDecimal.class){
            if(null == value){
                return new BigDecimal(0);
            }
            return new BigDecimal(value+"");
        }else {
            return typeClass.cast(value);
        }
    }
    /**
     * 处理字符串  如：  abc_dex ---> abcDex
     * @param str
     * @return
     */
    public static  String removeLine(String str){
        if(null != str && str.contains("_")){
            int i = str.indexOf("_");
            char ch = str.charAt(i+1);
            char newCh = (ch+"").substring(0, 1).toUpperCase().toCharArray()[0];
            String newStr = str.replace(str.charAt(i+1), newCh);
            String newStr2 = newStr.replace("_", "");
            return newStr2;
        }
        return str;
    }



}
