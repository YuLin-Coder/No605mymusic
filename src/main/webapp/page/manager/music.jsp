<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/9 0009
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <link rel="icon" href="favicon.ico" type="image/ico">
    <title>音乐管理</title>
    <link href="${pageContext.request.contextPath }/css/manager/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/manager/fonts.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/manager/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/manager/animate.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jstool/tool.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/js/manager/jquery-tags-input/jquery.tagsinput.min.css">
</head>

<body>
<!--页面主要内容-->
<main class="ftdms-layout-content">

    <div class="container-fluid" style="margin-bottom:90px;">

        <div class="row" style="margin-top:15px;">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-toolbar clearfix">
                        <form class="pull-right search-bar" method="get" action="#" role="form">
                            <div class="input-group">
                                <div class="input-group-btn">
                                    <input type="text" hidden name="search_field" id="search-field" value="name"/>
                                    <button class="btn btn-default dropdown-toggle" id="search-btn" data-toggle="dropdown" type="button" aria-haspopup="true" aria-expanded="false">
                                        歌曲名 <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="name">歌曲名</a> </li>
                                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="singerName">歌手名</a> </li>
                                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="type">歌曲类型</a> </li>
                                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="language">歌曲语种</a> </li>
                                    </ul>
                                </div>
                                <input type="text" class="form-control" value="${sessionScope.keyName}" id="keyName" name="keyName" placeholder="请输入歌曲名">
                            </div>
                        </form>
                        <div class="toolbar-btn-action">
                            <a class="btn submenuitem btn-success m-r-5 " href="${pageContext.request.contextPath}/admin/findSongByPageServlet?currentPage=${sessionScope.pb.currentPage}&rows=6&name=${sessionScope.condition.name[0]}&singerName=${sessionScope.condition.singerName[0]}&type=${sessionScope.condition.type[0]}&language=${sessionScope.condition.language[0]}" data-id="link553" data-index="553"> 刷新</a>
                            <a class="btn submenuitem btn-primary m-r-5 " href="${pageContext.request.contextPath}/page/manager/addmusic.jsp" data-id="link552" data-index="552"> 新增</a>
                            <a class="btn submenuitem btn-danger" href="javascript:delSelected();" data-id="link555" data-index="555"> 删除</a>
                        </div>
                    </div>
                    <div class="card-body">

                        <div class="table-responsive">
<%--                            <form id="form_del" action="${pageContext.request.contextPath}/admin/deleteSongServlet" method="post">--%>
                                <table class="table table-bordered" >
                                <thead>
                                <tr>
                                    <th width="5">
                                        <label class="ftdms-checkbox checkbox-primary">
                                            <input type="checkbox" id="check-all"><span></span>
                                        </label>
                                    </th>
                                    <th>编号</th>
                                    <th>歌曲名称</th>
<%--                                    <th>歌手</th>--%>
                                    <th>歌曲语种/歌曲类型</th>
                                    <th>时长</th>
                                    <th>播放次数</th>
                                    <th>下载次数</th>
                                    <th>收藏次数</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${sessionScope.pb.list}" var="song" varStatus="s">
                                    <tr>
                                        <td>
                                            <label class="ftdms-checkbox checkbox-primary">
                                                <input type="checkbox" id="songId" name="songId" value="${song.songId}"/><span></span>
                                            </label>
                                        </td>
                                        <td>${s.count}</td>
                                        <td>${song.name}</td>
