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
    <title>用户管理</title>
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
                                    <input type="text" hidden name="search_field" id="search-field" value="email"/>
                                    <button class="btn btn-default dropdown-toggle" id="search-btn" data-toggle="dropdown" type="button" aria-haspopup="true" aria-expanded="false">
                                        邮箱 <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="email">邮箱</a> </li>
                                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="sex">性别(0未知1男2女)</a> </li>
                                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="active">是否激活（1或0）</a> </li>
                                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="type">类型（0普通/1VIP)</a> </li>
                                        <li> <a tabindex="-1" href="javascript:void(0)" data-field="name">用户名称</a> </li>
                                    </ul>
                                </div>
                                <input type="text" class="form-control" value="${sessionScope.userKeyName}" id="keyName" name="keyName" placeholder="请输入邮箱">
                            </div>
                        </form>
                        <div class="toolbar-btn-action">
                            <a class="btn submenuitem btn-success m-r-5 " href="${pageContext.request.contextPath}/admin/showUsersByPageServlet?currentPage=${sessionScope.userPb.currentPage}&rows=6&name=${sessionScope.userCondition.name[0]}&sex=${sessionScope.userCondition.sex[0]}&email=${sessionScope.userCondition.email[0]}&active=${sessionScope.userCondition.active[0]}&type=${sessionScope.userCondition.type[0]}" data-id="link553" data-index="553"> 刷新</a>
                            <a class="btn submenuitem btn-danger" href="javascript:delSelected();" data-id="link555" data-index="555"> 删除选中</a>
                        </div>
                    </div>
                    <div class="card-body">

                        <div class="table-responsive">
