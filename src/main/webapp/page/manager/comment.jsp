<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: martin
  Date: 2020/11/18
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <link rel="icon" href="favicon.ico" type="image/ico">
    <title>评论管理</title>
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
                                    <input type="text" hidden name="search_field" id="search-field" value="up"/>
                                    <button class="btn btn-default dropdown-toggle" id="search-btn" data-toggle="dropdown" type="button" aria-haspopup="true" aria-expanded="false">
                                        最小点赞次数 <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="up">最小点赞次数</a> </li>
                                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="type">类型(0歌曲/1歌单/2歌手专辑)</a> </li>
                                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="username">用户名</a> </li>
                                    </ul>
                                </div>
                                <input type="text" class="form-control" value="${sessionScope.commentKeyName}" id="keyName" name="keyName" placeholder="请输入最小点赞次数">
                            </div>
                        </form>
                        <div class="toolbar-btn-action">
                            <a class="btn submenuitem btn-success m-r-5 " href="${pageContext.request.contextPath}/admin/findCommentByPageServlet?currentPage=${sessionScope.commentPb.currentPage}&rows=6&type=${sessionScope.commentCondition.type[0]}&up=${sessionScope.commentCondition.up[0]}&username=${sessionScope.commentCondition.username[0]}" data-id="link553" data-index="553"> 刷新</a>
                            <a class="btn submenuitem btn-danger" href="javascript:delSelected();" data-id="link555" data-index="555"> 删除选中</a>
                        </div>
                    </div>
                    <div class="card-body">

                        <div class="table-responsive">
