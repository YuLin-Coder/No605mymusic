<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="_pre.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: martin
  Date: 2020/11/17
  Time: 10:22
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
    <title>专辑</title>
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/user/assets/css/app.css">
</head>

<body class="sidebar-mini sidebar-collapse theme-dark  sidebar-expanded-on-hover has-preloader" style="display: none;">

<div id="app">
<!--Page Content-->
<main id="pageContent" class="page has-sidebar">

    <div class="container-fluid relative animatedParent animateOnce">
        <div class="animated fadeInUpShort p-5 ml-lg-5 mr-lg-5">
            <section>
                <div class="relative mb-5">
                    <h1 class="mb-2 text-primary">专辑</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. <br>Architecto atque aut blanditiis
                        consectetur</p>
                </div>
                <div class="row has-items-overlay">
                    <c:forEach items="${sessionScope.allSingers}" var="singer" varStatus="s" >
                        <div class="col-lg-3 col-md-4 col-sm-6 my-2">
                            <figure>
                                <div class="img-wrapper">
                                    <img src="${pageContext.request.contextPath}/${singer.pic}" alt="/">
                                    <div class="img-overlay text-white text-center">
                                        <a href="${pageContext.request.contextPath}/albumSingleServlet?singerName=${singer.name}">
                                            <div class="figcaption mt-3">
                                                <i class="icon-link s-48"></i>
                                                <h5 class="mt-5">${singer.name}</h5>
                                                <span>${singer.englishName}</span>
                                            </div>
                                        </a>
                                    </div>
                                    <div class="figure-title text-center p-2">
                                        <h5>${singer.name}</h5>
                                        <span>${singer.englishName}</span>
                                    </div>
                                </div>
                            </figure>
                        </div>
                    </c:forEach>
<%--                    <div class="col-lg-3 col-md-4 col-sm-6 my-2">--%>
<%--                        <figure>--%>
<%--                            <div class="img-wrapper">--%>
<%--                                <img src="assets/img/demo/a8.jpg" alt="/">--%>
<%--                                <div class="img-overlay text-white text-center">--%>
<%--                                    <a href="album-single.html">--%>
<%--                                        <div class="figcaption mt-3">--%>
<%--                                            <i class="icon-link s-48"></i>--%>
<%--                                            <h5 class="mt-5">To Phir Ao</h5>--%>
<%--                                            <span>Atif Aslam</span>--%>
<%--                                        </div>--%>
<%--                                    </a>--%>
<%--                                </div>--%>
<%--                                <div class="figure-title text-center p-2">--%>
<%--                                    <h5>To Phir Ao</h5>--%>
<%--                                    <span>Atif Aslam</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </figure>--%>
<%--                    </div>--%>
                </div>
            </section>
        </div>
    </div>

</main><!--@Page Content-->
</div><!--@#app-->
<!--/#app -->
<script src="${pageContext.request.contextPath}/page/user/assets/js/app.js"></script>


</body>
</html>
