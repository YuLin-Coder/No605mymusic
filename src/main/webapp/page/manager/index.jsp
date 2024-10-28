<%@ page import="com.martinwj.mymusic.entity.Admin" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/9 0009
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员后台</title>
    <link rel="icon" href="favicon.ico" type="image/ico">
    <link href="${pageContext.request.contextPath }/css/manager/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/manager/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/manager/theme.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/manager/fonts.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/js/manager/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/manager/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath }/js/manager/jquery.cookie.js"></script>
    <script src="${pageContext.request.contextPath }/js/manager/framework.js"></script>

    <%
        String projectPath = request.getContextPath();
        System.out.println(projectPath);

        Admin admin = (Admin) session.getAttribute("admin");
        System.out.println(admin);
        if(admin == null) {
            response.sendRedirect(request.getContextPath() + "/page/manager/login.jsp");
            return ;
        }
    %>
</head>

<body class="theme-blue-gradient pace-done" style="overflow: hidden; ">
<div class="pace  pace-inactive">
    <div class="pace-progress" style="width: 100%;" data-progress-text="100%" data-progress="99">
        <div class="pace-progress-inner"></div>
    </div>
    <div class="pace-activity"></div>
</div>
<div id="ajax-loader" style="background: rgb(255, 255, 255); left: -50%; top: -50%; width: 200%; height: 200%; overflow: hidden; display: none; position: fixed; z-index: 10000; cursor: progress;">
    <img style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; margin: auto;" src="../../img/loader.gif">
</div>
<div id="theme-wrapper">
    <header class="navbar" id="header-navbar">
        <div class="container" style="padding-right: 0px;">
            <a class="navbar-brand" id="logo" href="#">后台管理系统</a>
            <div class="clearfix">
                <div class="nav-no-collapse navbar-left pull-left hidden-sm hidden-xs">
                    <ul class="nav navbar-nav pull-left">
                        <li>
                            <a id="make-small-nav">
                                <div class="ftdms-aside-toggler">
                                    <span class="ftdms-toggler-bar"></span>
                                    <span class="ftdms-toggler-bar"></span>
                                    <span class="ftdms-toggler-bar"></span>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="nav-no-collapse pull-right" id="header-nav">
                    <ul class="nav navbar-nav pull-right">
                        <li class="dropdown profile-dropdown">
                            <a class="dropdown" href="#" data-toggle="dropdown">
                                <!-- <img class="img-qrcode img-qrcode-46" src="images/ftsucai.png" alt="用户头像" /> -->
                                <span class="hidden-xs">当前用户：<%=admin.getAdminName()%>&nbsp;&nbsp;&nbsp;&nbsp;角色：<%=admin.getUserType()%></span></a>
                            <ul class="dropdown-menu pull-right">
                                <!--				    <li>-->
                                <!--					  <a class="submenuitem" href="pages_profile.html" data-id="rofile" data-index="100"><i class="ft ftsucai-58"></i>个人信息</a>-->
                                <!--                    </li>-->
                                <!--					<li>-->
                                <!--					  <a class="submenuitem" href="pages_edit_pwd.html" data-id="linkpwd" data-index="101"><i class="ft ftsucai-edit-2"></i>修改密码</a>-->
                                <!--                    </li>-->
                                <li>
                                    <a href="<%=projectPath + "/admin/loginoutServlet"%>"><i class="ft ftsucai-exit2"></i>安全退出</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <div class="container" id="page-wrapper">
        <div class="row">
            <div id="nav-col">
                <section class="col-left-nano" id="col-left">
                    <div class="col-left-nano-content" id="col-left-inner">
                        <div class="collapse navbar-collapse navbar-ex1-collapse" id="sidebar-nav">
                            <ul class="nav nav-pills nav-stacked">
                                <li>
                                    <a class="dropdown-toggle" href="#" data-id="a1">
                                        <i class="ft ftsucai-82"></i>
                                        <span>后台首页</span>
                                        <i class="ft ftsucai-139 drop-icon"></i>
                                    </a>
                                    <ul class="submenu">
                                        <li>
                                            <a class="submenuitem" href="${pageContext.request.contextPath}/admin/findSingerByPageServlet" data-id="link1" data-index="1">歌手管理</a>
                                        </li>
                                    </ul>
                                    <ul class="submenu">
                                        <li>
                                            <a class="submenuitem" href="${pageContext.request.contextPath}/admin/findSongByPageServlet" data-id="link2" data-index="2">音乐管理</a>
                                        </li>
                                    </ul>
<%--                                    <ul class="submenu">--%>
<%--                                        <li>--%>
<%--                                            <a class="submenuitem" href="cd.jsp" data-id="link3" data-index="3">专辑管理</a>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
                                    <ul class="submenu">
                                        <li>
                                            <a class="submenuitem" href="${pageContext.request.contextPath}/admin/showUsersByPageServlet" data-id="link3" data-index="3">用户管理</a>
                                        </li>
                                    </ul>
                                    <ul class="submenu">
                                        <li>
                                            <a class="submenuitem" href="${pageContext.request.contextPath}/admin/findCommentByPageServlet" data-id="link3" data-index="3">留言管理</a>
                                        </li>
                                    </ul>
                                </li>

                            </ul>
                        </div>
                    </div>
                </section>
            </div>
            <div id="content-wrapper">
                <div class="content-tabs" style="height:44px;border-bottom:2px solid #f0f0f0;">
                    <button class="roll-nav roll-left tabLeft">
                        <i class="ft ftsucai-backward2"></i>
                    </button>
                    <nav class="page-tabs menuTabs">
                        <div class="page-tabs-content" style="margin-left: 0;">
                            <a class="menuTab active" href="javascript:;" data-id="home.html">欢迎首页</a></div>
                    </nav>
                    <button class="roll-nav roll-right tabRight">
                        <i class="ft ftsucai-forward3"></i>
                    </button>
                    <div class="btn-group roll-nav roll-right">
                        <button class="dropdown tabClose" data-toggle="dropdown">页签操作
                            <i class="ft caret" style="padding-top: 3px;"></i>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <li>
                                <a class="tabReload" href="javascript:void(0);"><i class="ft ftsucai-spinner3"></i>刷新当前页面</a></li>
                            <li>
                                <a class="tabCloseCurrent" href="javascript:void(0);"><i class="ft ftsucai-close-3"></i>关闭当前页面</a></li>
                            <li>
                                <a class="tabCloseAll" href="javascript:void(0);"><i class="ft ftsucai-77"></i>关闭全部页面</a></li>
                            <li>
                                <a class="tabCloseOther" href="javascript:void(0);"><i class="ft ftsucai-120"></i>除此之外全关</a></li>
                        </ul>
                    </div>
                </div>
                <div class="content-iframe" style="background-color: #f9f9f9;">
                    <div class="mainContent" id="content-main" style="margin: 0; padding: 0; height: 1050px;">
                        <iframe name="main_iframe" width="100%" height="100%" class="main_iframe" id="default" src="home.jsp" frameborder="0" data-id="home.html"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="loadingPage" style="display: none;">
    <div class="loading-shade"></div>
    <div class="loading-content" onClick="$.loading(false)">数据加载中，请稍后…</div>
</div>
<script src="${pageContext.request.contextPath }/js/manager/index.js"></script>
<script src="${pageContext.request.contextPath }/js/manager/indextab.js"></script>
<script src="${pageContext.request.contextPath }/js/manager/pace.min.js"></script>
</body>

</html>