<%--                            <form id="form_del" action="${pageContext.request.contextPath}/admin/deleteCommentServlet" method="post">--%>
                                <table class="table table-bordered" >
                                    <thead>
                                    <tr>
                                        <th width="5">
                                            <label class="ftdms-checkbox checkbox-primary">
                                                <input type="checkbox" id="check-all"><span></span>
                                            </label>
                                        </th>
                                        <th>编号</th>
                                        <th>用户名称</th>
                                        <th>评论类型</th>
                                        <th>歌曲/歌单/歌手</th>
                                        <th>评论内容</th>
                                        <th>评论日期</th>
                                        <th>点赞次数</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${sessionScope.commentPb.list}" var="comment" varStatus="s">
                                        <tr>
                                            <td>
                                                <label class="ftdms-checkbox checkbox-primary">
                                                    <input type="checkbox" id="commentId" name="commentId" value="${comment.id}"/><span></span>
                                                </label>
                                            </td>
                                            <td>${s.count}</td>
                                            <td>${comment.username}</td>
                                            <td>${comment.type == 0 ? "歌曲" : (comment.type == 1 ? "歌单" : "歌手")}</td>
                                            <td>
                                                <c:if test="${comment.type == 0}">
                                                    ${comment.songName}
                                                </c:if>
                                                <c:if test="${comment.type == 1}">
                                                    ${comment.songListName}
                                                </c:if>
                                                <c:if test="${comment.type == 2}">
                                                    ${comment.singerName}
                                                </c:if>
                                            </td>
                                            <td>
                                                <button type="button" id="btn_${comment.id}" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg_${comment.id}">内容</button>
                                                <div class="modal fade bs-example-modal-lg_${comment.id}" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                                                    <div class="modal-dialog modal-lg" role="document">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                                                <h4 class="modal-title" id="myLargeModalLabel">
                                                                    <c:if test="${comment.type == 0}">
                                                                        ${comment.songName}
                                                                    </c:if>
                                                                    <c:if test="${comment.type == 1}">
                                                                        ${comment.songListName}
                                                                    </c:if>
                                                                    <c:if test="${comment.type == 2}">
                                                                        ${comment.singerName}
                                                                    </c:if>
                                                                </h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                ${comment.context}
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-default" id="modal_${comment.id}" data-dismiss="modal">关闭</button>
<%--                                                                <button type="button" class="btn btn-primary">点击保存</button>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>${comment.createDate}</td>
                                            <td>${comment.up}</td>
                                            <td>
                                                <div class="btn-group">
                                                    <a type="buttion" class="btn btn-primary btn-xs btn-default submenuitem" data-toggle="modal" data-target="#exampleModal_${comment.id}" data-whatever="@mdo" target= "_self" title="编辑"><i class="ftsucai-edit-2"></i></a>
                                                    <div class="modal fade" id="exampleModal_${comment.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                    <h4 class="modal-title" id="exampleModalLabel_${comment.id}">修改用户<${comment.username}>的评论信息：</h4>
                                                                </div>
                                                                <form id="form_update_${comment.id}" action="${pageContext.request.contextPath}/admin/updateCommentServlet?commentId=${comment.id}" method="post">
                                                                    <div class="modal-body">
                                                                        <div class="form-group">
                                                                            <label for="updateContext_${comment.id}" class="control-label">评论内容：</label>
                                                                            <textarea class="form-control" id="updateContext_${comment.id}" name="updateContext_${comment.id}" >${comment.context}</textarea>
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                                    <button type="button" class="btn btn-primary" onclick="updateComment(${comment.id})" >确认修改</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a class="btn btn-xs btn-default submenuitem" href="javascript:deleteComment(${comment.id})" target= "_self" title="删除" data-toggle="tooltip"><i class="ftsucai-del-2"></i></a>
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
                                <c:if test="${sessionScope.commentPb.totalCount != 0}">

                                    <c:if test="${sessionScope.commentPb.currentPage == 1}">
                                        <li class="disabled">
                                            <a class="btn submenuitem" href="javascript:void(0);">
                                                <span><i class="ftsucai-146"></i></span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${sessionScope.commentPb.currentPage != 1}">
                                        <li>
                                            <a class="btn submenuitem" href="${pageContext.request.contextPath}/admin/findCommentByPageServlet?currentPage=${sessionScope.commentPb.currentPage - 1}&rows=6&type=${sessionScope.commentCondition.type[0]}&up=${sessionScope.commentCondition.up[0]}&username=${sessionScope.commentCondition.username[0]}">
                                                <span><i class="ftsucai-146"></i></span>
                                            </a>
                                        </li>
                                    </c:if>


                                    <c:forEach begin="${sessionScope.commentPb.startPage}" end="${sessionScope.commentPb.endPage}" var="i" >
                                        <c:if test="${sessionScope.commentPb.currentPage == i}">
                                            <li class="active"><a  class="btn submenuitem" id="currentPage"
                                                                   href="${pageContext.request.contextPath}/admin/findCommentByPageServlet?currentPage=${i}&rows=6&type=${sessionScope.commentCondition.type[0]}&up=${sessionScope.commentCondition.up[0]}&username=${sessionScope.commentCondition.username[0]}">${i}</a></li>
                                        </c:if>
                                        <c:if test="${sessionScope.commentPb.currentPage != i}">
                                            <li><a  class="submenuitem" href="${pageContext.request.contextPath}/admin/findCommentByPageServlet?currentPage=${i}&rows=6&type=${sessionScope.commentCondition.type[0]}&up=${sessionScope.commentCondition.up[0]}&username=${sessionScope.commentCondition.username[0]}">${i}</a></li>
                                        </c:if>
                                    </c:forEach>

                                    <c:if test="${sessionScope.commentPb.currentPage == sessionScope.commentPb.totalPage}">
                                        <li class="disabled">
                                            <a class="btn submenuitem"
                                               href="javascript:void(0);">
                                                <span><i class="ftsucai-139"></i></span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${sessionScope.commentPb.currentPage != sessionScope.commentPb.totalPage}">
                                        <li>
                                            <a class="btn submenuitem"
                                               href="${pageContext.request.contextPath}/admin/findCommentByPageServlet?currentPage=${sessionScope.commentPb.currentPage + 1}&rows=6&type=${sessionScope.commentCondition.type[0]}&up=${sessionScope.commentCondition.up[0]}&username=${sessionScope.commentCondition.username[0]}">
                                                <span><i class="ftsucai-139"></i></span>
                                            </a>
                                        </li>
                                    </c:if>

                                    <span style="font-size: 25px;margin-left: 5px;">
                                    共${sessionScope.commentPb.totalCount}条记录，共${sessionScope.commentPb.totalPage}页
                                </span>
                                </c:if>
                                <c:if test="${sessionScope.commentPb.totalCount == 0}">
                                <span style="font-size: 25px;margin-left: 5px;">
                                    当前没有任何评论！
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
                window.location.href = "${pageContext.request.contextPath}/admin/findCommentByPageServlet?rows=6&" + $("#search-field").val() + "=" + keyValue;
            }
        });

    });

    function updateComment(id){
        const v = "#updateContext_" + id;
        const context = $(v).val();
        if(context == null || context == "") {
            alert("评论内容不能为空~！！！");
            return false;
        }
        if(confirm("您确定要修改吗？")) {
            let str = "#form_update_" + id;
            $(str).submit();
        }
    }

    function deleteComment(id){
        //用户安全提示
        if(confirm("您确定要删除吗？")){
            //访问路径
            location.href="${pageContext.request.contextPath}/admin/deleteCommentServlet?commentId="+id;
        }
    }

    // 给删除按钮添加事件
    function delSelected(){
        if(confirm("您确定要删除选中条目吗？")){
            let flag = false;
            // 判断是否有选中
            let checks = document.getElementsByName("commentId");
            let str = "";
            for(let i = 0; i < checks.length; i++){
                if(checks[i].checked){
                    //有一个条目选中了
                    flag = true;
                    str += "commentId=" + checks[i].value + "&";
                    // break;
                }
            }

            if(flag) {
                // $("#form_del").submit();
                window.location.href = "${pageContext.request.contextPath}/admin/deleteCommentServlet?" + str;
            }else {
                return false;
            }
        }
    }

</script>
</body>
</html>
