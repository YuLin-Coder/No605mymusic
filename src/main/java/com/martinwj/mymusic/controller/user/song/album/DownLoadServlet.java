package com.martinwj.mymusic.controller.user.song.album;

import com.martinwj.mymusic.entity.Song;
import com.martinwj.mymusic.service.SongService;
import com.martinwj.mymusic.service.impl.SongServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

/**
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/17 17:26
 * @version: 1.0
 */
@WebServlet("/user/person/downLoadServlet")
public class DownLoadServlet extends HttpServlet {

    private SongService songService = null;



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //设置响应消息编码
        response.setCharacterEncoding("utf-8");
        //获取下载的文件信息
        String idStr = request.getParameter("songId");
        System.out.println("作品id：" + idStr);
        int songId = Integer.parseInt(idStr);

        //从数据库找到该文件信息
        Song song = songService.getSongById(songId);

        //获取所要下载的文件名称
        String absPath = request.getSession().getServletContext().getRealPath("");
        System.out.println(absPath);
        String filepath = absPath + "/" + song.getUrl();
        //对文件名称编码
//  		filename = new String(filename.trim().getBytes("iso8859-1"),"UTF-8");
        System.out.println("需要下载的文件路径为：" + filepath);


//        //得到要下载的文件
        File file = new File(filepath);
        System.out.println("文件是否存在：" + file.exists());
        //如果文件不存在
        if (!file.exists()) {
            request.setAttribute("titleMsg", "哎呀！");
            request.setAttribute("textMsg", "出了些问题，您要下载的资源不存在了！");
            String url = request.getContextPath() + "/page/user/album-single.jsp";
            request.setAttribute("urlMsg", url);
            request.setAttribute("pageMsg", "歌曲列表");
            request.setAttribute("codeMsg", "");
            request.getRequestDispatcher("/page/user/message.jsp").forward(request, response);
            return;
        }
        //改变下载量
        System.out.println("改变下载量之前：" + song.getDownloadCount());
        song.setDownloadCount(song.getDownloadCount() + 1);
        System.out.println("改变下载量之后：" + song.getDownloadCount());

        int flag = songService.updateSong(song);
        System.out.println("下载量改变是否成功：" + flag);
        if (flag > 0) {
//        	//下载文件所在目录
//            String folder = "WebContent/download/";
            //处理文件名
            String realname = song.getName() + ".mp3";
            //设置响应头，控制浏览器下载该文件
            response.setContentType("application/x-msdownload");
            response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(realname, "UTF-8"));
            //读取要下载的文件，保存到文件输入流
            FileInputStream in = new FileInputStream(filepath);
            //创建输出流
            OutputStream out = response.getOutputStream();
            //创建缓冲区
            byte[] buffer = new byte[1024];
            int len = 0;
            //循环将输入流中的内容读取到缓冲区当中
            while ((len = in.read(buffer)) > 0) {
                //输出缓冲区的内容到浏览器，实现文件下载
                out.write(buffer, 0, len);
            }
            //关闭文件输入流
            in.close();
            //关闭输出流
            out.close();
            System.out.print("文件下载完成。");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


    @Override
    public void init() throws ServletException {
        songService = new SongServiceImpl();
    }
}
