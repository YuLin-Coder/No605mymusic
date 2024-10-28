<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: martin
  Date: 2020/11/16
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${pageContext.request.contextPath}/page/user/assets/img/basic/favicon.ico" type="image/x-icon">
    <title>MUSIC</title>
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/user/assets/css/app.css">
</head>

<body class="sidebar-mini sidebar-collapse theme-dark  sidebar-expanded-on-hover has-preloader" style="display: none;">
<!-- Pre loader
  To disable preloader remove 'has-preloader' from body
  要禁用预加载器，请从正文中删除“ has-preloader”
 -->

<div id="loader" class="loader">
    <div class="loader-container">
        <div class="preloader-wrapper big active">
            <div class="spinner-layer spinner-blue">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div><div class="gap-patch">
                <div class="circle"></div>
            </div><div class="circle-clipper right">
                <div class="circle"></div>
            </div>
            </div>

            <div class="spinner-layer spinner-red">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div><div class="gap-patch">
                <div class="circle"></div>
            </div><div class="circle-clipper right">
                <div class="circle"></div>
            </div>
            </div>

            <div class="spinner-layer spinner-yellow">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div><div class="gap-patch">
                <div class="circle"></div>
            </div><div class="circle-clipper right">
                <div class="circle"></div>
            </div>
            </div>

            <div class="spinner-layer spinner-green">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div><div class="gap-patch">
                <div class="circle"></div>
            </div><div class="circle-clipper right">
                <div class="circle"></div>
            </div>
            </div>
        </div>
    </div>
</div>

