<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: martin
  Date: 2020/11/13
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <link rel="icon" href="favicon.ico" type="image/ico">
    <title>歌手管理</title>
    <link href="${pageContext.request.contextPath }/css/manager/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/manager/fonts.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/manager/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/manager/animate.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jstool/tool.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/js/manager/jquery-tags-input/jquery.tagsinput.min.css">
</head>

<%
    String message = (String) session.getAttribute("msg");
    request.setAttribute("message", message);
    session.setAttribute("msg", "");
%>

<body onload="showMsg(${requestScope.message})">
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
                                        歌手名 <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="name">歌手名</a> </li>
                                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="sex">性别(0女1男2组合3未知)</a> </li>
                                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="location">地区</a> </li>
                                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="accessCount">最小热度</a> </li>
                                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="collectionCount">最小收藏</a> </li>
                                    </ul>
                                </div>
                                <input type="text" class="form-control" value="${sessionScope.singerKeyName}" id="keyName" name="keyName" placeholder="请输入歌手名">
                            </div>
                        </form>
                        <div class="toolbar-btn-action">
                            <a class="btn submenuitem btn-success m-r-5 " href="${pageContext.request.contextPath}/admin/findSingerByPageServlet?currentPage=${sessionScope.singerPb.currentPage}&rows=6&name=${sessionScope.singerCondition.name[0]}&sex=${sessionScope.singerCondition.sex[0]}&location=${sessionScope.singerCondition.location[0]}" data-id="link553" data-index="553"> 刷新</a>
                            <a class="btn submenuitem btn-primary m-r-5 " href="${pageContext.request.contextPath}/page/manager/addsinger.jsp" data-id="link552" data-index="552"> 新增</a>
                            <a class="btn submenuitem btn-danger" href="javascript:delSelected();" data-id="link555" data-index="555"> 删除</a>
                        </div>
                    </div>
                    <div class="card-body">

                        <div class="table-responsive">
<%--                            <form id="form_del" method="post">--%>
                                <table class="table table-bordered" >
                                    <thead>
                                    <tr>
                                        <th width="5">
                                            <label class="ftdms-checkbox checkbox-primary">
                                                <input type="checkbox" id="check-all"><span></span>
                                            </label>
                                        </th>
                                        <th>编号</th>
                                        <th>歌手姓名</th>
                                        <th>性别</th>
                                        <th>生日</th>
                                        <th>地区</th>
                                        <th>热度</th>
                                        <th>收藏次数</th>
                                        <th>出道时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${sessionScope.singerPb.list}" var="singer" varStatus="s">
                                        <tr>
                                            <td>
                                                <label class="ftdms-checkbox checkbox-primary">
                                                    <input type="checkbox" id="singerId" name="singerId" value="${singer.singerId}"/><span></span>
                                                </label>
                                            </td>
                                            <td>${s.count}</td>
                                            <td>${singer.name}</td>
                                            <td>${singer.sex == 0 ? "女" : singer.sex == 1 ? "男" : singer.sex == 2 ? "组合" : "未知"}</td>
                                            <td>${singer.birth}</td>
                                            <td>${singer.location}</td>
                                            <td>${singer.accessCount}</td>
                                            <td>${singer.collectionCount}</td>
                                            <td>${singer.debutDate}</td>
                                            <td>
                                                <div class="btn-group">

                                                    <a type="button" class="btn btn-primary btn-xs btn-default submenuitem" data-toggle="modal" data-target="#exampleModal_${singer.singerId}" data-whatever="@mdo" target= "_self" title="编辑"><i class="ftsucai-edit-2"></i></a>
                                                    <div class="modal fade" id="exampleModal_${singer.singerId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                    <h4 class="modal-title" id="exampleModalLabel_${singer.singerId}">修改歌手<${singer.name}>信息：</h4>
                                                                </div>
                                                                <form class="form_update_${singer.singerId}" onsubmit="return updateSinger(${singer.singerId})" action="${pageContext.request.contextPath}/admin/updateSingerServlet?singerId=${singer.singerId}" method="post">
                                                                    <div class="modal-body">
                                                                        <input type="hidden" id="collectionCount_${singer.singerId}" name="update_collectionCount_${singer.singerId}" value="${singer.collectionCount}"/>
                                                                        <div class="form-group">
                                                                            <label for="update_singerLocation_${singer.singerId}" class="control-label">地区：</label>
                                                                            <input class="form-control" type="text" id="update_singerLocation_${singer.singerId}" name="update_singerLocation_${singer.singerId}" placeholder="请输入标签" value="${singer.location}"/>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="update_accessCount_${singer.singerId}" class="control-label">热度：</label>
                                                                            <input class="form-control" type="text" id="update_accessCount_${singer.singerId}" name="update_accessCount_${singer.singerId}" placeholder="请输入标签" value="${singer.accessCount}"/>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="updateIntroduction_${singer.singerId}" class="control-label">简介：</label>
                                                                            <textarea class="form-control" id="updateIntroduction_${singer.singerId}" name="updateIntroduction_${singer.singerId}" >${singer.introduction}</textarea>
                                                                        </div>

                                                                    </div>

                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                                    <button type="submit" class="btn btn-primary" id="updateBtn_${singer.singerId}" >确认修改</button>
                                                                </div>
                                                                </form>
                                                            </div>
                                                        </div>

                                                    </div>

                                                    <a class="btn btn-xs btn-default submenuitem" href="javascript:deleteSong(${singer.singerId})" target= "_self" title="删除" data-toggle="tooltip"><i class="ftsucai-del-2"></i></a>

                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