<%--                                        <td><label for="singId_${song.singerId}"></label><input type="text" id="singId_${song.singerId}" value="${song.singerId}" hidden></td>--%>
                                        <td>${song.language}/${song.type}</td>
                                        <td><fmt:formatNumber value="${(song.time - song.time % 60) / 60}" type="number" pattern="#" maxFractionDigits="0"></fmt:formatNumber>分
                                            <fmt:formatNumber value="${song.time % 60}"></fmt:formatNumber>秒</td>
                                        <td>${song.playCount}</td>
                                        <td>${song.downloadCount}</td>
                                        <td>${song.collectionCount}</td>
                                        <td>
                                            <div class="btn-group">
                                                <a type="buttion" class="btn btn-primary btn-xs btn-default submenuitem" data-toggle="modal" data-target="#exampleModal_${song.songId}" data-whatever="@mdo" target= "_self" title="编辑"><i class="ftsucai-edit-2"></i></a>
                                                <div class="modal fade" id="exampleModal_${song.songId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                                                    <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                            <h4 class="modal-title" id="exampleModalLabel_${song.songId}">修改歌曲<${song.name}>信息：</h4>
                                                        </div>
                                                        <form id="form_update_${song.songId}" action="${pageContext.request.contextPath}/admin/updateSongServlet?songId=${song.songId}" method="post">
                                                        <div class="modal-body">
                                                                <input type="hidden" id="initialType_${song.songId}" name="initialType_${song.songId}" value="${song.type}"/>
                                                                <input type="hidden" id="playerCount_${song.songId}" name="update_playerCount_${song.songId}" value="${song.playCount}"/>
                                                                <input type="hidden" id="downloadCount_${song.songId}" name="update_downloadCount_${song.songId}" value="${song.downloadCount}"/>
                                                                <input type="hidden" id="collectionCount_${song.songId}" name="update_collectionCount_${song.songId}" value="${song.collectionCount}"/>
                                                                <div class="form-group">
                                                                    <label for="update_songType_${song.songId}" class="control-label">歌曲类型：</label>
                                                                    <input class="form-control js-tags-input" type="text" id="update_songType_${song.songId}" name="update_songType_${song.songId}" placeholder="请输入标签" value="${song.type}"/>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="updateLyric_${song.songId}" class="control-label">歌词：</label>
                                                                    <textarea class="form-control" id="updateLyric_${song.songId}" name="updateLyric_${song.songId}" >${song.lyric}</textarea>
                                                                </div>

                                                        </div>
                                                        </form>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                            <button type="button" class="btn btn-primary" id="updateBtn_${song.songId}" onclick="updateSong(${song.songId})" >确认修改</button>
                                                        </div>
                                                    </div>
                                                </div>
                                                </div>
                                                <a class="btn btn-xs btn-default submenuitem" href="javascript:deleteSong(${song.songId})" target= "_self" title="删除" data-toggle="tooltip"><i class="ftsucai-del-2"></i></a>
                                            </div>
                                        </td>
                                    </tr>
<%--                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" data-toggle="tooltip">打开模态框 for @mdo</button>--%>



                                </c:forEach>
                                </tbody>
                            </table>
<%--                            </form>--%>
                        </div>

                        <nav>
                        <ul class="pagination  no-border">
                            <%-- 如果没有值，则打印当前没有任何歌曲，请为列表贡献一些数据吧！ --%>
                            <c:if test="${sessionScope.pb.totalCount != 0}">

                                <c:if test="${sessionScope.pb.currentPage == 1}">
                                <li class="disabled">
                                    <a class="btn submenuitem" href="javascript:void(0);">
                                        <span><i class="ftsucai-146"></i></span>
                                    </a>
                                </li>
                                </c:if>
                                <c:if test="${sessionScope.pb.currentPage != 1}">
                                <li>
                                    <a class="btn submenuitem" href="${pageContext.request.contextPath}/admin/findSongByPageServlet?currentPage=${sessionScope.pb.currentPage - 1}&rows=6&name=${sessionScope.condition.name[0]}&singerName=${sessionScope.condition.singerName[0]}&type=${sessionScope.condition.type[0]}&language=${sessionScope.condition.language[0]}">
                                            <%--                                       onclick="flushPage(${sessionScope.pb.currentPage - 1}, 6, ${sessionScope.condition.name[0]}, ${sessionScope.condition.address[0]}, ${sessionScope.condition.email[0]})">--%>
                                        <span><i class="ftsucai-146"></i></span>
                                    </a>
                                </li>
                                </c:if>


                                <c:forEach begin="${sessionScope.pb.startPage}" end="${sessionScope.pb.endPage}" var="i" >
                                    <c:if test="${sessionScope.pb.currentPage == i}">
                                        <li class="active"><a  class="btn submenuitem" id="currentPage"
                                                href="${pageContext.request.contextPath}/admin/findSongByPageServlet?currentPage=${i}&rows=6&name=${sessionScope.condition.name[0]}&singerName=${sessionScope.condition.singerName[0]}&type=${sessionScope.condition.type[0]}&language=${sessionScope.condition.language[0]}">${i}</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.pb.currentPage != i}">
                                        <li><a  class="submenuitem" href="${pageContext.request.contextPath}/admin/findSongByPageServlet?currentPage=${i}&rows=6&name=${sessionScope.condition.name[0]}&singerName=${sessionScope.condition.singerName[0]}&type=${sessionScope.condition.type[0]}&language=${sessionScope.condition.language[0]}">${i}</a></li>
                                    </c:if>
                                </c:forEach>

                                <c:if test="${sessionScope.pb.currentPage == sessionScope.pb.totalPage}">
                                    <li class="disabled">
                                        <a class="btn submenuitem"
                                           href="javascript:void(0);">
                                            <span><i class="ftsucai-139"></i></span>
                                        </a>
                                    </li>
                                </c:if>
                                <c:if test="${sessionScope.pb.currentPage != sessionScope.pb.totalPage}">
                                    <li>
                                        <a class="btn submenuitem"
                                           href="${pageContext.request.contextPath}/admin/findSongByPageServlet?currentPage=${sessionScope.pb.currentPage + 1}&rows=6&name=${sessionScope.condition.name[0]}&singerName=${sessionScope.condition.singerName[0]}&type=${sessionScope.condition.type[0]}&language=${sessionScope.condition.language[0]}">
                                            <span><i class="ftsucai-139"></i></span>
                                        </a>
                                    </li>
                                </c:if>


                                <span style="font-size: 25px;margin-left: 5px;">
                                    共${sessionScope.pb.totalCount}条记录，共${sessionScope.pb.totalPage}页
                                </span>
                            </c:if>
                            <c:if test="${sessionScope.pb.totalCount == 0}">
                                <span style="font-size: 25px;margin-left: 5px;">
                                    当前没有任何歌曲，请为列表贡献一些数据吧！
                                </span>
                            </c:if>


