
<%@ include file="_pre.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: martin
  Date: 2020/11/16
  Time: 14:35
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
    <title>信息</title>
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/page/user/assets/css/app.css">
</head>

<body class="sidebar-mini sidebar-collapse theme-dark  sidebar-expanded-on-hover has-preloader" style="display: none;">

<div id="app">
    <!--Page Content-->
    <main id="pageContent" class="page has-sidebar">
        <div class="container">
            <div class="col-xl-8 mx-lg-auto">
                <div class="pt-5 p-t-100 text-center">
                    <h1 class="text-primary">${requestScope.titleMsg}</h1>
                    <p class="section-subtitle">
                        ${requestScope.textMsg}<br>
                        <a href="${requestScope.urlMsg}">点此跳转到 ${requestScope.pageMsg} 页面</a>
                    </p>
                    <p class="s-256">${requestScope.codeMsg}</p>
                </div>
            </div>
        </div>
    </main><!--@Page Content-->
</div><!--@#app-->
<!--/#app -->
<script src="${pageContext.request.contextPath }/page/user/assets/js/app.js"></script>

</body>
</html>
