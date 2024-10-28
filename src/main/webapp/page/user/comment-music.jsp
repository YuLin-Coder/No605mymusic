<%@ include file="_pre.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: martin
  Date: 2020/11/18
  Time: 9:33
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
    <title>歌曲评论</title>
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/user/assets/css/app.css">
</head>

<body class="sidebar-mini sidebar-collapse theme-dark  sidebar-expanded-on-hover has-preloader" style="display: none;">
<div id="app">

    <!--Page Content-->
    <main id="pageContent" class="page has-sidebar">

        <div class="container-fluid relative animatedParent animateOnce no-p">
            <div class="animated fadeInUpShorts">
                <!--Banner-->
                <div class="relative xv-slide" data-bg-possition="top"
                     style="background-image:url('${pageContext.request.contextPath}/${sessionScope.commentSong.singer.pic}');">
                    <div class="bottom-gradient "></div>
                </div>
                <!--@Banner-->
                <div class="row p-3">
                    <div class="col-lg-8 offset-lg-2 p-3">
                        <div class="my-5 d-lg-flex align-items-center">
                            <figure class="avatar avatar-md float-left mr-3 mt-1">
                                <img src="${pageContext.request.contextPath}/${sessionScope.commentSong.singer.pic}" alt="">
                            </figure>
                            <div>
                                <h6>${sessionScope.commentSong.singer.name}</h6>
                                ${sessionScope.commentSong.singer.englishName}
                            </div>
                            <div class="ml-auto pt-3 p-lg-0">
                                <a href="#" class="snackbar ml-3" data-text="Added to favourites"
                                   data-pos="top-right"
                                   data-showAction="true"
                                   data-actionText="ok"
                                   data-actionTextColor="#fff"
                                   data-backgroundColor="#0c101b"
                                ><i class="icon-bookmark s-24"></i>
                                </a>
                                <a href="#" class="snackbar ml-3" data-text="Added to favourites"
                                   data-pos="top-right"
                                   data-showAction="true"
                                   data-actionText="ok"
                                   data-actionTextColor="#fff"
                                   data-backgroundColor="#0c101b"
                                > <i class="icon-heart s-24"></i></a>
                                <a href="#" class="snackbar ml-3" data-text="Added to favourites"
                                   data-pos="top-right"
                                   data-showAction="true"
                                   data-actionText="ok"
                                   data-actionTextColor="#fff"
                                   data-backgroundColor="#0c101b"
                                > <i class="icon-share-1 s-24"></i></a>
                            </div>
                        </div>

                        <article>
                            <h1 class="font-weight-lighter">${sessionScope.commentSong.song.name} </h1>

                            <div class="cardx video-responsive">
                                播放次数：${sessionScope.commentSong.song.playCount}<br>
                                下载次数：${sessionScope.commentSong.song.downloadCount}<br>
                                收藏次数：${sessionScope.commentSong.song.collectionCount}<br>
<%--                                    <figure>--%>
<%--                                        <img src="assets/img/demo/b1.jpg" alt=""/>--%>
<%--                                    </figure>--%>
                                <div class="card-bodyz my-5">
<%--                                    歌词文本--%>
                                    <p>${sessionScope.commentSong.song.lyric}</p>
                                </div>
                            </div>
                        </article>


                        <div class="mt-1 mb-5">
                            <div>
                                <h3><i class="icon-list-1 s-24 text-primary mr-3"></i>${sessionScope.commentSong.commentMap.size()} 条评论</h3>
                                <c:if test="${sessionScope.commentSong.commentMap.size() == 0}">
                                    <div class="media my-5 ">
                                        <div class="avatar avatar-md mr-3 mt-1">
                                            <img src="assets/img/demo/u1.png" alt="user">
                                        </div>
                                        <div class="media-body">
                                            <h6 class="mt-0">未知</h6>
                                            该歌曲 还没有评论呢！快去抢占沙发吧！
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${sessionScope.commentSong.commentMap.size() != 0}">
                                    <c:forEach items="${sessionScope.commentSong.commentMap}" var="map" varStatus="s">
                                        <div class="media my-5 " id="comment_${map.value.id}">
                                            <div class="avatar avatar-md mr-3 mt-1">
                                                <img src="${pageContext.request.contextPath}/${map.key.avatar}" alt="user">
                                            </div>
                                            <div class="media-body">
                                                <h6 class="mt-0">${map.key.name}  /  ${map.value.createDate}</h6>
                                                    ${map.value.context}
                                                <a href="javascript:addUpCount(${map.value.id});" class="btn"><span class="info-color icon-like">${map.value.up}</span></a>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:if>

                                <hr>
                                <div class="post-comments my-5">
                                    <div>
                                        <form method="post" action="${pageContext.request.contextPath}/user/person/addCommentMusicServlet" class="form-material">
                                            <input type="hidden" name="songId" value="${sessionScope.commentSong.song.songId}">
                                            <input type="hidden" name="songName" value="${sessionScope.commentSong.song.name}">
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="form-group">
                                                        <div class="form-line">
                                                      <textarea rows="5" id="commentMsg" name="commentMsg" class="form-control r-0"
                                                                placeholder="评论信息"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row text-center">
                                                <div class="col-lg-12"><input type="submit" class="btn btn-primary r-0"
                                                                              value="发表评论"></div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </main><!--@Page Content-->
</div><!--@#app-->
<!--/#app -->
<script src="${pageContext.request.contextPath}/page/user/assets/js/app.js"></script>

<script type="text/javascript">
    function addUpCount(commentId) {
        window.location.href = "${pageContext.request.contextPath}/addCommentUpServlet?commentId=" + commentId + "&songId=${sessionScope.commentSong.song.songId}";
    }
</script>

</body>
</html>
