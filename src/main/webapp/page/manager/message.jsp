<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/9 0009
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>消息</title>
    <link rel="icon" href="favicon.ico" type="image/ico">
    <link href="${pageContext.request.contextPath }/css/manager/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/manager/fonts.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/manager/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/js/jstool/tool.js">
</head>

<body onload="getData()">
<!--页面主要内容-->
<main class="ftdms-layout-content">

    <div class="container-fluid">
        <div class="row" style="margin-top:15px;">
            <div class="col-sm-6 col-lg-6">
                <div class="card">
                    <div class="card-header bg-primary">
                        <h4>添加结果信息</h4>
                        <ul class="card-actions">
                            <li>
<%--                                <button type="button"><i class="ftsucai-more"></i></button>--%>
                                 <p>${requestScope.message}</p>
                            </li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <a href="${pageContext.request.contextPath}/page/manager/${requestScope.page}.jsp">点此返回音乐管理</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- .row -->
        <!-- End Cards with Actions -->

    </div>

</main>
<!--End 页面主要内容-->

<script type="text/javascript" src="${pageContext.request.contextPath }/js/manager/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/manager/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/manager/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/manager/main.min.js"></script>
<script type="text/javascript">

</script>
</body>
</html>
