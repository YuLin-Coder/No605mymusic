package com.martinwj.mymusic.util;

import it.sauronsoftware.jave.Encoder;
import it.sauronsoftware.jave.EncoderException;
import it.sauronsoftware.jave.MultimediaInfo;
import org.junit.Test;

import java.io.File;

/**
 * @ClassName: Tools
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-10 10:35
 */
public class Tools {
    /*
     * 获取音乐文件的时长（秒）
     * @param filename
     * @return
     */
//    public static int getMP3Timer(String filename) {
//        int songTime = 0;
//        File file = new File(filename);
//        try {
//            MP3File f = (MP3File) AudioFileIO.read(file);
//            MP3AudioHeader audioHeader = (MP3AudioHeader)f.getAudioHeader();
//            songTime = audioHeader.getTrackLength();
//            System.out.println(audioHeader.getTrackLength());
//        } catch(Exception e) {
//            e.printStackTrace();
//        }
//        return songTime;
//    }

    public static void main(String[] args) {
        String filename = "F:\\戴尔基地\\2019-06-02备份\\资源文件\\song\\周杰伦-告白气球.mp3";
        System.out.println(getMP3Timer(filename));
    }

    /*
     * 获取音乐文件的时长（秒）
     * @param filename
     * @return
     */
    public static int getMP3Timer(String filename) {
        File source =new File(filename);
        Encoder encoder = new Encoder();
        MultimediaInfo m = null;
        try {
            m = encoder.getInfo(source);
        } catch (EncoderException e) {
            e.printStackTrace();
        }
        long ls = m.getDuration();
        long duration = (ls/1000);
        System.out.println("此视频时长为:"+ls/60000+"分"+(ls/1000-ls/60000*60)+"秒！");
        return (int) duration;
    }

    @Test
    public void test() {
//        URL url = getClass().getProtectionDomain().getCodeSource().getLocation();
//        System.out.println(url.toString());
//        int index = url.toString().indexOf("out");
//        int start = url.toString().indexOf("/");
//        System.out.println(url.toString().substring(start + 1, index));
        String str = "123";
        System.out.println(str.substring(0, Math.min((str.length()), 5)));
    }



}
