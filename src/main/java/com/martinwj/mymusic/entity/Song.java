package com.martinwj.mymusic.entity;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

/**
 * @ClassName: Song
 * @Description: TODO
 * @author: 王靖
 * @createDate: 2020-11-09 15:14
 *
 * 音乐bean
 */
public class Song {
    // 编号
    private Integer songId;
    // 音乐名称
    private String name;
    // 歌手ID
    private int singerId;
    // 歌手姓名
    private String singerName;
    // 专辑CD
    private Integer cdId;
    // 语种
    private String language;
    // 播放次数
    private int playCount;
    // 下载次数
    private int downloadCount;
    // 收藏次数
    private int collectionCount;
    // 发布日期
    private String publicDate;
    // 更新日期
    private String updateDate;
    // 歌曲地址
    private String url;
    // 歌词
    private String lyric;
    // 歌曲时长
    private double time;
    // 歌曲类型
    private String type;
    // 上传歌曲的人
    private String uploader;


    public Song(){}

    public Song(Integer songId, String name, int singerId, Integer cdId, String language, int playCount, int downloadCount, int collectionCount, String publicDate, String updateDate, String url, String lyric, double time, String type, String uploader, String singerName) {
        this.songId = songId;
        this.name = name;
        this.singerId = singerId;
        this.cdId = cdId;
        this.language = language;
        this.playCount = playCount;
        this.downloadCount = downloadCount;
        this.collectionCount = collectionCount;
        this.publicDate = publicDate;
        this.updateDate = updateDate;
        this.url = url;
        this.lyric = lyric;
        this.time = time;
        this.type = type;
        this.uploader = uploader;
        this.singerName = singerName;
    }

    public Integer getSongId() {
        return songId;
    }

    public void setSongId(Integer songId) {
        this.songId = songId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSingerId() {
        return singerId;
    }

    public void setSingerId(int singerId) {
        this.singerId = singerId;
    }

    public String getSingerName() {
        return singerName;
    }

    public void setSingerName(String singerName) {
        this.singerName = singerName;
    }

    public Integer getCdId() {
        return cdId;
    }

    public void setCdId(Integer cdId) {
        this.cdId = cdId;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public int getPlayCount() {
        return playCount;
    }

    public void setPlayCount(int playCount) {
        this.playCount = playCount;
    }

    public int getDownloadCount() {
        return downloadCount;
    }

    public void setDownloadCount(int downloadCount) {
        this.downloadCount = downloadCount;
    }

    public int getCollectionCount() {
        return collectionCount;
    }

    public void setCollectionCount(int collectionCount) {
        this.collectionCount = collectionCount;
    }

    public String getPublicDate() {
        return publicDate;
    }

    public void setPublicDate(String publicDate) {
        this.publicDate = publicDate;
    }

    public String getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(String updateDate) {
        this.updateDate = updateDate;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getLyric() {
        return lyric;
    }

    public void setLyric(String lyric) {
        this.lyric = lyric;
    }

    public double getTime() {
        return time;
    }

    public void setTime(double time) {
        this.time = time;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUploader() {
        return uploader;
    }

    public void setUploader(String uploader) {
        this.uploader = uploader;
    }

    @Override
    public String toString() {
        return "Song{" +
                "songId=" + songId +
                ", name='" + name + '\'' +
                ", singerId=" + singerId +
                ", cdId=" + cdId +
                ", language='" + language + '\'' +
                ", playCount=" + playCount +
                ", downloadCount=" + downloadCount +
                ", collectionCount=" + collectionCount +
                ", publicDate='" + publicDate + '\'' +
                ", updateDate='" + updateDate + '\'' +
                ", url='" + url + '\'' +
                ", lyric='" + lyric + '\'' +
                ", time=" + time +
                ", type='" + type + '\'' +
                ", uploader='" + uploader + '\'' +
                ", singerName='" + singerName + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Song song = (Song) o;
        return singerId == song.singerId &&
                playCount == song.playCount &&
                downloadCount == song.downloadCount &&
                collectionCount == song.collectionCount &&
                Double.compare(song.time, time) == 0 &&
                Objects.equals(songId, song.songId) &&
                Objects.equals(name, song.name) &&
                Objects.equals(singerName, song.singerName) &&
                Objects.equals(cdId, song.cdId) &&
                Objects.equals(language, song.language) &&
                Objects.equals(publicDate, song.publicDate) &&
                Objects.equals(updateDate, song.updateDate) &&
                Objects.equals(url, song.url) &&
                Objects.equals(lyric, song.lyric) &&
                Objects.equals(type, song.type) &&
                Objects.equals(uploader, song.uploader);
    }

    @Override
    public int hashCode() {
        return Objects.hash(songId, name, singerId, singerName, cdId, language, playCount, downloadCount, collectionCount, publicDate, updateDate, url, lyric, time, type, uploader);
    }
}
