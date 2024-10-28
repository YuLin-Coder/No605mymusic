package com.martinwj.mymusic.controller.admin.song;

import com.martinwj.mymusic.entity.*;
import com.martinwj.mymusic.service.SingerService;
import com.martinwj.mymusic.service.SongService;
import com.martinwj.mymusic.service.TypeService;
import com.martinwj.mymusic.service.impl.SingerServiceImpl;
import com.martinwj.mymusic.service.impl.SongServiceImpl;
import com.martinwj.mymusic.service.impl.TypeServiceImpl;
import com.martinwj.mymusic.util.*;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @ClassName: UploadFileServlet
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-09 19:14
 *
 * 上传文件
 */
@WebServlet("/admin/uploadFileServlet")
public class UploadFileServlet extends HttpServlet {
    private SingerService singerService = null;
    private SongService songService = null;
    private TypeService typeService = null;

    @Override
    public void init() throws ServletException {
        singerService = new SingerServiceImpl();
        songService = new SongServiceImpl();
        typeService = new TypeServiceImpl();
    }

    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        BigDecimal price = null;

        Song song = new Song();

        HttpSession session = request.getSession();
        request.setAttribute("page", "music");
        String path_save = "/other/upload/";
        String path_temp = "/other/temp/";

        String realSavePath = null;
        String filename = null;
        String saveFilename = null;
        //得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
//        String savePath = new File("").getCanonicalPath() + "\\web" + path_save;
        String savePath = PathUtils.getProjectURL() + "" + path_save;
        //上传时生成的临时文件保存目录
//        String tempPath = new File("").getCanonicalPath() + "\\web" + path_temp;
        String tempPath = PathUtils.getProjectURL() + "" + path_temp;
        System.out.println("savePath: " + savePath);
        System.out.println("tempPath: " + tempPath);

        File tmpFile = new File(tempPath);
        if (!tmpFile.exists()) {
            //创建临时目录
            tmpFile.mkdir();
        }

