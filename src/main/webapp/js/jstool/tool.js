// 获取项目路径
function getPath(){
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    return pathName.substr(0, index + 1);
}

/**
 * 从 request Attribute中获取值
 * @param name
 */
function getQueryString(name){
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
}

// function getData(){
//     var url = getPath() + "/admin/findSongByPageServlet";
//     var keyWord = $("#keyWord").val();
//     var jsonData = {"keyWord": keyWord };
//     $.post(
//         url,
//         jsonData,
//         function (data){
//             // window.location.reload();//刷新当前页面
//         },
//         "json");
// }