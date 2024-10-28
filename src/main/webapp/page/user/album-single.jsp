<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="_pre.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: martin
  Date: 2020/11/17
  Time: 10:52
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
    <title>歌曲列表</title>
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/user/assets/css/app.css">
</head>

<body class="sidebar-mini sidebar-collapse theme-dark  sidebar-expanded-on-hover has-preloader" style="display: none;">

<div id="app">
<!--Page Content-->
<main id="pageContent" class="page has-sidebar">
    <div class="container-fluid relative animatedParent animateOnce p-0">
        <div class="animated fadeInUpShort">
            <!--Banner-->
            <section class="relative" data-bg-possition="center"
                     style="background-image:url('assets/img/demo/b3.jpg');">
                <div class="has-bottom-gradient">
                    <div class="row pt-5 ml-lg-5 mr-lg-5">
                        <div class="col-md-10 offset-1">
                            <div class="row my-5 pt-5">
                                <div class="col-md-3">
                                    <img src="${pageContext.request.contextPath}/${sessionScope.singer.pic}" alt="/">
                                </div>
                                <div class="col-md-9">
                                    <div class="d-md-flex align-items-center justify-content-between">
                                        <h1 class="my-3 text-white ">${sessionScope.singer.name}</h1>
                                        <div class="ml-auto mb-2">
                                            <a href="#" class="snackbar" data-text="Bookmark clicked"
                                               data-pos="top-right"
                                               data-showAction="true"
                                               data-actionText="ok"
                                               data-actionTextColor="#fff"
                                               data-backgroundColor="#0c101b"><i class="icon-bookmark s-24"></i></a>
                                            <a href="#" class="snackbar ml-3" data-text="You like this song"
                                               data-pos="top-right"
                                               data-showAction="true"
                                               data-actionText="ok"
                                               data-actionTextColor="#fff"
                                               data-backgroundColor="#0c101b"><i class="icon-heart s-24"></i></a>
                                            <a href="#" class="snackbar ml-3" data-text="Thanks for sharing"
                                               data-pos="top-right"
                                               data-showAction="true"
                                               data-actionText="ok"
                                               data-actionTextColor="#fff"
                                               data-backgroundColor="#0c101b"><i class="icon-share-1 s-24"></i></a>
                                        </div>
                                    </div>

                                    <div class="text-white my-2">
                                        <p>${sessionScope.singer.introduction}</p>
<%--                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. <br>Architecto atque--%>
<%--                                            aut blanditiis consectetur</p>--%>
                                    </div>
                                    <div class="pt-3">
                                        <a href="${pageContext.request.contextPath}/playListServlet?page=${pageContext.request.servletPath}" class="btn btn-primary btn-lg">播放全部</a>
                                    </div>
                                    <div class="pt-1">
                                        <span class="text-light">歌曲数量：${sessionScope.songPage.totalCount}    当前页数：${sessionScope.songPage.currentPage}    总页数：${sessionScope.songPage.totalPage}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="bottom-gradient "></div>
            </section>
            <!--@Banner-->

            <div class="card-body">
                <div class="lightSlider service-blocks " data-item="1" data-item-md="1" data-item-sm="1"
                     data-auto="false" data-loop="true" data-pager="false">
                    <div class="p-3 p-lg-5">
                        <!--New Releases-->
                        <section>
                            <div class="row">
                                <div class="col-lg-10 offset-lg-1">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="playlist">
                                                <ul class="list-group">
                                                    <c:if test="${sessionScope.songPage.list == null || sessionScope.songPage.list.size() == 0}">
                                                        <li class="list-group-item my-1">
                                                            <div class="d-flex align-items-center">
                                                                <div class="col-1">
                                                                    <a class="no-ajaxy media-url" href="#" data-wave="assets/media/track1.json">
                                                                        <i class="icon-play s-28"></i>
                                                                    </a>
                                                                </div>
                                                                <div class="col-6">
                                                                    <h6>该艺人很懒，没有任何歌曲！</h6>
                                                                </div>
                                                                <span class=" ml-auto">0:00</span>
                                                                <a href="#" class="ml-auto"><i class="icon-share-1"></i></a>
                                                                <div class="ml-auto">
                                                                    <a href="#" onclick="javascript:history.back(-1);" class="btn btn-outline-primary btn-sm d-none d-lg-block">返回前页</a>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </c:if>

                                                    <c:if test="${sessionScope.songPage.list != null || sessionScope.songPage.list.size() != 0}">

                                                        <c:forEach items="${sessionScope.songPage.list}" var="song" varStatus="s">
                                                            <li class="list-group-item my-1">
                                                                <div class="d-flex align-items-center">
                                                                    <div class="col-1">
                                                                        <a class="no-ajaxy media-url" href="${pageContext.request.contextPath}/${song.url}" data-wave="assets/media/track1.json">
                                                                            <i class="icon-play s-28" onclick="addPlayCount(${song.songId})"></i>
                                                                        </a>
                                                                    </div>
                                                                    <div class="col-6">
                                                                        <h6><a href="${pageContext.request.contextPath}/commentMusicServlet?songId=${song.songId}" class="d-none d-lg-block">${song.name}</a></h6>
                                                                    </div>
                                                                    <span class=" ml-auto"><fmt:formatNumber value="${(song.time - song.time % 60) / 60}" type="number" pattern="#" maxFractionDigits="0"/>分
                                                                <fmt:formatNumber value="${song.time % 60}"/>秒</span>
                                                                    <a href="${pageContext.request.contextPath}/addMusicToPlayListServlet?page=${pageContext.request.servletPath}&songId=${song.songId}" class="ml-auto"><i class="icon-add-1"></i></a>
                                                                    <div class="ml-auto">
                                                                        <a href="javascript:download(${song.songId})" class="btn btn-outline-primary btn-sm d-none d-lg-block icon-download">下载</a>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </c:forEach>

                                                    </c:if>
                                                </ul>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!--@New Releases-->
                    </div>
                </div>
                <div class="lSAction">
                    <a class="lSPrev" onclick="prev()">
                        <span class="icon icon-angle-left" style="font-size: 8px">上页</span>
                    </a>
                    <a class="lSNext" onclick="next()">
                        <span class="icon icon-angle-right" style="font-size: 8px">下页</span>
                    </a>
                </div>
            </div>

        </div>
    </div>
</main><!--@Page Content-->
</div><!--@#app-->
<!--/#app -->
<script src="assets/js/app.js"></script>

<script type="text/javascript">
    $(function(){

    });
    function prev(){
        window.location.href = "${pageContext.request.contextPath}/albumSingleServlet?singerName=${sessionScope.singer.name}&currentPage=${sessionScope.songPage.currentPage - 1}&rows=6"
    }

    function next() {
        window.location.href = "${pageContext.request.contextPath}/albumSingleServlet?singerName=${sessionScope.singer.name}&currentPage=${sessionScope.songPage.currentPage + 1}&rows=10"

    }

    function download(songId) {
        window.location.href = "${pageContext.request.contextPath}/user/person/downLoadServlet?songId=" + songId;
    }

</script>


</body>
</html>