<%--                            <form id="form_del" action="${pageContext.request.contextPath}/admin/deleteUserServlet" method="post">--%>
                                <table class="table table-bordered" >
                                    <thead>
                                    <tr>
                                        <th width="5">
                                            <label class="ftdms-checkbox checkbox-primary">
                                                <input type="checkbox" id="check-all"><span></span>
                                            </label>
                                        </th>
                                        <th>编号</th>
                                        <th>用户账号</th>
                                        <th>用户名称</th>
                                        <th>性别</th>
                                        <th>邮箱</th>
                                        <th>类型</th>
                                        <th>创建日期</th>
                                        <th>是否激活</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${sessionScope.userPb.list}" var="user" varStatus="s">
                                        <tr>
                                            <td>
                                                <label class="ftdms-checkbox checkbox-primary">
                                                    <input type="checkbox" id="userId" name="userId" value="${user.userId}"/><span></span>
                                                </label>
                                            </td>
                                            <td>${s.count}</td>
                                            <td>${user.username}</td>
                                            <td>${user.name}</td>
                                            <td>${user.sex == 0 ? "未知" : user.sex == 1 ? "男" : "女"}</td>
                                            <td>${user.email}</td>
                                            <td>${user.type == 0 ? "普通用户" : "VIP用户"}</td>
                                            <td>${user.createDate}</td>
                                            <td>${user.active == 1 ? "是" : "否"}</td>
                                            <td>
                                                <div class="btn-group">
                                                    <a type="buttion" class="btn btn-primary btn-xs btn-default submenuitem" data-toggle="modal" data-target="#exampleModal_${user.userId}" data-whatever="@mdo" target= "_self" title="编辑"><i class="ftsucai-edit-2"></i></a>
                                                    <div class="modal fade" id="exampleModal_${user.userId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                    <h4 class="modal-title" id="exampleModalLabel_${user.userId}">修改用户<${user.name}>信息：</h4>
                                                                </div>
                                                                <form id="form_update_${user.userId}" action="${pageContext.request.contextPath}/admin/updateUserServlet?userId=${user.userId}" method="post">
                                                                    <div class="modal-body">
                                                                        <div class="form-group">
                                                                            <label for="old_password_${user.userId}" class="control-label">旧密码：</label>
                                                                            <input class="form-control" type="text" readonly id="old_password_${user.userId}" name="old_password_${user.userId}" value="${user.password}"/>
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label for="update_password_${user.userId}" class="control-label">新密码：</label>
                                                                            <input class="form-control" type="text" id="update_password_${user.userId}" name="update_password_${user.userId}" placeholder="请输入新密码"/>
                                                                        </div>
                                                                    </div>
                                                                </form>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                                    <button type="button" class="btn btn-primary" id="updateBtn_${user.userId}" onclick="updateUser(${user.userId})" >确认修改</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a class="btn btn-xs btn-default submenuitem" href="javascript:deleteUser(${user.userId})" target= "_self" title="删除" data-toggle="tooltip"><i class="ftsucai-del-2"></i></a>
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
                                <c:if test="${sessionScope.userPb.totalCount != 0}">

                                    <c:if test="${sessionScope.userPb.currentPage == 1}">
                                        <li class="disabled">
                                            <a class="btn submenuitem" href="javascript:void(0);">
                                                <span><i class="ftsucai-146"></i></span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${sessionScope.userPb.currentPage != 1}">
                                        <li>
                                            <a class="btn submenuitem" href="${pageContext.request.contextPath}/admin/showUsersByPageServlet?currentPage=${sessionScope.userPb.currentPage - 1}&rows=6&name=${sessionScope.userCondition.name[0]}&sex=${sessionScope.userCondition.sex[0]}&email=${sessionScope.userCondition.email[0]}&active=${sessionScope.userCondition.active[0]}&type=${sessionScope.userCondition.type[0]}">
                                                <span><i class="ftsucai-146"></i></span>
                                            </a>
                                        </li>
                                    </c:if>


                                    <c:forEach begin="${sessionScope.userPb.startPage}" end="${sessionScope.userPb.endPage}" var="i" >
                                        <c:if test="${sessionScope.userPb.currentPage == i}">
                                            <li class="active"><a  class="btn submenuitem" id="currentPage"
                                                                   href="${pageContext.request.contextPath}/admin/showUsersByPageServlet?currentPage=${i}&rows=6&name=${sessionScope.userCondition.name[0]}&sex=${sessionScope.userCondition.sex[0]}&email=${sessionScope.userCondition.email[0]}&active=${sessionScope.userCondition.active[0]}&type=${sessionScope.userCondition.type[0]}">${i}</a></li>
                                        </c:if>
                                        <c:if test="${sessionScope.userPb.currentPage != i}">
                                            <li><a  class="submenuitem" href="${pageContext.request.contextPath}/admin/showUsersByPageServlet?currentPage=${i}&rows=6&name=${sessionScope.userCondition.name[0]}&sex=${sessionScope.userCondition.sex[0]}&email=${sessionScope.userCondition.email[0]}&active=${sessionScope.userCondition.active[0]}&type=${sessionScope.userCondition.type[0]}">${i}</a></li>
                                        </c:if>
                                    </c:forEach>

                                    <c:if test="${sessionScope.userPb.currentPage == sessionScope.userPb.totalPage}">
                                        <li class="disabled">
                                            <a class="btn submenuitem"
                                               href="javascript:void(0);">
                                                <span><i class="ftsucai-139"></i></span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${sessionScope.userPb.currentPage != sessionScope.userPb.totalPage}">
                                        <li>
                                            <a class="btn submenuitem"
                                               href="${pageContext.request.contextPath}/admin/showUsersByPageServlet?currentPage=${sessionScope.userPb.currentPage + 1}&rows=6&name=${sessionScope.userCondition.name[0]}&sex=${sessionScope.userCondition.sex[0]}&email=${sessionScope.userCondition.email[0]}&active=${sessionScope.userCondition.active[0]}&type=${sessionScope.userCondition.type[0]}">
                                                <span><i class="ftsucai-139"></i></span>
                                            </a>
                                        </li>
                                    </c:if>

                                    <span style="font-size: 25px;margin-left: 5px;">
                                    共${sessionScope.userPb.totalCount}条记录，共${sessionScope.userPb.totalPage}页
                                </span>
                                </c:if>
                                <c:if test="${sessionScope.userPb.totalCount == 0}">
                                <span style="font-size: 25px;margin-left: 5px;">
                                    当前没有任何用户！
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
                window.location.href = "${pageContext.request.contextPath}/admin/showUsersByPageServlet?rows=6&" + $("#search-field").val() + "=" + keyValue;
            }
        });

    });

    function updateUser(id){
        var passwordReg = /^(?=.*?[a-z)(?=.*>[A-Z])(?=.*?[0-9])[a-zA_Z0-9]{6,20}$/;
        var password = $("#update_password_" + id).val();
        if(password == null || password == "") {
            alert("密码不能为空~！！！");
            return false;
        }
        else if(!passwordReg.test(password)){
            alert("密码必须由字母、数字组成，且长度需在6~20个字符之间~！！！");
            return false;
        }
        if(confirm("您确定要修改吗？")) {
            let str = "#form_update_" + id;
            $(str).submit();
        }
    }

    function deleteUser(id){
        //用户安全提示
        if(confirm("您确定要删除吗？")){
            //访问路径
            location.href="${pageContext.request.contextPath}/admin/deleteUserServlet?userId="+id;
        }
    }

    // 给删除按钮添加事件
    function delSelected(){
        if(confirm("您确定要删除选中条目吗？")){
            let flag = false;
            // 判断是否有选中
            let checks = document.getElementsByName("userId");
            let str = "";
            for(let i = 0; i < checks.length; i++){
                if(checks[i].checked){
                    //有一个条目选中了
                    flag = true;
                    str += "userId=" + checks[i].value + "&";
                    // break;
                }
            }

            if(flag) {
                // $("#form_del").submit();
                window.location.href = "${pageContext.request.contextPath}/admin/deleteUserServlet?" + str;
            }else {
                return false;
            }
        }
    }

</script>
</body>
</html>
