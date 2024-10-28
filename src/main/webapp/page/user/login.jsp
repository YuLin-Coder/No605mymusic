
<%@ include file="_pre.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: martin
  Date: 2020/11/16
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="${pageContext.request.contextPath }/page/user/assets/img/basic/favicon.ico" type="image/x-icon">
    <title>登陆</title>
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/page/user/assets/css/app.css">
</head>

<body class="sidebar-mini sidebar-collapse theme-dark  sidebar-expanded-on-hover has-preloader" style="display: none;">

<!-- @Pre loader-->
<div id="app">

    <main>
        <div id="primary" class="p-t-b-100 height-full">
            <div class="container">
                <div class="text-center s-14 l-s-2 my-5">
                    <a class="my-5" href="index.html">

                        <span>登陆</span>

                    </a>
                </div>
                <div class="row">
                    <div class="col-md-10 mx-md-auto">
                        <div class="mt-5">
                            <div class="row grid">
                                <div class="col-md-7 card p-5">
                                    <form class="form-material" method="post" action="${pageContext.request.contextPath }/user/loginServlet" onsubmit="">
                                        <!-- Input -->
                                        <div class="body">
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" id="username" name="username">
                                                    <label class="form-label">账号</label>
                                                </div>
                                            </div>
                                            <div class="form-group form-float">
                                                <div class="form-line">
                                                    <input type="text" class="form-control" id="password" name="password">
                                                    <label class="form-label">密码</label>
                                                </div>
                                            </div>

                                            <input type="submit" class="btn btn-outline-primary btn-sm pl-4 pr-4"
                                                   value="登陆">

                                            <div class="pt-5">
                                                <small><a href="#">忘记密码?</a></small>
                                            </div>
                                        </div>
                                        <!-- #END# Input -->
                                    </form>
                                </div>
                                <div class="col-md-5  p-5">
                                    <h1 class="mt-3 font-weight-lighter">你是新来的吗?</h1>
                                    <div class="pt-3 mb-5">
                                        <p>Lorem ipsum dolor sit amet, sapiente tenetur ut, veritatis.</p>
                                    </div>
                                    <input type="button" value="创建账户" class="btn btn-outline-primary s-14 pl-4 pr-4" onclick="toRegister()">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main><!--@Page Content-->
</div><!--@#app-->
<script src="${pageContext.request.contextPath }/page/user/assets/js/app.js"></script>
<script type="text/javascript">
    function toRegister(){
        window.location.href = "${pageContext.request.contextPath }/page/user/register.jsp";
    }
</script>
</body>
</html>