<!-- @Pre loader-->
<div id="app">


    <aside class="main-sidebar fixed offcanvas shadow" data-toggle='offcanvas'>
        <div class="sidebar">
            <ul class="sidebar-menu">
                <li><a class="ajaxifyPage active" href="${pageContext.request.contextPath}/homePageServlet">
                    <i class="icon icon-home-1 s-24"></i> <span>主页</span>
                </a>
                </li>
                <li><a class="ajaxifyPage" href="${pageContext.request.contextPath}/getAllTypesServlet">
                    <i class="icon icon-layers-1 s-24"></i> <span>分类</span>
                </a>
                <li>
                <li><a class="ajaxifyPage" href="${pageContext.request.contextPath}/getAllSingerServlet">
                    <!--                <i class="icon icon-windows s-24"></i> <span>Albums</span>-->
                    <i class="icon icon-windows s-24"></i> <span>专辑</span>
                </a>
                <li>
                <li><a class="ajaxifyPage" href="videos.html">
                    <!--                <i class="icon icon-video-player-2 s-24"></i> <span>Videos</span>-->
                    <i class="icon icon-video-player-2 s-24"></i> <span>影片</span>
                </a>
                </li>

            </ul>

        </div>
    </aside>
    <!--Sidebar End-->

    <!-- Right Sidebar -->
    <aside class="control-sidebar fixed ">
        <div class="slimScroll">
            <div class="sidebar-header">
                <h4>播放列表</h4>
                <p>Awesome Collection for you</p>
                <a href="#" data-toggle="control-sidebar" class="paper-nav-toggle  active"><i></i></a>
            </div>
            <div class="p-3">
                <ul id="playlist" class="playlist list-group">
                    <c:if test="${sessionScope.songPlayList != null}">
                        <c:forEach items="${sessionScope.songPlayList}" var="song" varStatus="s">
                            <li class="list-group-item my-1">
                                <a class="icon-minus" href="${pageContext.request.contextPath}/delSongInPlayListServlet?page=${pageContext.request.servletPath}&songId=${song.songId}"></a>
                                <a class="icon-add" href="#">添加到歌单</a>

                                <a class="no-ajaxy media-url" href="${pageContext.request.contextPath}/${song.url}" data-wave="assets/media/track1.json">
                                    <div onclick="addPlayCount(${song.songId})" class="d-flex justify-content-between align-items-center">
                                        <i class="icon-play s-28"></i>
                                        <figure class="avatar-md float-left mr-3 mt-1">
                                            <img class="r-5" src="assets/img/demo/a1.jpg"  alt=""><%-- src="assets/img/demo/a1.jpg" --%>
                                        </figure>
                                        <div>
                                            <h6>${song.name}</h6>${song.singerName}
                                        </div>
                                        <span class="badge badge-primary badge-pill">
                                            <fmt:formatNumber value="${(song.time - song.time % 60) / 60}" type="number" pattern="#" maxFractionDigits="0"/>:
                                            <fmt:formatNumber value="${song.time % 60}"/></span>
                                    </div>
                                </a>
                            </li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${sessionScope.songPlayList == null}">
                            <li class="list-group-item my-1">
                                <a class="no-ajaxy media-url" href="#" data-wave="assets/media/track1.json">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <i class="icon-play s-28"></i>
                                        <figure class="avatar-md float-left mr-3 mt-1">
                                            <img class="r-5" src="#" alt="">
                                        </figure>
                                        <div>
                                            <h6>还没有播放任何歌曲哟</h6>
                                            <a href="${pageContext.request.contextPath}/getAllSingerServlet">请前往挑选歌曲</a>
                                        </div>
                                        <span class="badge badge-primary badge-pill">00:00</span>
                                    </div>
                                </a>
                            </li>
                    </c:if>


                </ul>

            </div>
        </div>
    </aside>
    <!-- /.right-sidebar -->
    <!-- Add the sidebar's background. This div must be placed
             immediately after the control sidebar -->
    <!--    添加侧边栏的背景。该div必须放置在控件侧边栏之后-->
    <div class="control-sidebar-bg shadow  fixed"></div>

    <svg class="d-none">
        <defs>
            <symbol id="icon-cross" viewBox="0 0 24 24">
                <title>cross</title>
                <path
                        d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"
                />
            </symbol>
        </defs>
    </svg>
    <div class="searchOverlay page">
        <button
                id="btn-searchOverlay-close"
                class="btn btn--searchOverlay-close"
                aria-label="Close searchOverlay form"
        >
            <svg class="icon icon--cross">
                <use xlink:href="#icon-cross"></use>
            </svg>
        </button>
        <div class="searchOverlay__inner searchOverlay__inner--up">
            <form class="searchOverlay__form" action="${pageContext.request.contextPath}/searchOverlayServlet" method="post">
                <input
                        class="searchOverlay__input"
                        name="searchOverlay"
                        type="text"
                        placeholder="Search"
                        autocomplete="off"
                        spellcheck="false"
                        value="${sessionScope.searchInfo.info}"
                />
                <input type="hidden" id="servletPath" name="servletPath" value="${pageContext.request.servletPath}">
                <!--            <span class="searchOverlay__info">Hit enter to searchOverlay or ESC to close</span>-->
                <span class="searchOverlay__info">按Enter键搜索叠加层或ESC键以关闭</span>
            </form>
        </div>
        <div class="searchOverlay__inner searchOverlay__inner--down">
            <div class="searchOverlay__related">
                <div class="searchOverlay__suggestion">
                    <div class="card mb-3">
                        <div class="card-header transparent b-b">
                            <strong>歌手</strong>
                        </div>
                        <ul class="playlist list-group list-group-flush">
                            <c:if test="${sessionScope.searchInfo.map == null || sessionScope.searchInfo.map.size() == 0}">
                                <li class="list-group-item">
                                    <div class="d-flex align-items-center">
                                        <div class="col-10">
                                            <figure class="avatar avatar-md float-left  mr-3 mt-1">
                                                <img src="assets/img/demo/u1.jpg" alt="">
                                            </figure>
                                            <h6>没有搜索到歌手信息</h6>
                                            <small>未找到</small>
                                        </div>
                                        <a href="#" class="ml-auto"><i class="icon-more"></i></a>
                                    </div>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.searchInfo.map != null && sessionScope.searchInfo.map.size() != 0}">
                                <c:forEach begin="0" end="3" step="1" items="${sessionScope.searchInfo.map}" var="map" varStatus="s">
                                <li class="list-group-item">
                                    <div class="d-flex align-items-center">
                                        <div class="col-10">
                                            <figure class="avatar avatar-md float-left  mr-3 mt-1">
                                                <img src="${pageContext.request.contextPath}/${map.key.pic}" alt="">
                                            </figure>
                                            <h6>${map.key.name}</h6>
                                            <small>${map.value} musics</small>
                                        </div>
                                        <a href="${pageContext.request.contextPath}/albumSingleServlet?singerName=${map.key.name}" class="ml-auto"><i class="icon-more"></i></a>
                                    </div>
                                </li>
                                </c:forEach>
                            </c:if>
                        </ul>
                    </div>
                </div>
                <div class="searchOverlay__suggestion">
                    <div class="card mb-3">
                        <div class="card-header transparent b-b">
                            <strong>歌曲</strong>
                        </div>
                        <ul class="playlist list-group list-group-flush">
                            <c:if test="${sessionScope.searchInfo.list == null || sessionScope.searchInfo.list.size() == 0}">
                                <li class="list-group-item">
                                    <div class="d-flex align-items-center ">
                                        <div class="col-8 ">
                                            <a href="#">
                                                <h6>未搜索到歌曲信息</h6>
                                            </a>
                                            <small class="mt-1"><i class="icon-placeholder-3 mr-1 "></i> 未找到
                                            </small>
                                        </div>
                                        <div class="ml-auto">
                                            <div class="text-lg-center  bg-primary r-10 p-2 text-white primary-bg">
                                                <div class="s-18">19</div>
                                                <small>11, 2020</small>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.searchInfo.list != null && sessionScope.searchInfo.list.size() != 0}">
                                <c:forEach  begin="0" end="2" step="1" items="${sessionScope.searchInfo.list}" var="song" varStatus="s">
                                <li class="list-group-item">
                                    <div class="d-flex align-items-center ">
                                        <div class="col-8">
                                            <a href="${pageContext.request.contextPath}/commentMusicServlet?songId=${song.songId}">
                                                <h6>${song.name}</h6>
                                            </a>
                                            <small class="mt-1"><i class="icon-placeholder-3 mr-1 "></i>
                                                    ${song.singerName}   ---   time :
                                                <fmt:formatNumber value="${(song.time - song.time % 60) / 60}" type="number" pattern="#" maxFractionDigits="0"/>:
                                                <fmt:formatNumber value="${song.time % 60}"/>
                                            </small>
                                        </div>
                                        <div class="ml-auto">
                                            <div class="text-lg-center  bg-primary r-10 p-2 text-white primary-bg">
                                                <div class="s-18">${song.publicDate.substring(8, 11)}</div>
                                                <small>${song.publicDate.substring(5, 7)}, ${song.publicDate.substring(0, 4)}</small>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                </c:forEach>
                            </c:if>

