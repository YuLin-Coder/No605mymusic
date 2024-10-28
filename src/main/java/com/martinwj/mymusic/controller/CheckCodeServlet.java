package com.martinwj.mymusic.controller;

import com.martinwj.mymusic.util.ServletUtils;
import net.sf.json.JSONObject;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

/**
 * @ClassName: CheckCodeServlet
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-07 11:29
 */
@WebServlet("/checkCodeServlet")
public class CheckCodeServlet extends HttpServlet {

    Random ran = new Random();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghigklmnopqrstuvwxyz0123456789";

        StringBuilder code = new StringBuilder();
        for (int i = 1; i <= 4; i++) {
            int index = ran.nextInt(str.length());
            //获取字符
            char ch = str.charAt(index);//随机字符
            //2.3写验证码
            code.append(ch);
        }
        HttpSession session = request.getSession();
        session.setAttribute("code", code.toString());
        System.out.println(session.getAttribute("code"));

        JSONObject object = new JSONObject();
        object.put("code", code.toString());

        // 设置输出字符类型和默认编码
//        response.setCharacterEncoding("utf-8");
//        response.setContentType("application/json; charset=utf-8");
//        PrintWriter writer = response.getWriter();
//        writer.print(object);
        ServletUtils.sendToPage(response, object.toString());

    }

    private void testCode(HttpServletResponse response) throws IOException {
        int width = 100;
        int height = 55;

        //1.创建一对象，在内存中图片(验证码图片对象)
        BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);

        //2.美化图片
        //2.1 填充背景色
        Graphics g = image.getGraphics();//画笔对象
        g.setColor(Color.PINK);//设置画笔颜色
        g.fillRect(0,0,width,height);

        //2.2画边框
        g.setColor(Color.BLUE);
        g.drawRect(0,0,width - 1,height - 1);

        String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghigklmnopqrstuvwxyz0123456789";
        //生成随机角标

        StringBuilder code = new StringBuilder();
        for (int i = 1; i <= 4; i++) {
            int index = ran.nextInt(str.length());
            //获取字符
            char ch = str.charAt(index);//随机字符
            g.setColor(randomColor());//随机颜色
            g.setFont(randomFont());//随机字体
            //2.3写验证码
            g.drawString(ch+"",width/5*i,height/2);
            code.append(ch);
        }


        //2.4画干扰线
        g.setColor(Color.GREEN);
        //随机生成坐标点
        for (int i = 0; i < 10; i++) {
            int x1 = ran.nextInt(width);
            int x2 = ran.nextInt(width);
            int y1 = ran.nextInt(height);
            int y2 = ran.nextInt(height);
            g.drawLine(x1,y1,x2,y2);//画线
        }

        //画干扰点
        for (int i = 0; i < 10; i++) {
            g.setColor(randomColor());//随机颜色
            int x1 = ran.nextInt(width);
            int y1 = ran.nextInt(height);
            g.drawOval(x1,y1,2,2);//画点
        }
        System.out.println(code.toString());

        //3.将图片输出到页面展示
        ImageIO.write(image,"jpg",response.getOutputStream());
    }


    //生成随机颜色
    private Color randomColor(){

        int red = ran.nextInt(255);
        int green = ran.nextInt(255);
        int blue = ran.nextInt(255);
        return new Color(red,green,blue);
    }

    //生辰随机字体
    private Font randomFont(){
        String[] fontNames= {"宋体", "华文楷体", "黑体", "微软雅黑", "楷体_GB2312"};
        int index = ran.nextInt(fontNames.length);
        String fontName = fontNames[index];
        int style = ran.nextInt(4);
        int size=ran.nextInt(5)+ 24;
        return new Font(fontName,style,size);
    }

//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // 设置响应的类型格式为图片格式
//        response.setContentType("image/jpeg");
//        //禁止图像缓存。
//        response.setHeader("Pragma", "no-cache");
//        response.setHeader("Cache-Control", "no-cache");
//        response.setDateHeader("Expires", 0);
//        HttpSession session = request.getSession();
//        //1.创建一对象，在内存中图片(验证码图片对象)
////        BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
//
//        CreateImageCode vCode = new CreateImageCode(180,55,4,10);
//        String code = vCode.getCode();
//        session.setAttribute("code", code);
//        System.out.println(code);
//        vCode.write(response.getOutputStream());
//    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
