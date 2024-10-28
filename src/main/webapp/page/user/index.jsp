<%@ page import="java.util.Random" %>
<%@ include file="_pre.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: martin
  Date: 2020/11/16
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${pageContext.request.contextPath }/page/user/assets/img/basic/favicon.ico" type="image/x-icon">
    <title>音乐盒</title>
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/page/user/assets/css/app.css">
</head>
<%
    Random random = new Random();
    int randValue = random.nextInt(5);
    request.setAttribute("randValue", randValue);
%>
<body class="sidebar-mini sidebar-collapse theme-dark  sidebar-expanded-on-hover has-preloader" style="display: none;">

<!--</nav>-->
<!--页面内容-->
<main id="pageContent" class="page has-sidebar">
    <div class="container-fluid relative animatedParent animateOnce no-p">
        <div class="animated fadeInUpShort">
            <!--Banner Slider-->
            <section>
                <div class="text-white">
                    <div class="lightSlider"
                         data-item="1"
                         data-controls="true"
                         data-slide-margin="0"
                         data-gallery="false"
                         data-pause="8000"
                         data-pauseonhover="true"
                         data-auto="false"
                         data-pager="false"
                         data-loop="true">
                        <div class="xv-slide" data-bg-possition="top"
                             style="background-image:url('assets/img/demo/bg5.png');">
                            <div class="has-bottom-gradient">
                                <div class="p-md-5 p-3">
                                    <div class="row">
                                        <div class="col-12 col-lg-6 fadeInRight animated">
                                            <div class="xv-slider-content clearfix color-white">
                                                <h1 class="s-64 mt-5 font-weight-lighter">音乐盒</h1>
                                                <p class="s-14 font-weight-lighter">
                                                    <c:if test="${requestScope.randValue == 0}">
                                                        音乐带着难得的自信和微笑在旋律中绽放，<br>
                                                        伴着电子琴曲风，每一个音符都像生命在跳跃。<br>
                                                        音乐赋予了我们太多的心灵悸动。<br>
                                                        曾经的硝烟弥漫，过眼的春光烂漫，欢腾的青春畅想，<br>
                                                        都被它用干净的声线在清晨唤醒，快乐地行走在灿烂的阳光里。
                                                    </c:if>
                                                    <c:if test="${requestScope.randValue == 1}">
                                                        音乐，让我在悲伤时感到一丝快乐，让我在感动时潸然落泪。<br>
                                                        音乐让我知道，人世间的各种欢乐，各种辛酸，各种痛楚;<br>
                                                        音乐让我知道，只要有音乐，我就不会孤独，不会寂寞。<br>
                                                        音乐，为我的生命注入了无穷的动力。

                                                    </c:if>
                                                    <c:if test="${requestScope.randValue == 2}">
                                                        古典音乐，音乐的另一杰作，杰作，也许在人们看来，根本就是烂。<br>
                                                        我却不这么认为。 古典音乐的好处让我们了解历史。<br>
                                                        古典音乐表现的不但是一种音乐风格，<br>
                                                        从古典音乐的旋律歌词之中，我们可以领略到历史的发展，<br>
                                                        那么，我们学习历史不仅不会枯燥，还可以走进那悠久的历史，不是吗?
                                                    </c:if>
                                                    <c:if test="${requestScope.randValue == 3}">
                                                        如果试过在宁静的夜里沉思，倾听这个世界在转了一天之后究竟想说些什么，<br>
                                                        那么你该会同意，其实真正的寂静，并非是全然无声的。<br>
                                                        夜晚的寂静，是由一种如泡沫般细腻、如薄纱般绵密的声响所编织成的。<br>
                                                        它随着空气存在，无色无味，比醇酒更迷人，比鲜花更芳香。
                                                    </c:if>
                                                    <c:if test="${requestScope.randValue == 4}">
                                                        歌词是音乐必不可少的，歌词也是音乐的前锋， 它的文字表现突出了一首音乐的主题，<br>
                                                        就像世上只有妈妈好这首歌，歌词表现了母亲对儿子的养育之心，儿子对母亲的报答。<br>
                                                        歌词是吸引我们的一大亮点。<br>
                                                        歌词启发了我，有些歌词讲述人生哲理，使我心潮起伏，让我的人生修养受到了熏陶。
                                                    </c:if>
                                                    <c:if test="${requestScope.randValue == 5}">
                                                        卡农的魅力在于百听不厌，让人心情舒畅，而且还可以缓解压力。<br>
                                                        无论心情好，心情不好，都可以听卡农，无论何时，它都能让人平静!<br>

                                                    </c:if>
                                                    <c:if test="${requestScope.randValue == 6}">
                                                        音乐让我有很了大的收获。<br>
                                                        喝—杯白开水，听着唐磊的丁香花，<br>
                                                        那优美的旋律，将我陶醉，<br>
                                                        那不快不慢的歌词，既潮流又有些琅琅上口。
                                                    </c:if>
                                                    <c:if test="${requestScope.randValue == 7}">
                                                        尘缘中琴声，月皎波澄。<br>
                                                        人们神怡心旷之际，耳边一阵微风忽起伏。<br>
                                                        远远传来缕缕琴声，悠悠扬扬，一种情韵却令人回肠荡气。<br>
                                                        虽琴声如诉，所有最静好的时光，最灿烂的风霜，而或最初的模样，都缓缓流淌起来。<br>
                                                        而琴声如诉，是在过尽千帆之后，看岁月把心迹澄清，<br>
                                                        是在身隔沧海之时，沉淀所有的波澜壮阔。<br>
                                                        在懂得之后，每一个音符下，都埋藏—颗平静而柔韧的心灵。<br>
                                                    </c:if>
                                                    <c:if test="${requestScope.randValue == 8}">
                                                        音乐无处不在，白鲸在危难中听到了音乐，才冲破了北极的冰层;<br>
                                                        奶牛在音乐的感染下，才产出更多的奶;<br>
                                                        小草在音乐的陶冶下会显得更加嫩绿;<br>
                                                        就连病危的病人听到音乐也会感到好了许多。<br>
                                                        假如没有音乐就没有眼前的这些景象。
                                                    </c:if>
                                                    <c:if test="${requestScope.randValue == 9}">
                                                        请不必感到惊异，因为这就是音乐的魅力。<br>
                                                        听吧，当一首流行音乐在你耳中跳动时，<br>
                                                        音乐已化作一个个精灵激动着你身上的每一个细胞!<br>
                                                        感觉到了吗? 血液正在燃烧;<br>
                                                        听到了吗? 心跳正在加剧。<br>
                                                        当你发觉自己不知不觉间跟着音乐节拍翩翩起舞时，<br>
                                                        请不要感到惊奇，因为这就是音乐的魅力。<br>
                                                    </c:if>
                                                </p>
                                                <div class="pt-3">
                                                    <a href="javascript: toPlayerList();" class="btn btn-primary btn-lg">打开音乐的大门</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="bottom-gradient"></div>
                        </div>
                    </div>
                </div>
                <!--slider Wrap-->
            </section>
            <!--@Banner Slider-->
            <div class="p-md-5 p-3  ">
                <!--New Releases-->
                <section class="section">
                    <div class="d-flex relative align-items-center justify-content-between">
                        <div class="mb-4">
                            <h4>新发行音乐</h4>
                            <p>欣赏一些很棒的新音乐吧！</p>
                        </div>
                        <a href="${pageContext.request.contextPath}/getAllSingerServlet">查看专辑<i class="icon-angle-right ml-3"></i></a>
                    </div>
                    <div class="lightSlider has-items-overlay playlist"
                         data-item="6"
                         data-item-lg="3"
                         data-item-md="3"
                         data-item-sm="2"
                         data-auto="false"
                         data-pager="false"
                         data-controls="true"
                         data-loop="false">

                        <c:forEach items="${sessionScope.singerSongMap}" var="map" varStatus="s">
                            <div>
                                <figure>
                                    <div class="img-wrapper">
                                        <img src="${pageContext.request.contextPath}/${map.key.pic}" alt="/">
                                        <div class="img-overlay text-white">
                                            <div class="figcaption">
                                                <ul class="list-inline d-flex align-items-center justify-content-between">
                                                    <li class="list-inline-item">
                                                        <a href="#" class="snackbar" data-text="Added to favourites"
                                                           data-pos="top-right"
                                                           data-showAction="true"
                                                           data-actionText="ok"
                                                           data-actionTextColor="#fff"
                                                           data-backgroundColor="#0c101b">
                                                            <i class="icon-heart-o s-18"></i>
                                                        </a>
                                                    </li>
                                                    <li class="list-inline-item ">
                                                        <a class="no-ajaxy media-url" href="${pageContext.request.contextPath}/${map.value.url}" data-wave="assets/media/track2.json">
                                                            <i class="icon-play s-48"  onclick="addPlayCount(${map.value.songId})"></i>
                                                        </a>
                                                    </li>
                                                    <li class="list-inline-item">
                                                        <a href="${pageContext.request.contextPath}/commentMusicServlet?songId=${map.value.songId}"><i
                                                                class="icon-more s-18 pt-3"></i></a></li>
                                                </ul>
                                                <div class="text-center mt-5">
                                                    <%-- 歌曲名 --%>
                                                    <h5>${map.value.name}</h5>
                                                    <%-- 歌手名 --%>
                                                    <span>${map.key.name}</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="figure-title text-center p-2">
                                                <%-- 歌曲名 --%>
                                            <h5>${map.value.name}</h5>
                                                <%-- 歌手名 --%>
                                            <span>${map.key.name}</span>
                                        </div>
                                    </div>
                                </figure>
                            </div>
                        </c:forEach>
                    </div>
                </section>
                <!--@New Releases-->

                <!--Latest Posts-->
                <section class="section">
                    <div class="d-flex relative">
                        <div class="mb-4">
                            <h4>最新帖子</h4>
                            <p>在我们的歌曲评论中查看最新评论内容，快速了解这首歌如何</p>
                        </div>
                    </div>
                    <div class="lightSlider has-items-overlay"
                         data-item="3"
                         data-item-lg="2"
                         data-item-md="1"
                         data-item-sm="1"
                         data-auto="false"
                         data-pager="false"
                         data-controls="true"
                         data-loop="false">
                        <c:forEach items="${sessionScope.comments}" var="comment" varStatus="s">
                            <div class="card">
                                <figure class="card-img figure">
                                    <div class="img-wrapper">
                                        <img src="${pageContext.request.contextPath}/page/user/assets/img/demo/v<%=new Random().nextInt(11) + 1%>.jpg" alt="Card image">
                                    </div>
                                    <div class="img-overlay"></div>
                                    <div class="has-bottom-gradient">
                                        <div class="d-flex">
                                            <div class="card-img-overlay">
                                                <div class="pt-3 pb-3">
                                                    <a href="${pageContext.request.contextPath}/commentMusicServlet?songId=${comment.songId}">
                                                        <figure class="float-left mr-3 mt-1">
                                                            <i class="icon-play s-36"></i>
                                                        </figure>
                                                        <div>
                                                            <h5>
                                                                    ${comment.songName}
                                                            </h5>
                                                            <small>最新评论：${comment.context.substring(0, comment.context.length() >= 10 ? 10 : map.value.context.length())}...</small>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </figure>
                                <div class="bottom-gradient bottom-gradient-thumbnail"></div>
                            </div>
                        </c:forEach>
                    </div>
                </section>
                <!--@New Releases-->

                <!--PlayList & Events-->
                <section id="songRankList" class="section mt-4">
                    <div class="row row-eq-height">
                        <div class="col-lg-8">
                            <div class="card no-b mb-md-3 p-2">
                                <div class="card-header no-bg transparent">
                                    <div class="d-flex justify-content-between">
                                        <div class="align-self-center">
                                            <div class="d-flex">
                                                <!--<i class="icon-music s-36 mr-3  mt-2"></i>-->
                                                <div>
                                                    <h4>本周最受欢迎</h4>
                                                    <p>音乐是我疗伤最好的药，没有谁能陪我走过悲伤的海。</p>
                                                    <div class="mt-3">
                                                        <ul class="nav nav-tabs card-header-tabs nav-material responsive-tab mb-1"
                                                            role="tablist">
                                                            <c:forEach items="${sessionScope.typeRankList}" var="type" varStatus="s">
                                                                <li class="nav-item">
                                                                    <a  id="w${s.count}--tab${s.count}"
                                                                       data-toggle="tab"
                                                                       href="#w${s.count}-tab${s.count}"
                                                                       role="tab"
                                                                       <c:if test="${s.count == 1}">
                                                                           class="nav-link active show"
                                                                           aria-selected="true"
                                                                       </c:if>
                                                                       <c:if test="${s.count != 1}">
                                                                           class="nav-link"
                                                                           aria-selected="false"
                                                                       </c:if>
                                                                    >${type.name}</a>
                                                                </li>
                                                            </c:forEach>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body no-p">
                                    <div class="tab-content" id="v-pills-tabContent1">
                                        <c:forEach items="${sessionScope.songRankList}" var="songList" varStatus="status">
                                            <div id="w${status.count}-tab${status.count}" role="tabpanel"
                                                <c:if test="${status.count == 1}">
                                                    class="tab-pane fade show active"
                                                </c:if>
                                                <c:if test="${status.count != 1}">
                                                    class="tab-pane fade"
                                                </c:if>
                                                 aria-labelledby="w${status.count}-tab${status.count}">

                                                <c:if test="${status.count % 2 != 0}">
                                                    <div class="playlist pl-lg-3 pr-lg-3">
                                                        <c:forEach items="${songList}" var="songMap" varStatus="s">
                                                            <div class="m-1 my-4">
                                                                <div class="d-flex align-items-center">
                                                                    <div class="col-1">
                                                                        <a class="no-ajaxy media-url"
                                                                           href="${pageContext.request.contextPath}/${songMap.value.url}"
                                                                           data-wave="assets/media/track3.json">
                                                                            <i class="icon-play s-28" onclick="addPlayCount(${songMap.value.songId})"></i>
                                                                        </a>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <figure class="avatar-md float-left  mr-3 mt-1">
                                                                            <img class="r-3" src="${pageContext.request.contextPath}/${songMap.key.pic}" alt="">
                                                                        </figure>
                                                                        <h6>${songMap.value.name}</h6>${songMap.key.name}
                                                                    </div>
                                                                    <div class="col-md-5 d-none d-lg-block">
                                                                        <div class="d-flex">
                                                                    <span class="ml-auto">
                                                                        <fmt:formatNumber value="${(songMap.value.time - songMap.value.time % 60) / 60}" type="number" pattern="#" maxFractionDigits="0"/>:
                                                                        <fmt:formatNumber value="${songMap.value.time % 60}"/>
                                                                    </span>
                                                                            <a href="${pageContext.request.contextPath}/addMusicToPlayListServlet?page=${pageContext.request.servletPath}&songId=${songMap.value.songId}" class="ml-auto"><i class="icon-add-1"></i></a>
                                                                            <div class="ml-auto">
                                                                                <a href="javascript:download(${songMap.value.songId})" class="btn btn-outline-primary btn-sm">下载</a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-1 ml-auto d-lg-none">
                                                                        <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >
                                                                            <i class="icon-more-1"></i></a>
                                                                        <div class="dropdown-menu dropdown-menu-right">
                                                                            <a  class="dropdown-item" href="#"><i class="icon-share-1 mr-3"></i> Share</a>
                                                                            <a  class="dropdown-item" href="#"><i class="icon-shopping-bag mr-3"></i>Buy at iTunes</a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </c:if>

                                                <c:if test="${status.count % 2 == 0}">
                                                    <div class="card-body has-items-overlay playlist p-5">
                                                        <div class="row">
                                                            <c:forEach items="${songList}" var="songMap" varStatus="s">
                                                                <div class="col-md-3 mb-3">
                                                                    <figure class="mb-2">
                                                                        <div class="img-wrapper r-10">
                                                                            <img class=" r-10" src="${pageContext.request.contextPath}/${songMap.key.pic}"
                                                                                 alt="/">
                                                                            <div class="img-overlay text-white p-5">
                                                                                <div class="center-center">
                                                                                    <a class="no-ajaxy media-url"
                                                                                       href="${pageContext.request.contextPath}/${songMap.value.url}"
                                                                                       data-wave="assets/media/track3.json">
                                                                                        <i class="icon-play s-48" onclick="addPlayCount(${songMap.value.songId})"></i>
                                                                                    </a>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </figure>
                                                                    <div class="figure-title">
                                                                        <h6>${songMap.value.name}</h6>
                                                                        <small>${songMap.key.name}</small>
                                                                    </div>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </c:if>

                                            </div>
                                        </c:forEach>

                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="mb-3 card p-3">
                                <div>
                                    <div class="mr-3 float-left text-center">
                                        <div class="s-36">09</div>
                                        <span>July</span>
                                    </div>
                                    <div>
                                        <div>
                                            <a href="events-single.html">
                                                <h4 class="text-primary">New York park live</h4>
                                            </a>
                                        </div>
                                        <small> 33 Cliveden Close, Melbourne VIC 3000, Australia</small>
                                        <div class="mt-2">
                                            <i class="icon-clock-o mr-1"> </i> 7:00 PM - 11:00 PM
                                        </div>
                                    </div>

                                </div>

                                <small class="my-3">Artist Performing</small>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="avatar-group">
                                        <figure class="avatar no-shadow">
                                            <img src="assets/img/demo/u4.jpg" alt=""></figure>
                                        <figure class="avatar no-shadow">
                                            <img src="assets/img/demo/u5.jpg" alt=""></figure>
                                        <figure class="avatar no-shadow">
                                            <img src="assets/img/demo/u6.jpg" alt=""></figure>
                                    </div>
                                    <div>
                                        <a href="events-single.html">Buy Tickets</a>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3 card p-3">
                                <div>
                                    <div class="mr-3 float-left text-center">
                                        <div class="s-36">09</div>
                                        <span>March</span>
                                    </div>
                                    <div>
                                        <div>
                                            <a href="events-single.html">
                                                <h4 class="text-primary">Linkin park live</h4>
                                            </a>
                                        </div>
                                        <small> 33 Cliveden Close, Melbourne VIC 3000, Australia</small>
                                        <div class="mt-2">
                                            <i class="icon-clock-o mr-1"> </i> 7:00 PM - 11:00 PM
                                        </div>
                                    </div>
                                </div>

                                <small class="my-3">Artist Performing</small>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div class="avatar-group">
                                        <figure class="avatar no-shadow">
                                            <img src="assets/img/demo/u4.jpg" alt=""></figure>
                                        <figure class="avatar no-shadow">
                                            <img src="assets/img/demo/u5.jpg" alt=""></figure>
                                        <figure class="avatar no-shadow">
                                            <img src="assets/img/demo/u6.jpg" alt=""></figure>
                                    </div>
                                    <div>
                                        <a href="events-single.html">Buy Tickets</a>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3 card">
                                <figure class="card-img figure">
                                    <div class="img-wrapper">
                                        <img class="r-3" src="assets/img/demo/v11.jpg" alt="Card image">
                                    </div>
                                    <div class="img-overlay text-white">
                                        <div class="figcaption">
                                        </div>
                                    </div>
                                    <div class="has-bottom-gradient">
                                        <div class="d-flex">
                                            <div class="card-img-overlay">
                                                <div>
                                                    <div class="mr-3 float-left text-center">
                                                        <div class="s-36">24</div>
                                                        <span>July</span>
                                                    </div>
                                                    <div>
                                                        <div>
                                                            <a href="events-single.html">
                                                                <h4 class="text-primary">Linkin park live</h4>
                                                            </a>
                                                        </div>
                                                        <small> 33 Cliveden Close, Melbourne VIC 3000, Australia</small>
                                                        <div class="mt-2">
                                                            <i class="icon-clock-o mr-1"> </i> 7:00 PM - 11:00 PM
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </figure>
                                <div class="bottom-gradient"></div>
                            </div>
                        </div>
                    </div>
                </section>
                <!--@PlayLIst & Events-->

                <!--Recommend-->
                <section class="section">
                    <div class="d-flex relative align-items-center justify-content-between">
                        <div class="mb-4">
                            <h4>Recommended For You</h4>
                            <p>Enjoy some new awesome music</p>
                        </div>
                        <a href="albums.html">View Albums<i class="icon-angle-right ml-3"></i></a>
                    </div>
                    <div class="lightSlider has-items-overlay playlist"
                         data-item="6"
                         data-item-lg="3"
                         data-item-md="3"
                         data-item-sm="2"
                         data-auto="false"
                         data-pager="false"
                         data-controls="true"
                         data-loop="false">
                        <div>
                            <figure>
                                <div class="img-wrapper">
                                    <img src="assets/img/demo/a1.jpg" alt="/">
                                    <div class="img-overlay text-white">
                                        <div class="figcaption">
                                            <ul class="list-inline d-flex align-items-center justify-content-between">
                                                <li class="list-inline-item">
                                                    <a href="#" class="snackbar" data-text="Added to favourites"
                                                       data-pos="top-right"
                                                       data-showAction="true"
                                                       data-actionText="ok"
                                                       data-actionTextColor="#fff"
                                                       data-backgroundColor="#0c101b">
                                                        <i class="icon-heart-o s-18"></i>
                                                    </a></li>
                                                <li class="list-inline-item ">
                                                    <a class="no-ajaxy media-url" href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                        <i class="icon-play s-48"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="album-single.html"><i
                                                            class="icon-more s-18 pt-3"></i></a></li>
                                            </ul>
                                            <div class="text-center mt-5">
                                                <h5>To Phir Ao</h5>
                                                <span>Joe Doe</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="figure-title text-center p-2">
                                        <h5>To Phir Ao</h5>
                                        <span>Joe Doe</span>
                                    </div>
                                </div>
                            </figure>
                        </div>
                        <div>
                            <figure>
                                <div class="img-wrapper">
                                    <img src="assets/img/demo/a2.jpg" alt="/">
                                    <div class="img-overlay text-white">
                                        <div class="figcaption">
                                            <ul class="list-inline d-flex align-items-center justify-content-between">
                                                <li class="list-inline-item">
                                                    <a href="#" class="snackbar" data-text="Added to favourites"
                                                       data-pos="top-right"
                                                       data-showAction="true"
                                                       data-actionText="ok"
                                                       data-actionTextColor="#fff"
                                                       data-backgroundColor="#0c101b">
                                                        <i class="icon-heart-o s-18"></i>
                                                    </a></li>
                                                <li class="list-inline-item ">
                                                    <a class="no-ajaxy media-url" href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                        <i class="icon-play s-48"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="album-single.html"><i
                                                            class="icon-more s-18 pt-3"></i></a></li>
                                            </ul>
                                            <div class="text-center mt-5">
                                                <h5>To Phir Ao</h5>
                                                <span>Joe Doe</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="figure-title text-center p-2">
                                        <h5>To Phir Ao</h5>
                                        <span>Joe Doe</span>
                                    </div>
                                </div>
                            </figure>
                        </div>
                        <div>
                            <figure>
                                <div class="img-wrapper">
                                    <img src="assets/img/demo/a3.jpg" alt="/">
                                    <div class="img-overlay text-white">
                                        <div class="figcaption">
                                            <ul class="list-inline d-flex align-items-center justify-content-between">
                                                <li class="list-inline-item">
                                                    <a href="#" class="snackbar" data-text="Added to favourites"
                                                       data-pos="top-right"
                                                       data-showAction="true"
                                                       data-actionText="ok"
                                                       data-actionTextColor="#fff"
                                                       data-backgroundColor="#0c101b">
                                                        <i class="icon-heart-o s-18"></i>
                                                    </a></li>
                                                <li class="list-inline-item ">
                                                    <a class="no-ajaxy media-url" href="assets/media/track1.mp3" data-wave="assets/media/track1.json">
                                                        <i class="icon-play s-48"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="album-single.html"><i
                                                            class="icon-more s-18 pt-3"></i></a></li>
                                            </ul>
                                            <div class="text-center mt-5">
                                                <h5>To Phir Ao</h5>
                                                <span>Joe Doe</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="figure-title text-center p-2">
                                        <h5>To Phir Ao</h5>
                                        <span>Joe Doe</span>
                                    </div>
                                </div>
                            </figure>
                        </div>
                        <div>
                            <figure>
                                <div class="img-wrapper">
                                    <img src="assets/img/demo/a4.jpg" alt="/">
                                    <div class="img-overlay text-white">
                                        <div class="figcaption">
                                            <ul class="list-inline d-flex align-items-center justify-content-between">
                                                <li class="list-inline-item">
                                                    <a href="#" class="snackbar" data-text="Added to favourites"
                                                       data-pos="top-right"
                                                       data-showAction="true"
                                                       data-actionText="ok"
                                                       data-actionTextColor="#fff"
                                                       data-backgroundColor="#0c101b">
                                                        <i class="icon-heart-o s-18"></i>
                                                    </a></li>
                                                <li class="list-inline-item ">
                                                    <a class="no-ajaxy media-url" href="assets/media/track3.mp3" data-wave="assets/media/track3.json">
                                                        <i class="icon-play s-48"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="album-single.html"><i
                                                            class="icon-more s-18 pt-3"></i></a></li>
                                            </ul>
                                            <div class="text-center mt-5">
                                                <h5>To Phir Ao</h5>
                                                <span>Joe Doe</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="figure-title text-center p-2">
                                        <h5>To Phir Ao</h5>
                                        <span>Joe Doe</span>
                                    </div>
                                </div>
                            </figure>
                        </div>
                        <div>
                            <figure>
                                <div class="img-wrapper">
                                    <img src="assets/img/demo/a5.jpg" alt="/">
                                    <div class="img-overlay text-white">
                                        <div class="figcaption">
                                            <ul class="list-inline d-flex align-items-center justify-content-between">
                                                <li class="list-inline-item">
                                                    <a href="#" class="snackbar" data-text="Added to favourites"
                                                       data-pos="top-right"
                                                       data-showAction="true"
                                                       data-actionText="ok"
                                                       data-actionTextColor="#fff"
                                                       data-backgroundColor="#0c101b">
                                                        <i class="icon-heart-o s-18"></i>
                                                    </a></li>
                                                <li class="list-inline-item ">
                                                    <a class="no-ajaxy media-url" href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                        <i class="icon-play s-48"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="album-single.html"><i
                                                            class="icon-more s-18 pt-3"></i></a></li>
                                            </ul>
                                            <div class="text-center mt-5">
                                                <h5>To Phir Ao</h5>
                                                <span>Joe Doe</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="figure-title text-center p-2">
                                        <h5>To Phir Ao</h5>
                                        <span>Joe Doe</span>
                                    </div>
                                </div>
                            </figure>
                        </div>
                        <div>
                            <figure>
                                <div class="img-wrapper">
                                    <img src="assets/img/demo/a6.jpg" alt="/">
                                    <div class="img-overlay text-white">
                                        <div class="figcaption">
                                            <ul class="list-inline d-flex align-items-center justify-content-between">
                                                <li class="list-inline-item">
                                                    <a href="#" class="snackbar" data-text="Added to favourites"
                                                       data-pos="top-right"
                                                       data-showAction="true"
                                                       data-actionText="ok"
                                                       data-actionTextColor="#fff"
                                                       data-backgroundColor="#0c101b">
                                                        <i class="icon-heart-o s-18"></i>
                                                    </a></li>
                                                <li class="list-inline-item ">
                                                    <a class="no-ajaxy media-url" href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                        <i class="icon-play s-48"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="album-single.html"><i
                                                            class="icon-more s-18 pt-3"></i></a></li>
                                            </ul>
                                            <div class="text-center mt-5">
                                                <h5>To Phir Ao</h5>
                                                <span>Joe Doe</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="figure-title text-center p-2">
                                        <h5>To Phir Ao</h5>
                                        <span>Joe Doe</span>
                                    </div>
                                </div>
                            </figure>
                        </div>
                        <div>
                            <figure>
                                <div class="img-wrapper">
                                    <img src="assets/img/demo/a7.jpg" alt="/">
                                    <div class="img-overlay text-white">
                                        <div class="figcaption">
                                            <ul class="list-inline d-flex align-items-center justify-content-between">
                                                <li class="list-inline-item">
                                                    <a href="#" class="snackbar" data-text="Added to favourites"
                                                       data-pos="top-right"
                                                       data-showAction="true"
                                                       data-actionText="ok"
                                                       data-actionTextColor="#fff"
                                                       data-backgroundColor="#0c101b">
                                                        <i class="icon-heart-o s-18"></i>
                                                    </a></li>
                                                <li class="list-inline-item ">
                                                    <a class="no-ajaxy media-url" href="assets/media/track2.mp3" data-wave="assets/media/track2.json">
                                                        <i class="icon-play s-48"></i>
                                                    </a>
                                                </li>
                                                <li class="list-inline-item">
                                                    <a href="album-single.html"><i
                                                            class="icon-more s-18 pt-3"></i></a></li>
                                            </ul>
                                            <div class="text-center mt-5">
                                                <h5>To Phir Ao</h5>
                                                <span>Joe Doe</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="figure-title text-center p-2">
                                        <h5>To Phir Ao</h5>
                                        <span>Joe Doe</span>
                                    </div>
                                </div>
                            </figure>
                        </div>

                    </div>
                </section>
                <!--@Recommend-->

            </div>
        </div>
    </div>
</main><!--@Page Content-->
<!--</div>&lt;!&ndash;@#app&ndash;&gt;-->
<!--/#app -->
<script src="${pageContext.request.contextPath }/page/user/assets/js/app.js"></script>
<script type="text/javascript">
    function download(songId) {
        window.location.href = "${pageContext.request.contextPath}/user/person/downLoadServlet?songId=" + songId;
    }

    function toPlayList() {
        $("#songRankList").scrollIntoView();
    }
</script>

</body>
</html>