        //消息提示
        String message = "";
        String singerName = "";
        try{
            //使用Apache文件上传组件处理文件上传步骤：
            //1、创建一个DiskFileItemFactory工厂
            DiskFileItemFactory factory = new DiskFileItemFactory();
            //设置工厂的缓冲区的大小，当上传的文件大小超过缓冲区的大小时，就会生成一个临时文件存放到指定的临时目录当中。
            factory.setSizeThreshold(1024*100);//设置缓冲区的大小为100KB，如果不指定，那么缓冲区的大小默认是10KB
            //设置上传时生成的临时文件的保存目录
            factory.setRepository(tmpFile);
            //2、创建一个文件上传解析器
            ServletFileUpload upload = new ServletFileUpload(factory);
            //监听文件上传进度
            upload.setProgressListener(new ProgressListener(){
                public void update(long pBytesRead, long pContentLength, int arg2) {
                    System.out.println("文件大小为：" + pContentLength + ",当前已处理：" + pBytesRead);
                    /**
                     * 文件大小为：14608,当前已处理：4096
                     文件大小为：14608,当前已处理：7367
                     文件大小为：14608,当前已处理：11419
                     文件大小为：14608,当前已处理：14608
                     */
                }
            });
            //解决上传文件名的中文乱码
            upload.setHeaderEncoding("UTF-8");
            //3、判断提交上来的数据是否是上传表单的数据
            if(!ServletFileUpload.isMultipartContent(request)){
                //按照传统方式获取数据
                System.out.println("按照传统方式获取数据！");
                request.setAttribute("message", "服务器正忙！！！");
                request.getRequestDispatcher("/page/manager/message.jsp").forward(request, response);

                return;
            }

            //设置上传单个文件的大小的最大值，目前是设置为1024*1024*100字节，也就是20MB
            upload.setFileSizeMax(1024*1024*20);
            //设置上传文件总量的最大值，最大值=同时上传的多个文件的大小的最大值的和，目前设置为20MB
            upload.setSizeMax(1024*1024*20);
            //4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
            List<FileItem> list = upload.parseRequest(request);
            FileItem fileItem = null;

            for(FileItem item : list) {
                //如果fileitem中封装的是普通输入项的数据
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    //解决普通输入项的数据的中文乱码问题
                    String value = item.getString("UTF-8");
                    //value = new String(value.getBytes("iso8859-1"),"UTF-8");
                    System.out.println(name + "=" + value);
                    if ("singerName".equals(name)) {
                        // 获取歌手ID
                        Singer singer = singerService.getSingerBySingerName(value);
                        System.out.println(singer);
                        if (singer == null) {
                            request.setAttribute("message", "没有该歌手信息！！！");
                            request.getRequestDispatcher("/page/manager/message.jsp").forward(request, response);
                            return;
                        } else {
                            song.setSingerId(singer.getSingerId());
                            song.setSingerName(value);
                            singerName = singer.getName();
                            System.out.println("歌手名称：" + singerName);
                        }
                    } else if ("songName".equals(name)) {
                        System.out.println(name);
                        song.setName(value);
                        if(songService.getSongByName(value) != null){
                            request.setAttribute("message", "歌曲已存在！！！");
                            request.getRequestDispatcher("/page/manager/message.jsp").forward(request, response);
                            return;
                        }
                    } else if ("language".equals(name)) {
                        System.out.println(name);
                        song.setLanguage(value);
                    } else if ("lyric".equals(name)) {
                        System.out.println(name);
                        song.setLyric(value);
                    } else if ("songType".equals(name)) {
                        System.out.println(name);
                        System.out.println(Arrays.toString(value.split("\n")));
                        song.setType(value);
                    }
                } else {
                    fileItem = item;
                }
            }
            //如果fileitem中封装的是上传文件
            savePath = savePath + singerName;
//            tempPath = tempPath + song.getName();
            System.out.println("savePath: " + savePath);
//            System.out.println("tempPath: " + tempPath);
            File savefile = new File(savePath);
            if (!savefile.exists()) {
                //创建临时目录
                savefile.mkdir();
            }