<%--                            <li class="list-group-item">--%>
<%--                                <div class="d-flex align-items-center ">--%>
<%--                                    <div class="col-8 ">--%>
<%--                                        <a href="video-single.html">--%>
<%--                                            <h6>Battal of Bands</h6>--%>
<%--                                        </a>--%>
<%--                                        <small class="mt-1"><i class="icon-placeholder-3 mr-1 "></i> London Music Hall--%>
<%--                                        </small>--%>
<%--                                    </div>--%>
<%--                                    <div class="ml-auto">--%>
<%--                                        <div class="text-lg-center  bg-primary r-10 p-2 text-white primary-bg">--%>
<%--                                            <div class="s-18">12</div>--%>
<%--                                            <small>July, 2019</small>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </li>--%>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--navbar-->
    <nav class="navbar-wrapper navbar-bottom-fixed shadow">
        <div class="navbar navbar-expand player-header justify-content-between  bd-navbar">
            <div class="d-flex align-items-center">
                <a href="#" data-toggle="push-menu" class="paper-nav-toggle pp-nav-toggle ml-2 mr-2">
                    <i></i>
                </a>
                <a class="navbar-brand d-none d-lg-block" href="${pageContext.request.contextPath}/page/user/index.jsp">
                    <div class="d-flex align-items-center s-14 l-s-2">
                        <span>记录</span>
                    </div>
                </a>
            </div>


            <!--Player-->
            <div id="mediaPlayer" class="player-bar col-lg-8 col-md-5" data-auto="true">
                <div class="row align-items-center grid">
                    <div class="col">
                        <div class="d-flex align-items-center">
                            <button id="previousTrack" class="btn btn-link d-none d-sm-block">
                                <i class="icon-back s-18"></i>
                            </button>
                            <button class=" btn btn-link" id="playPause">
                                <span id="play"><i class="icon-play s-36"></i></span>
                                <span id="pause" style="display: none"><i class="icon-pause s-36 text-primary"></i></span>
                            </button>
                            <button id="nextTrack" class="btn btn-link d-none d-sm-block">
                                <i class="icon-next s-18"></i>
                            </button>
                        </div>
                    </div>
                    <div class="col-8 d-none d-lg-block">
                        <div id="waveform"></div>
                    </div>
                    <div class="col d-none d-lg-block">
                        <small class="track-time mr-2 text-primary align-middle"></small>
                        <a data-toggle="control-sidebar">
                            <i class="icon icon-menu-3 s-24 align-middle"></i>
                        </a>
                    </div>
                </div>
            </div>
            <!--@Player-->
            <!--Top Menu Start -->
            <!-- 顶部菜单开始 -->
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">

                    <!-- Right Sidebar Toggle Button -->
                    <!-- 右侧边栏切换按钮-->
                    <li class="search、Overlay-wrap">
                        <a href="#" id="btn-searchOverlay" class="nav-link mr-3 btn--searchOverlay no-ajaxy">
                            <i class="icon icon-search s-24"></i>
                        </a>

                    </li>
                    <!-- User Account-->
                    <!--        用户账号 -->
                    <li class="dropup custom-dropdown user user-menu ">
                        <a href="#" class="nav-link" data-toggle="dropdown">
                            <figure class="avatar">
                                <img src="${pageContext.request.contextPath}/${sessionScope.user.avatar == null ? 'page/user/assets/img/demo/u7.png' : sessionScope.user.avatar}" alt="">
                            </figure>
                            <i class="icon-more_vert "></i>
                        </a>
                        <div class="dropdown-menu p-4 dropdown-menu-right">
                            <div class="row box justify-content-between my-4">
                                <div class="col text-center">
                                    <a class="ajaxifyPage" href="${pageContext.request.contextPath}/page/user/login.jsp">
                                        <i class="icon icon-save s-24"></i>
<%--                                        <span>保存</span>--%>
                                        <div class="pt-1">登陆</div>
                                    </a>
                                </div>
                                <div class="col text-center">
                                    <a class="ajaxifyPage" href="${pageContext.request.contextPath}/page/user/person/saved.jsp">
                                        <i class="icon icon-heart s-24"></i>
                                        <div class="pt-1">收藏</div>
                                    </a>
                                </div>
                                <div class="col text-center">
                                    <a class="ajaxifyPage" href="${pageContext.request.contextPath}/page/user/person/profile.jsp">
                                        <i class="icon-user-4  s-24"></i>
                                        <div class="pt-1">个人资料</div>
                                    </a>
                                </div>
                                <div class="col text-center">
                                    <a class="ajaxifyPage" href="${pageContext.request.contextPath}/user/logoutServlet">
                                        <i class="icon-user-4  s-24"></i>
                                        <div class="pt-1">退出登录</div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

    </nav>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/myJs/common.js"></script>
<script type="text/javascript">
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
</script>
</body>
</html>