<%--                            </form>--%>
                        </div>

                        <nav>
                            <ul class="pagination  no-border">
                                <%-- 如果没有值，则打印当前没有任何歌曲，请为列表贡献一些数据吧！ --%>
                                <c:if test="${sessionScope.singerPb.totalCount != 0}">

                                    <c:if test="${sessionScope.singerPb.currentPage == 1}">
                                        <li class="disabled">
                                            <a class="btn submenuitem" href="javascript:void(0);">
                                                <span><i class="ftsucai-146"></i></span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${sessionScope.singerPb.currentPage != 1}">
                                        <li>
                                            <a class="btn submenuitem" href="${pageContext.request.contextPath}/admin/findSingerByPageServlet?currentPage=${sessionScope.singerPb.currentPage - 1}&rows=6&name=${sessionScope.singerCondition.name[0]}&sex=${sessionScope.singerCondition.sex[0]}&location=${sessionScope.singerCondition.location[0]}">
                                                <span><i class="ftsucai-146"></i></span>
                                            </a>
                                        </li>
                                    </c:if>


                                    <c:forEach begin="${sessionScope.singerPb.startPage}" end="${sessionScope.singerPb.endPage}" var="i" >
                                        <c:if test="${sessionScope.singerPb.currentPage == i}">
                                            <li class="active"><a  class="btn submenuitem" id="currentPage"
                                                                   href="${pageContext.request.contextPath}/admin/findSingerByPageServlet?currentPage=${i}&rows=6&name=${sessionScope.singerCondition.name[0]}&sex=${sessionScope.singerCondition.sex[0]}&location=${sessionScope.singerCondition.location[0]}">${i}</a></li>
                                        </c:if>
                                        <c:if test="${sessionScope.singerPb.currentPage != i}">
                                            <li><a  class="submenuitem" href="${pageContext.request.contextPath}/admin/findSingerByPageServlet?currentPage=${i}&rows=6&name=${sessionScope.singerCondition.name[0]}&sex=${sessionScope.singerCondition.sex[0]}&location=${sessionScope.singerCondition.location[0]}">${i}</a></li>
                                        </c:if>
                                    </c:forEach>

                                    <c:if test="${sessionScope.singerPb.currentPage == sessionScope.singerPb.totalPage}">
                                        <li class="disabled">
                                            <a class="btn submenuitem"
                                               href="javascript:void(0);">
                                                <span><i class="ftsucai-139"></i></span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${sessionScope.singerPb.currentPage != sessionScope.singerPb.totalPage}">
                                        <li>
                                            <a class="btn submenuitem"
                                               href="${pageContext.request.contextPath}/admin/findSingerByPageServlet?currentPage=${sessionScope.singerPb.currentPage + 1}&rows=6&name=${sessionScope.singerCondition.name[0]}&sex=${sessionScope.singerCondition.sex[0]}&location=${sessionScope.singerCondition.location[0]}">
                                                <span><i class="ftsucai-139"></i></span>
                                            </a>
                                        </li>
                                    </c:if>

                                    <span style="font-size: 25px;margin-left: 5px;">
                                    共${sessionScope.singerPb.totalCount}条记录，共${sessionScope.singerPb.totalPage}页
                                </span>
                                </c:if>
                                <c:if test="${sessionScope.singerPb.totalCount == 0}">
                                <span style="font-size: 25px;margin-left: 5px;">
                                    当前没有任何歌手，请增加歌手信息吧！
                                </span>
                                </c:if>
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
<script src="${pageContext.request.contextPath }/js/jquerysession.js"></script>
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
                window.location.href = "${pageContext.request.contextPath}/admin/findSingerByPageServlet?rows=6&" + $("#search-field").val() + "=" + keyValue;
            }
        });

    });

    function showMsg(msg){
        // alert(msg);
        if(msg == "" || msg == null){

        }else {
            tips.loading("show");
            tips.notify(msg, 'danger', 1000);
        }
    }

    function updateSinger(id){
        var accessCount = $("#update_accessCount_" + id).val();
        var reg = /^\d+$/;
        if(!reg.test(accessCount)){
            alert("热度必须为非负整数！！！");
            return false;
        }
        var count = Number.parseInt(accessCount);
        if(count > 30000 || count < 0){
            alert("管理员修改的热度大小不能超过30000，并且不能小于0！！！");
            return false;
        }
        if(confirm("您确定要修改吗？")) {
            return true;
            // var str = ".form_update_" + id;
            <%--window.location.href = "${pageContext.request.contextPath}/admin/updateSingerServlet?singerId="+id;--%>
            // $(str).submit();
        }else {
            return false;
        }
    }

    function deleteSong(id){
        //用户安全提示
        if(confirm("您确定要删除吗？")){
            //访问路径
            location.href="${pageContext.request.contextPath}/admin/deleteSingerServlet?singerId="+id;
        }
    }

    // 给删除按钮添加事件
    function delSelected(){
        if(confirm("您确定要删除选中条目吗？")){
            let flag = false;
            // 判断是否有选中
            let checks = document.getElementsByName("singerId");
            let str = "";
            for(let i = 0; i < checks.length; i++){
                if(checks[i].checked){
                    //有一个条目选中了
                    flag = true;
                    str += "singerId=" + checks[i].value + "&";
                    // break;
                }
            }

            if(flag) {
                window.location.href = "${pageContext.request.contextPath}/admin/deleteSingerServlet?" + str;
                // $("#form_del").submit();
            }else {
                return false;
            }
        }
    }

</script>
</body>
</html>