<%--                            <li class="disabled"><span>«</span></li>
                            <li class="active"><span>1</span></li>
                            <li><a class="submenuitem" href="pages_data.html#2">2</a></li>
                            <li><a href="#3">3</a></li>
                            <li><a href="#4">4</a></li>
                            <li><a href="#5">5</a></li>
                            <li class="disabled"><span>...</span></li>
                            <li><a href="#">14452</a></li>
                            <li><a href="#">14453</a></li>
                            <li><a href="#">»</a></li>         --%>
                        </ul>

                        </nav>
                    </div>
                </div>
            </div>

        </div>

    </div>

</main>
<!--End 页面主要内容-->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/manager/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/manager/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/manager/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/manager/main.min.js"></script>
<script src="${pageContext.request.contextPath }/js/manager/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/manager/tips.js"></script>
<%-- 标签插入 --%>
<script src="${pageContext.request.contextPath }/js/manager/jquery-tags-input/jquery.tagsinput.min.js"></script>
<script type="text/javascript">
    $(function(){
        $('.search-bar .dropdown-menu a').click(function() {
            var field = $(this).data('field') || '';
            $('#search-field').val(field);
            $('#search-btn').html($(this).text() + ' <span class="caret"></span>');
            $("#keyName").attr("placeholder", "请输入" + $(this).text());
        });

        $('#keyName').blur(function (){
            var keyValue = $("#keyName").val();
            if(keyValue == null || keyValue == ""){
                return false;
            }else {
                window.location.href = "${pageContext.request.contextPath}/admin/findSongByPageServlet?rows=6&" + $("#search-field").val() + "=" + keyValue;
            }
        });

        // $("#updateBtn").click(function (){
        //     alert($(this).attr("name"));
        //     if(confirm("您确定要修改吗？")) {
        //         var index = $(this).val();
        //         alert(index);
        //         var str = "#form_update_" + index;
        //         $(str).submit();
        //     }
        // });


    });

    function updateSong(id){
        if(confirm("您确定要修改吗？")) {
            var str = "#form_update_" + id;
            $(str).submit();
        }
    }

    function deleteSong(id){
        //用户安全提示
        if(confirm("您确定要删除吗？")){
            //访问路径
            location.href="${pageContext.request.contextPath}/admin/deleteSongServlet?songId="+id;
        }
    }

    // 给删除按钮添加事件
    function delSelected(){
        if(confirm("您确定要删除选中条目吗？")){
            let flag = false;
            // 判断是否有选中
            let checks = document.getElementsByName("songId");
            let str = "";
            for(let i = 0; i < checks.length; i++){
                if(checks[i].checked){
                    //有一个条目选中了
                    flag = true;
                    str += "songId=" + checks[i].value + "&";
                    // break;
                }
            }

            if(flag) {
                // $("#form_del").submit();
                window.location.href = "${pageContext.request.contextPath}/admin/deleteSongServlet?" + str;
            }else {
                return false;
            }
        }
    }

</script>
</body>
</html>
