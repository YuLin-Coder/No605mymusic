<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="_pre.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: martin
  Date: 2020/11/19
  Time: 16:44
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
    <title>搜索结果</title>
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/user/assets/css/app.css">
</head>

<body class="sidebar-mini sidebar-collapse theme-dark  sidebar-expanded-on-hover has-preloader" style="display: none;">

<div id="app">

    <!--Page Content-->
    <main id="pageContent" class="page has-sidebar">
        <div class="container-fluid relative animatedParent animateOnce">
            <div class="animated fadeInUpShort p-md-5 p-3">
                <div class="relative mb-5">
                    <h1 class="mb-2 text-primary">搜索结果</h1>
                </div>
                <div class="row my-3">
                    <div class="col-12 col-xl-6">
                        <div class="card no-b">
                            <div class="card-header pb-0">
                                <div class="d-flex justify-content-between">
                                    <div class="align-self-center">
                                        <ul class="nav nav-pills mb-3" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active show r-20" id="w3--tab1" data-toggle="tab"
                                                   href="#w3-tab1" role="tab" aria-controls="tab1" aria-expanded="true"
                                                   aria-selected="true">歌手</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="align-self-center">
                                        <h5>歌手搜索结果</h5>
                                    </div>

                                </div>
                            </div>
                            <div class="card-body no-p">
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="w3-tab1" role="tabpanel"
                                         aria-labelledby="w3-tab1">
                                        <div class="table-responsive">
                                            <table class="table table-hover earning-box">

                                                <tbody>
                                                    <c:if test="${sessionScope.searchInfo.map == null || sessionScope.searchInfo.map.size() == 0}">
                                                        <tr class="no-b">
                                                            <td class="w-10"><span class="round">
                                                                <img src="assets/img/demo/u1.png" alt="singer"></span>
                                                            </td>
                                                            <td>
                                                                <h6><a href="#">未搜索到结果</a></h6>
                                                                <small class="text-muted">未找到</small>
                                                            </td>
                                                            <td>地区</td>
                                                            <td>热度</td>
                                                        </tr>
                                                    </c:if>
                                                    <c:if test="${sessionScope.searchInfo.map != null && sessionScope.searchInfo.map.size() != 0}">
                                                        <c:forEach items="${sessionScope.searchInfo.map}" var="map" varStatus="s">
                                                            <tr class="no-b">
                                                                <td class="w-10"><span class="round">
                                                                    <img src="${pageContext.request.contextPath}/${map.key.pic}" alt="singer"></span>
                                                                </td>
                                                                <td>
                                                                    <h6><a href="${pageContext.request.contextPath}/albumSingleServlet?singerName=${map.key.name}">${map.key.name}</a></h6>
                                                                    <small class="text-muted">${map.value} musics</small>
                                                                </td>
                                                                <td>${map.key.location}</td>
                                                                <td>热度：${map.key.accessCount}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-xl-6">
                        <div class="card no-b">
                            <div class="card-header pb-0">
                                <div class="d-flex justify-content-between">
                                    <div class="align-self-center">
                                        <h5>歌曲搜索信息</h5>
                                    </div>
                                    <div class="align-self-center">
                                        <ul class="nav nav-pills mb-3" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active show" id="w4--tab1" data-toggle="tab" href="#w4-tab1"
                                                   role="tab" aria-controls="tab1" aria-expanded="true" aria-selected="true">歌曲</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body no-p">
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="w4-tab1" role="tabpanel"
                                         aria-labelledby="w4-tab1">
                                        <div class="table-responsive">
                                            <table class="table table-hover earning-box">
                                                <tbody>
                                                    <c:if test="${sessionScope.searchInfo.list == null || sessionScope.searchInfo.list.size() == 0}">
                                                        <tr class="no-b">
                                                            <td class="w-10"><span class="round">
                                                                0