            //得到上传的文件名称，
            filename = fileItem.getName();
            System.out.println("上传的文件名称为："+filename);
            if(filename==null || filename.trim().equals("")){
                request.setAttribute("message", "上传的文件名称为空！！！");
                request.getRequestDispatcher("/page/manager/message.jsp").forward(request, response);
                return;
            }
            //注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：  c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
            //处理获取到的上传文件的文件名的路径部分，只保留文件名部分
            String filename_1 = filename.substring(filename.lastIndexOf("\\")+1);
            //得到上传文件的扩展名
            String fileExtName = filename_1.substring(filename_1.lastIndexOf(".")+1);
            //如果需要限制上传的文件类型，那么可以通过文件的扩展名来判断上传的文件类型是否合法
            System.out.println("上传的文件的扩展名是："+fileExtName);
            //获取item中的上传文件的输入流
            InputStream in = fileItem.getInputStream();
            //得到文件保存的名称
//                    saveFilename = makeFileName(filename);
            saveFilename = song.getName() + "." + fileExtName;
            //得到文件的保存目录
//                    realSavePath = makePath(saveFilename, savePath);
            realSavePath = savePath + "/" + filename;
            //创建一个文件输出流
            System.out.println("文件输出路径：" + realSavePath);
            FileOutputStream out = new FileOutputStream(realSavePath);
            //创建一个缓冲区
            byte[] buffer = new byte[1024];
            //判断输入流中的数据是否已经读完的标识
            int len = 0;
            //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
            while((len=in.read(buffer))>0){
                //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
                out.write(buffer, 0, len);
            }
            //关闭输入流
            in.close();
            //关闭输出流
            out.close();
            //删除处理文件上传时生成的临时文件
            //item.delete();
            message = "文件上传成功！";
            System.out.println("文件上传成功！");

        }catch (FileUploadBase.FileSizeLimitExceededException e) {
            e.printStackTrace();
            request.setAttribute("message", "单个文件超出最大值！！！");
            request.getRequestDispatcher("/page/manager/message.jsp").forward(request, response);
            return;
        }catch (FileUploadBase.SizeLimitExceededException e) {
            e.printStackTrace();
            request.setAttribute("message", "上传文件的总的大小超出限制的最大值！！！");
            request.getRequestDispatcher("/page/manager/message.jsp").forward(request, response);
            return;
        }catch (Exception e) {
            message= "文件上传失败！";
            System.out.println("文件上传失败！");
            e.printStackTrace();
        }

        addSong(request, song, realSavePath);
        System.out.println("message : " + request.getAttribute("message"));

        request.getRequestDispatcher("/page/manager/message.jsp").forward(request, response);
    }

    /**
     * @Method: makeFileName
     * @Description: 生成上传文件的文件名，文件名以：uuid+"_"+文件的原始名称
     * @param filename 文件的原始名称
     * @return uuid+"_"+文件的原始名称
     */
    private String makeFileName(String filename){  //2.jpg
        //为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名
        return UUID.randomUUID().toString() + "_" + filename;
    }

    /**
     *  为防止一个目录下面出现太多文件，要使用hash算法打散存储
     * @Method: makePath
     * @Description:
     * @param filename 文件名，要根据文件名生成存储目录
     * @param savePath 文件存储路径
     * @return 新的存储目录
     */
    private String makePath(String filename,String savePath){
        //得到文件名的hashCode的值，得到的就是filename这个字符串对象在内存中的地址
        int hashcode = filename.hashCode();
        int dir1 = hashcode&0xf;  //0--15
        int dir2 = (hashcode&0xf0)>>4;  //0-15
        //构造新的保存目录
        String dir = savePath + "\\" + dir1 + "\\" + dir2;  //upload\2\3  upload\3\5
        //File既可以代表文件也可以代表目录
        File file = new File(dir);
        //如果目录不存在
        if(!file.exists()){
            //创建目录
            file.mkdirs();
        }
        return dir;
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

    public void addSong(HttpServletRequest request, Song song, String realSavePath){
        System.out.println("开始添加歌曲文件");
        // 反馈给前端页面的数据
//        JSONObject jsonObject = new JSONObject();

        String url = realSavePath.substring(realSavePath.indexOf("other"));
        System.out.println(url);
        // 封装数据
        song.setSongId(null);
        song.setCdId(null);
        song.setPlayCount(0);
        song.setDownloadCount(0);
        song.setCollectionCount(0);
        Date date = new Date();
        String dateStr = DateUtils.getDateString(date);
        song.setPublicDate(dateStr);
        song.setUpdateDate(dateStr);
        song.setUrl(url);
        song.setTime(Tools.getMP3Timer(realSavePath));

        // 设置上传用户
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        User user = (User) request.getSession().getAttribute("user");
        if(admin != null) {
            song.setUploader(admin.getAdminName());
        } else if(user != null) {
            song.setUploader(user.getName());
        }
        System.out.println(song.getTime());
        int flag = songService.addSong(song);
        System.out.println(flag);
        if(flag > 0) {
            // 歌曲添加成功，修改该歌曲类别的歌曲数目
            for(String type : song.getType().split(",")){
                // 如果有该类别，则修改该类别歌曲数目，如果没有该类别，则添加该类别，再修改歌曲数目
                if(typeService.getTypeByName(type) != null) {
                    typeService.updateTypeByName(type, true);
                } else {
                    typeService.addType(new Type(null, type, 1));
                }
            }
            request.setAttribute("message", "歌曲添加成功！");
        } else {
            request.setAttribute("message", "歌曲添加失败！");
        }
    }

    //生成上传文件的文件名，文件名以：uuid+"_"+文件的原始名称

    public String mkFileName(String fileName){
        return UUID.randomUUID().toString()+"_"+fileName;
    }


}
