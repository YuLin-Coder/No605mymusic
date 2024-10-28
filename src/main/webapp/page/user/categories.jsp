<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="_pre.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: martin
  Date: 2020/11/16
  Time: 16:35
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
    <title>音乐分类</title>
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/page/user/assets/css/app.css">
</head>

<body class="sidebar-mini sidebar-collapse theme-dark  sidebar-expanded-on-hover has-preloader" style="display: none;">

<div id="app">
<!--Page Content-->
<main id="pageContent" class="page has-sidebar">
    <div class="container-fluid relative animatedParent animateOnce">
        <div class="animated fadeInUpShort p-md-5 p-3">
            <section class="section">
                <h1 class="mb-2 text-primary">音乐类型</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. <br>Architecto atque aut blanditiis consectetur
                </p>
            </section>
            <section class="section">
                <div class="mb-4">
                    <h3>中文音乐</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                </div>
                <div class="row">
                    <c:forEach items="${sessionScope.allTypes}" var="type" varStatus="t">
                        <c:if test="${type.songCount != 0}">
                            <div class="col-md-4 mb-3">
                                <div class="card p-3">
                                    <div class="d-flex align-items-center justify-content-between">
                                        <div class="col-8">
                                            <div class="mr-4 float-left">
                                                <i class="icon-windows s-36"></i>
                                            </div>
                                            <h6>
                                                    ${type.name}
                                            </h6>
                                            <a href="${pageContext.request.contextPath}/getAllCategoriesSongServlet?songType=${type.name}">
                                                <small>${type.songCount} 首单曲</small>
                                            </a>
                                        </div>
                                        <a href="#" class="ml-auto"><i class="icon-link"></i></a>
                                        <div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </section>
            <section class="section">
                <div class="mb-4">
                    <h3>Arabic Music</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                </div>
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <div class="card p-3">
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="col-8">
                                    <div class="mr-4 float-left">
                                        <i class="icon-windows s-36"></i>
                                    </div>
                                    <h6>
                                        Rock Music
                                    </h6>
                                    <a href="">
                                        <small>50 Tracks</small>
                                    </a>
                                </div>
                                <a href="#" class="ml-auto"><i class="icon-link"></i></a>
                                <div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="card p-3">
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="col-8">
                                    <div class="mr-4 float-left">
                                        <i class="icon-windows s-36"></i>
                                    </div>
                                    <h6>
                                        Classic Music
                                    </h6>
                                    <a href="">
                                        <small>50 Tracks</small>
                                    </a>
                                </div>
                                <a href="#" class="ml-auto"><i class="icon-link"></i></a>
                                <div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="card p-3">
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="col-8">
                                    <div class="mr-4 float-left">
                                        <i class="icon-windows s-36"></i>
                                    </div>
                                    <h6>
                                        Jazz Music
                                    </h6>
                                    <a href="">
                                        <small>50 Tracks</small>
                                    </a>
                                </div>
                                <a href="#" class="ml-auto"><i class="icon-link"></i></a>
                                <div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="card p-3">
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="col-8">
                                    <div class="mr-4 float-left">
                                        <i class="icon-windows s-36"></i>
                                    </div>
                                    <h6>
                                        Rock Music
                                    </h6>
                                    <a href="">
                                        <small>50 Tracks</small>
                                    </a>
                                </div>
                                <a href="#" class="ml-auto"><i class="icon-link"></i></a>
                                <div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="card p-3">
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="col-8">
                                    <div class="mr-4 float-left">
                                        <i class="icon-windows s-36"></i>
                                    </div>
                                    <h6>
                                        Classic Music
                                    </h6>
                                    <a href="">
                                        <small>50 Tracks</small>
                                    </a>
                                </div>
                                <a href="#" class="ml-auto"><i class="icon-link"></i></a>
                                <div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="section">
                <div class="mb-4">
                    <h3>Desi Music</h3>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
                </div>
                <div class="row">
                    <div class="col-md-4 mb-3">
                        <div class="card p-3">
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="col-8">
                                    <div class="mr-4 float-left">
                                        <i class="icon-windows s-36"></i>
                                    </div>
                                    <h6>
                                        Rock Music
                                    </h6>
                                    <a href="">
                                        <small>50 Tracks</small>
                                    </a>
                                </div>
                                <a href="#" class="ml-auto"><i class="icon-link"></i></a>
                                <div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="card p-3">
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="col-8">
                                    <div class="mr-4 float-left">
                                        <i class="icon-windows s-36"></i>
                                    </div>
                                    <h6>
                                        Classic Music
                                    </h6>
                                    <a href="">
                                        <small>50 Tracks</small>
                                    </a>
                                </div>
                                <a href="#" class="ml-auto"><i class="icon-link"></i></a>
                                <div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="card p-3">
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="col-8">
                                    <div class="mr-4 float-left">
                                        <i class="icon-windows s-36"></i>
                                    </div>
                                    <h6>
                                        Jazz Music
                                    </h6>
                                    <a href="">
                                        <small>50 Tracks</small>
                                    </a>
                                </div>
                                <a href="#" class="ml-auto"><i class="icon-link"></i></a>
                                <div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="card p-3">
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="col-8">
                                    <div class="mr-4 float-left">
                                        <i class="icon-windows s-36"></i>
                                    </div>
                                    <h6>
                                        Rock Music
                                    </h6>
                                    <a href="">
                                        <small>50 Tracks</small>
                                    </a>
                                </div>
                                <a href="#" class="ml-auto"><i class="icon-link"></i></a>
                                <div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <div class="card p-3">
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="col-8">
                                    <div class="mr-4 float-left">
                                        <i class="icon-windows s-36"></i>
                                    </div>
                                    <h6>
                                        Classic Music
                                    </h6>
                                    <a href="">
                                        <small>50 Tracks</small>
                                    </a>
                                </div>
                                <a href="#" class="ml-auto"><i class="icon-link"></i></a>
                                <div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</main><!--@Page Content-->
</div><!--@#app-->
<!--/#app -->
<script src="assets/js/app.js"></script>


</body>
</html>