<%--                                                                <img src="assets/img/demo/u1.png" alt="user">--%>
                                                            </span>
                                                            </td>
                                                            <td>
                                                                <h6>未搜索到结果</h6>
                                                                <small class="text-muted">未找到</small>
                                                            </td>
                                                            <td>类型</td>
                                                            <td>时间</td>
                                                        </tr>
                                                    </c:if>
                                                    <c:if test="${sessionScope.searchInfo.list != null && sessionScope.searchInfo.list.size() != 0}">
                                                        <c:forEach items="${sessionScope.searchInfo.list}" var="song" varStatus="s">
                                                            <tr class="no-b">
                                                                <td class="w-10"><span class="round">
                                                                    ${s.count}
                                                                </span>
                                                                </td>
                                                                <td>
                                                                    <h6><a href="${pageContext.request.contextPath}/commentMusicServlet?songId=${song.songId}">${song.name}</a></h6>
                                                                    <small class="text-muted">
                                                                        ${song.singerName}   ---   time :
                                                                        <fmt:formatNumber value="${(song.time - song.time % 60) / 60}" type="number" pattern="#" maxFractionDigits="0"/>:
                                                                        <fmt:formatNumber value="${song.time % 60}"/>
                                                                    </small>
                                                                </td>
                                                                <td>${song.type}</td>
                                                                <td>
                                                                    <div class="text-lg-center  bg-primary r-10 p-2 text-white primary-bg">
                                                                        <div class="s-18">${song.publicDate.substring(8, 11)}</div>
                                                                        <small>${song.publicDate.substring(5, 7)}, ${song.publicDate.substring(0, 4)}</small>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:if>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>


                <%--<div class="row my-3">
                    <div class="col-12 col-xl-6">
                        <div class="card no-b">
                            <div class="card-header bg-primary">
                                <h4>Title</h4>
                                <div class="row justify-content-end">
                                    <div class="col">
                                        <ul id="myTab4" role="tablist"
                                            class="nav nav-tabs card-header-tabs nav-material nav-material-white float-right">
                                            <li class="nav-item">
                                                <a class="nav-link active show" id="tab1" data-toggle="tab" href="#v-pills-tab1"
                                                   role="tab" aria-controls="tab1" aria-expanded="true" aria-selected="true">Tab
                                                    1</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="tab2" data-toggle="tab" href="#v-pills-tab2" role="tab"
                                                   aria-controls="tab2" aria-selected="false">Tab 2</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="tab3" data-toggle="tab" href="#v-pills-tab3" role="tab"
                                                   aria-controls="tab3" aria-selected="false">Tab 3</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body no-p">
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="v-pills-tab1" role="tabpanel"
                                         aria-labelledby="v-pills-tab1">
                                        <div class="table-responsive">
                                            <table class="table table-hover earning-box">
                                                <thead class="no-b">
                                                <tr>
                                                    <th colspan="2">Client Name</th>
                                                    <th>Item Purchased</th>
                                                    <th>Price</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u1.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u2.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u3.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u4.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u5.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade text-center p-5" id="v-pills-tab2" role="tabpanel"
                                         aria-labelledby="v-pills-tab2">
                                        <h4 class="card-title">Tab 2</h4>
                                        <p class="card-text">With supporting text below as a natural lead-in to additional
                                            content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                    <div class="tab-pane fade text-center p-5" id="v-pills-tab3" role="tabpanel"
                                         aria-labelledby="v-pills-tab3">
                                        <h4 class="card-title">Tab 3</h4>
                                        <p class="card-text">With supporting text below as a natural lead-in to additional
                                            content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-xl-6">
                        <div class="card no-b">
                            <div class="card-header">
                                <div class="d-flex justify-content-between">
                                    <div class="align-self-center">
                                        <strong>Awesome Title</strong>
                                    </div>
                                    <div class="align-self-end float-right">
                                        <ul class="nav nav-tabs card-header-tabs nav-material" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active show" id="w2--tab1" data-toggle="tab" href="#w2-tab1"
                                                   role="tab" aria-controls="tab1" aria-expanded="true" aria-selected="true">Tab
                                                    1</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="w2--tab2" data-toggle="tab" href="#w2-tab2" role="tab"
                                                   aria-controls="tab2" aria-selected="false">Tab 2</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="w2--tab3" data-toggle="tab" href="#w2-tab3" role="tab"
                                                   aria-controls="tab3" aria-selected="false">Tab 3</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body no-p">
                                <div class="tab-content" id="v-pills-tabContent1">
                                    <div class="tab-pane fade show active" id="w2-tab1" role="tabpanel"
                                         aria-labelledby="w2-tab1">
                                        <div class="table-responsive">
                                            <table class="table table-hover earning-box">

                                                <tbody>
                                                <tr class="no-b">
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u1.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u2.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u3.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u4.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u5.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u6.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade text-center p-5" id="w2-tab2" role="tabpanel"
                                         aria-labelledby="w2-tab2">
                                        <h4 class="card-title">Tab 2</h4>
                                        <p class="card-text">With supporting text below as a natural lead-in to additional
                                            content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                    <div class="tab-pane fade text-center p-5" id="w2-tab3" role="tabpanel"
                                         aria-labelledby="w2-tab3">
                                        <h4 class="card-title">Tab 3</h4>
                                        <p class="card-text">With supporting text below as a natural lead-in to additional
                                            content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>--%>
                <%--
                <div class="row my-3">
                    <div class="col-12 col-xl-6">
                        <div class="card no-b">
                            <div class="card-header">
                                <div class="d-flex justify-content-between">
                                    <div class="align-self-center">
                                        <strong>Awesome Title</strong>
                                    </div>
                                    <div class="align-self-end float-right">
                                        <ul class="nav nav-tabs card-header-tabs" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active show" id="w5--tab1" data-toggle="tab" href="#w5-tab1"
                                                   role="tab" aria-controls="tab1" aria-expanded="true" aria-selected="true">Tab
                                                    1</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="w5--tab2" data-toggle="tab" href="#w5-tab2" role="tab"
                                                   aria-controls="tab2" aria-selected="false">Tab 2</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="w5--tab3" data-toggle="tab" href="#w5-tab3" role="tab"
                                                   aria-controls="tab3" aria-selected="false">Tab 3</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body no-p">
                                <div class="tab-content">
                                    <div class="tab-pane fade active show" id="w5-tab1" role="tabpanel"
                                         aria-labelledby="w5-tab1">
                                        <div class="table-responsive">
                                            <table class="table table-hover earning-box">

                                                <tbody>
                                                <tr class="no-b">
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u1.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u2.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u3.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u4.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u5.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u6.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade text-center p-5" id="w5-tab2" role="tabpanel"
                                         aria-labelledby="w5-tab2">
                                        <h4 class="card-title">Tab 2</h4>
                                        <p class="card-text">With supporting text below as a natural lead-in to additional
                                            content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                    <div class="tab-pane fade text-center p-5" id="w5-tab3" role="tabpanel"
                                         aria-labelledby="w5-tab3">
                                        <h4 class="card-title">Tab 3</h4>
                                        <p class="card-text">With supporting text below as a natural lead-in to additional
                                            content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-xl-6">
                        <div class="card no-b">
                            <div class="card-header indigo darken-1 text-white">
                                <h4><i class="icon-message mr-2 mb-5"></i>Awesome Title</h4>
                                <div class="d-flex justify-content-between">
                                    <div class="align-self-end">
                                        <ul class="nav nav-material nav-material-white card-header-tabs" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active show" id="w6--tab1" data-toggle="tab" href="#w6-tab1"
                                                   role="tab" aria-controls="tab1" aria-expanded="true" aria-selected="true">Tab
                                                    1</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="w6--tab2" data-toggle="tab" href="#w6-tab2" role="tab"
                                                   aria-controls="tab2" aria-selected="false">Tab 2</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="w6--tab3" data-toggle="tab" href="#w6-tab3" role="tab"
                                                   aria-controls="tab3" aria-selected="false">Tab 3</a>
                                            </li>
                                        </ul>
                                        <a class="btn-fab btn-fab fab-right-bottom absolute shadow btn-primary"><i
                                                class="icon-heart-o s-14"></i></a>
                                    </div>

                                </div>
                            </div>
                            <div class="card-body no-p">
                                <div class="tab-content" id="v-pills-tabContent2">
                                    <div class="tab-pane fade active show" id="w6-tab1" role="tabpanel"
                                         aria-labelledby="w6-tab1">
                                        <div class="table-responsive">
                                            <table class="table table-hover earning-box">

                                                <tbody>
                                                <tr class="no-b">
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u1.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u2.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u3.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u4.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u5.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u6.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade text-center p-5" id="w6-tab2" role="tabpanel"
                                         aria-labelledby="w6-tab2">
                                        <h4 class="card-title">Tab 2</h4>
                                        <p class="card-text">With supporting text below as a natural lead-in to additional
                                            content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                    <div class="tab-pane fade text-center p-5" id="w6-tab3" role="tabpanel"
                                         aria-labelledby="w6-tab3">
                                        <h4 class="card-title">Tab 3</h4>
                                        <p class="card-text">With supporting text below as a natural lead-in to additional
                                            content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="row my-3">
                    <div class="col-md-6">
                        <div class="card no-b">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-3">
                                        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist"
                                             aria-orientation="vertical">
                                            <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill"
                                               href="#v-pills-home" role="tab" aria-controls="v-pills-home"
                                               aria-selected="true">Home</a>
                                            <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill"
                                               href="#v-pills-profile" role="tab" aria-controls="v-pills-profile"
                                               aria-selected="false">Profile</a>
                                            <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill"
                                               href="#v-pills-messages" role="tab" aria-controls="v-pills-messages"
                                               aria-selected="false">Messages</a>
                                            <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill"
                                               href="#v-pills-settings" role="tab" aria-controls="v-pills-settings"
                                               aria-selected="false">Settings</a>
                                        </div>
                                    </div>
                                    <div class="col-9">
                                        <div class="tab-content" id="v-pills-tabContent">
                                            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel"
                                                 aria-labelledby="v-pills-home-tab">
                                                <p>Cillum ad ut irure tempor velit nostrud occaecat ullamco aliqua anim Lorem
                                                    sint. Veniam sint duis incididunt do esse magna mollit excepteur laborum
                                                    qui. Id id reprehenderit sit est eu aliqua occaecat quis et velit excepteur
                                                    laborum mollit dolore eiusmod. Ipsum dolor in occaecat commodo et voluptate
                                                    minim reprehenderit mollit pariatur. Deserunt non laborum enim et cillum eu
                                                    deserunt excepteur ea incididunt minim occaecat.</p>
                                            </div>
                                            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel"
                                                 aria-labelledby="v-pills-profile-tab">
                                                <p>Culpa dolor voluptate do laboris laboris irure reprehenderit id incididunt
                                                    duis pariatur mollit aute magna pariatur consectetur. Eu veniam duis non ut
                                                    dolor deserunt commodo et minim in quis laboris ipsum velit id veniam. Quis
                                                    ut consectetur adipisicing officia excepteur non sit. Ut et elit aliquip
                                                    labore Lorem enim eu. Ullamco mollit occaecat dolore ipsum id officia mollit
                                                    qui esse anim eiusmod do sint minim consectetur qui.</p>
                                            </div>
                                            <div class="tab-pane fade" id="v-pills-messages" role="tabpanel"
                                                 aria-labelledby="v-pills-messages-tab">
                                                <p>Fugiat id quis dolor culpa eiusmod anim velit excepteur proident dolor aute
                                                    qui magna. Ad proident laboris ullamco esse anim Lorem Lorem veniam quis
                                                    Lorem irure occaecat velit nostrud magna nulla. Velit et et proident Lorem
                                                    do ea tempor officia dolor. Reprehenderit Lorem aliquip labore est magna
                                                    commodo est ea veniam consectetur.</p>
                                            </div>
                                            <div class="tab-pane fade" id="v-pills-settings" role="tabpanel"
                                                 aria-labelledby="v-pills-settings-tab">
                                                <p>Eu dolore ea ullamco dolore Lorem id cupidatat excepteur reprehenderit
                                                    consectetur elit id dolor proident in cupidatat officia. Voluptate excepteur
                                                    commodo labore nisi cillum duis aliqua do. Aliqua amet qui mollit
                                                    consectetur nulla mollit velit aliqua veniam nisi id do Lorem deserunt amet.
                                                    Culpa ullamco sit adipisicing labore officia magna elit nisi in aute tempor
                                                    commodo eiusmod.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card no-b">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-3">
                                        <div class="nav flex-column nav-pills" id="v-pills-tab22" role="tablist"
                                             aria-orientation="vertical">
                                            <a class="nav-link active r-20" id="v-pills-home-tab2" data-toggle="pill"
                                               href="#v-pills-home2" role="tab" aria-controls="v-pills-home"
                                               aria-selected="true">Home</a>
                                            <a class="nav-link r-20" id="v-pills-profile-tab2" data-toggle="pill"
                                               href="#v-pills-profile2" role="tab" aria-controls="v-pills-profile"
                                               aria-selected="false">Profile</a>
                                            <a class="nav-link r-20" id="v-pills-messages-tab2" data-toggle="pill"
                                               href="#v-pills-messages2" role="tab" aria-controls="v-pills-messages"
                                               aria-selected="false">Messages</a>
                                            <a class="nav-link r-20" id="v-pills-settings-tab2" data-toggle="pill"
                                               href="#v-pills-settings2" role="tab" aria-controls="v-pills-settings"
                                               aria-selected="false">Settings</a>
                                        </div>
                                    </div>
                                    <div class="col-9">
                                        <div class="tab-content" id="v-pills-tabContent3">
                                            <div class="tab-pane fade show active" id="v-pills-home2" role="tabpanel"
                                                 aria-labelledby="v-pills-home-tab">
                                                <p>Cillum ad ut irure tempor velit nostrud occaecat ullamco aliqua anim Lorem
                                                    sint. Veniam sint duis incididunt do esse magna mollit excepteur laborum
                                                    qui. Id id reprehenderit sit est eu aliqua occaecat quis et velit excepteur
                                                    laborum mollit dolore eiusmod. Ipsum dolor in occaecat commodo et voluptate
                                                    minim reprehenderit mollit pariatur. Deserunt non laborum enim et cillum eu
                                                    deserunt excepteur ea incididunt minim occaecat.</p>
                                            </div>
                                            <div class="tab-pane fade" id="v-pills-profile2" role="tabpanel"
                                                 aria-labelledby="v-pills-profile-tab">
                                                <p>Culpa dolor voluptate do laboris laboris irure reprehenderit id incididunt
                                                    duis pariatur mollit aute magna pariatur consectetur. Eu veniam duis non ut
                                                    dolor deserunt commodo et minim in quis laboris ipsum velit id veniam. Quis
                                                    ut consectetur adipisicing officia excepteur non sit. Ut et elit aliquip
                                                    labore Lorem enim eu. Ullamco mollit occaecat dolore ipsum id officia mollit
                                                    qui esse anim eiusmod do sint minim consectetur qui.</p>
                                            </div>
                                            <div class="tab-pane fade" id="v-pills-messages2" role="tabpanel"
                                                 aria-labelledby="v-pills-messages-tab">
                                                <p>Fugiat id quis dolor culpa eiusmod anim velit excepteur proident dolor aute
                                                    qui magna. Ad proident laboris ullamco esse anim Lorem Lorem veniam quis
                                                    Lorem irure occaecat velit nostrud magna nulla. Velit et et proident Lorem
                                                    do ea tempor officia dolor. Reprehenderit Lorem aliquip labore est magna
                                                    commodo est ea veniam consectetur.</p>
                                            </div>
                                            <div class="tab-pane fade" id="v-pills-settings2" role="tabpanel"
                                                 aria-labelledby="v-pills-settings-tab">
                                                <p>Eu dolore ea ullamco dolore Lorem id cupidatat excepteur reprehenderit
                                                    consectetur elit id dolor proident in cupidatat officia. Voluptate excepteur
                                                    commodo labore nisi cillum duis aliqua do. Aliqua amet qui mollit
                                                    consectetur nulla mollit velit aliqua veniam nisi id do Lorem deserunt amet.
                                                    Culpa ullamco sit adipisicing labore officia magna elit nisi in aute tempor
                                                    commodo eiusmod.</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row my-3">
                    <div class="col-12 col-xl-6">
                        <div class="card no-b">
                            <div class="card-body no-p">
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="w8-tab1" role="tabpanel"
                                         aria-labelledby="w8-tab1">
                                        <div class="table-responsive">
                                            <table class="table table-hover earning-box">

                                                <tbody>
                                                <tr class="no-b">
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u1.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u2.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u3.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u4.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u5.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u6.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade text-center p-5" id="w8-tab2" role="tabpanel"
                                         aria-labelledby="w8-tab2">
                                        <h4 class="card-title">Tab 2</h4>
                                        <p class="card-text">With supporting text below as a natural lead-in to additional
                                            content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                    <div class="tab-pane fade text-center p-5" id="w8-tab3" role="tabpanel"
                                         aria-labelledby="w8-tab3">
                                        <h4 class="card-title">Tab 3</h4>
                                        <p class="card-text">With supporting text below as a natural lead-in to additional
                                            content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                </div>

                            </div>
                            <div class="card-footer pb-0">
                                <div class="d-flex justify-content-between">
                                    <div class="align-self-center">
                                        <ul class="nav nav-pills nav-icon-pills mb-3" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link btn-fab active show mr-2" id="w8--tab1" data-toggle="tab"
                                                   href="#w8-tab1" role="tab" aria-controls="tab1" aria-expanded="true"
                                                   aria-selected="true"><i class="icon-cube p-0"></i></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link btn-fab mr-2" id="w8--tab2" data-toggle="tab" href="#w8-tab2"
                                                   role="tab" aria-controls="tab2" aria-selected="false"><i
                                                        class="icon-add p-0"></i></a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link btn-fab mr-2" id="w8--tab3" data-toggle="tab" href="#w8-tab3"
                                                   role="tab" aria-controls="tab3" aria-selected="false"><i
                                                        class="icon-add-3 p-0"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-xl-6">
                        <div class="card no-b">
                            <div class="card-body no-p">
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="w7-tab1" role="tabpanel"
                                         aria-labelledby="w7-tab1">
                                        <div class="table-responsive">
                                            <table class="table table-hover earning-box">

                                                <tbody>
                                                <tr class="no-b">
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u1.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u2.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u3.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u4.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u5.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                <tr>
                                                    <td class="w-10"><span class="round">
                                        <img src="assets/img/demo/u6.png" alt="user"></span>
                                                    </td>
                                                    <td>
                                                        <h6>Sara Kamzoon</h6>
                                                        <small class="text-muted">Marketing Manager</small>
                                                    </td>
                                                    <td>25</td>
                                                    <td>$250</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade text-center p-5" id="w7-tab2" role="tabpanel"
                                         aria-labelledby="w7-tab2">
                                        <h4 class="card-title">Tab 2</h4>
                                        <p class="card-text">With supporting text below as a natural lead-in to additional
                                            content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                    <div class="tab-pane fade text-center p-5" id="w7-tab3" role="tabpanel"
                                         aria-labelledby="w7-tab3">
                                        <h4 class="card-title">Tab 3</h4>
                                        <p class="card-text">With supporting text below as a natural lead-in to additional
                                            content.</p>
                                        <a href="#" class="btn btn-primary">Go somewhere</a>
                                    </div>
                                </div>

                            </div>
                            <div class="card-footer  pb-0">
                                <div class="d-flex justify-content-between">
                                    <div class="align-self-center">
                                        <h5>Awesome Title</h5>
                                    </div>
                                    <div class="align-self-center">

                                        <ul class="nav nav-pills mb-3" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link active show" id="w7--tab1" data-toggle="tab" href="#w7-tab1"
                                                   role="tab" aria-controls="tab1" aria-expanded="true" aria-selected="true">Tab
                                                    1</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="w7--tab2" data-toggle="tab" href="#w7-tab2" role="tab"
                                                   aria-controls="tab2" aria-selected="false">Tab 2</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="w7--tab3" data-toggle="tab" href="#w7-tab3" role="tab"
                                                   aria-controls="tab3" aria-selected="false">Tab 3</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                --%>
            </div>

    </main><!--@Page Content-->
</div><!--@#app-->
<!--/#app -->
<script src="assets/js/app.js"></script>
</body>
</html>
