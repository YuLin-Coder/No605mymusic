package com.martinwj.mymusic.controller.admin.singer;

import com.martinwj.mymusic.entity.Singer;
import com.martinwj.mymusic.service.SingerService;
import com.martinwj.mymusic.service.SongService;
import com.martinwj.mymusic.service.impl.SingerServiceImpl;
import com.martinwj.mymusic.service.impl.SongServiceImpl;
import com.martinwj.mymusic.util.PathUtils;
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
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
@WebServlet("/admin/addSingerServlet")
public class AddSingerServlet extends HttpServlet {
    private SingerService singerService = null;
    private SongService songService = null;

    @Override
    public void init() throws ServletException {
        singerService = new SingerServiceImpl();
        songService = new SongServiceImpl();
    }

    @Override
    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

        Singer singer = new Singer();

        HttpSession session = request.getSession();
        request.setAttribute("page", "singer");
        String path_save = "/other/img/";
        String path_temp = "/other/temp/";

        String realSavePath = null;
        String filename = null;
        String saveFilename = null;
        //得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
//        String savePath = new File("").getCanonicalPath() + "\\web" + path_save;
        String savePath = PathUtils.getProjectURL() + "/web" + path_save;
        //上传时生成的临时文件保存目录
//        String tempPath = new File("").getCanonicalPath() + "\\web" + path_temp;
        String tempPath = PathUtils.getProjectURL() + "/web" + path_temp;
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
                @Override
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

            //设置上传单个文件的大小的最大值，目前是设置为1024*1024*100字节，也就是100MB
            upload.setFileSizeMax(1024*1024*5);
            //设置上传文件总量的最大值，最大值=同时上传的多个文件的大小的最大值的和，目前设置为10MB
            upload.setSizeMax(1024*1024*10);
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
                    if ("name".equals(name)) {
                        // 获取歌手ID
                        singer.setName(value);
                        System.out.println(singer);
                    } else if ("sex".equals(name)) {
                        singer.setSex(Integer.parseInt(value));
                        System.out.println("歌手的性别：" + value);
                    } else if ("birth".equals(name)) {
                        singer.setBirth(value);
                    } else if ("location".equals(name)) {
                        singer.setLocation(value);
                    } else if ("introduction".equals(name)) {
                        System.out.println(name);
                        singer.setIntroduction(value);
                    } else if ("debutDate".equals(name)) {
                        singer.setDebutDate(value);
                    } else if ("accessCount".equals(name)) {
                        singer.setAccessCount(Integer.parseInt(value));
                    } else if ("englishName".equals(name)) {
                        singer.setEnglishName(value);
                    }
                } else {
                    fileItem = item;
                }
            }
            //如果fileitem中封装的是上传文件
            savePath = savePath + singerName;
            System.out.println("savePath: " + savePath);
            File savefile = new File(savePath);
            if (!savefile.exists()) {
                //创建临时目录
                savefile.mkdir();
            }

            //得到上传的文件名称，
            filename = fileItem.getName();
            System.out.println("上传的文件名称为："+filename);
            if(filename==null || filename.trim().equals("")){
                // 允许长传的文件为空，所以这里直接跳出
                realSavePath = null;
//                request.setAttribute("message", "上传的文件名称为空！！！");
//                request.getRequestDispatcher("/page/manager/message.jsp").forward(request, response);
//                return;
            }else {
                //注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：  c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
                //处理获取到的上传文件的文件名的路径部分，只保留文件名部分
                String filename_1 = filename.substring(filename.lastIndexOf("\\") + 1);
                //得到上传文件的扩展名
                String fileExtName = filename_1.substring(filename_1.lastIndexOf(".") + 1);
                //如果需要限制上传的文件类型，那么可以通过文件的扩展名来判断上传的文件类型是否合法
                System.out.println("上传的文件的扩展名是：" + fileExtName);
                //获取item中的上传文件的输入流
                InputStream in = fileItem.getInputStream();
                //得到文件保存的名称
//                    saveFilename = makeFileName(filename);
                saveFilename = singer.getName() + "." + fileExtName;
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
                while ((len = in.read(buffer)) > 0) {
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
            }
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

        if(realSavePath == null){
            addSinger(request, singer);
        }else {
            addSinger(request, singer, realSavePath);
        }
        System.out.println("message : " + request.getAttribute("message"));

        request.getRequestDispatcher("/page/manager/message.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

    public void addSinger(HttpServletRequest request, Singer singer, String realSavePath){

        String url = realSavePath.substring(realSavePath.indexOf("other"));
        System.out.println(url);
        // 封装数据
        singer.setPic(url);
       addSinger(request, singer);
    }

    public void addSinger(HttpServletRequest request, Singer singer){
        // 封装数据
        singer.setCollectionCount(0);
        int flag = singerService.addSinger(singer);
        System.out.println(flag);
        if(flag > 0) {
            request.setAttribute("message", "歌手添加成功！");
        } else {
            request.setAttribute("message", "歌手添加失败！");
        }
    }

    //生成上传文件的文件名，文件名以：uuid+"_"+文件的原始名称

    public String mkFileName(String fileName){
        return UUID.randomUUID().toString()+"_"+fileName;
    }


}
