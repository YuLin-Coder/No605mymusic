/**
 * 增加歌曲播放次数和播放音乐
 * @param songId
 */
function addPlayCount(songId) {
    var jsonData = {"songId": songId};
    var url = "${pageContext.request.contextPath}/addSongPlayCountServlet";
    $.post(url, jsonData, function (data){
        console.log(data);
    }, 'json');
}

