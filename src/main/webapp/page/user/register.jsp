
<%@ include file="_pre.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: martin
  Date: 2020/11/16
  Time: 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="icon" href="${pageContext.request.contextPath }/page/user/assets/img/basic/favicon.ico" type="image/x-icon">
    <title>注册</title>
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/page/user/assets/css/app.css">
    <link href="${pageContext.request.contextPath }/css/manager/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/manager/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/manager/fonts.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/manager/style.css" rel="stylesheet">

</head>

<body class="sidebar-mini sidebar-collapse theme-dark  sidebar-expanded-on-hover has-preloader" style="display: none;">

<div id="app">
    <!--Page Content-->
    <main id="pageContent" class="page has-sidebar">
        <div class="light b-t">
            <div id="primary" class="content-area"
                 data-bg-possition="center"
                 data-bg-repeat="false"
                 style="background: url('assets/img/icon/icon-circles.png');">
                <main id="main" class="site-main">
                    <div class="container">
                        <div class="col-xl-8 mx-lg-auto p-t-b-80">
                            <header class="text-center">
                                <h1>创建新账户</h1>
                                <p>加入我们精彩的社区，让其他人一分钱都可以帮助您</p>
                                <img class="p-t-b-50" src="assets/img/icon/icon-join.png" alt="">
                            </header>
                            <form method="post" action="${pageContext.request.contextPath }/user/registerServlet" onsubmit="return checkInput();">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-lg"
                                                   id="username" name="username" placeholder="请输入账号" onblur="checkUsername()">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-lg"
                                                   id="name" name="name" placeholder="请输入用户名" onblur="checkName()">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-lg"
                                                   id="email" name="email" placeholder="请输入邮箱" onblur="checkEmail()">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-lg"
                                                   id="password" name="password" placeholder="请输入密码">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-lg"
                                                   id="rePassword" name="rePassword" placeholder="请输入确认密码">
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <input type="submit" class="btn btn-success btn-lg btn-block" value="注册">
                                        <p class="forget-pass">验证电子邮件将发送到您的邮箱</p>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </main>
                <!-- #main -->
            </div>
            <!-- #primary -->
        </div>
    </main><!--@Page Content-->
</div><!--@#app-->
<!--/#app -->
<script type="text/javascript" src="${pageContext.request.contextPath}/page/user/assets/js/app.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/manager/tips.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/manager/main.min.js"></script>
<script src="${pageContext.request.contextPath }/js/manager/bootstrap-notify.min.js"></script>

<script type="text/javascript">


    $(function (){

    });

    let usernameFlag = false;
    let nameFlag = false;
    let emailFlag = false;

    function checkUsername() {
        tips.loading("show");
        var username = $("#username").val();
        usernameFlag = false;
        if (username == null || username == ""){
            tips.loading("hide");
            tips.notify("账号不能为空~", "info", 1000);
            return false;
        } else {
            var url = "${pageContext.request.contextPath}/user/checkInputServlet";
            var jsonData = { "username": username };
            $.post(url, jsonData, function (data){
                if(data.status == "error") {
                    tips.loading("hide");
                    tips.notify("账号已存在，请更换~", "info", 1000);
                    return false;
                } else if(data.status == "ok") {
                    usernameFlag = true;
                    tips.loading("hide");
                    tips.notify("账号可用~", "info", 1000);
                    return true;
                } else {
                    tips.loading("hide");
                    tips.notify("404，诶呀！你要验证的账号出了些问题诶~", "info", 1000);
                    return false;
                }
            }, "json");
        }
    }

    function checkName() {
        tips.loading("show");
        var name = $("#name").val();
        nameFlag = false;
        if (name == null || name == ""){
            tips.loading("hide");
            tips.notify("用户名不能为空~", "info", 1000);
            return false;
        } else {
            var url = "${pageContext.request.contextPath}/user/checkInputServlet";
            var jsonData = { "name": name };
            $.post(url, jsonData, function (data){
                if(data.status == "error") {
                    tips.loading("hide");
                    tips.notify("用户名已存在，请更换~", "info", 1000);
                    return false;
                } else if(data.status == "ok") {
                    nameFlag = true;
                    tips.loading("hide");
                    tips.notify("用户名可用~", "info", 1000);
                    return true;
                } else {
                    tips.loading("hide");
                    tips.notify("404，诶呀！你要验证的用户名出了些问题诶~", "info", 1000);
                    return false;
                }
            }, "json");
        }
    }

    function checkEmail() {
        tips.loading("show");
        var email = $("#email").val();
        var emailReg = /^\w+@[a-zA-Z0-9]{2,10}(?:\.[a-z]{2,4}){1,3}$/;
        emailFlag = false;
        if (email == null || email == ""){
            tips.loading("hide");
            tips.notify("邮箱不能为空~", "info", 1000);
            return false;
        } else if (!emailReg.test(email)){
            tips.loading("hide");
            tips.notify("邮箱格式不正确~", "info", 1000);
            return false;
        } else {
            var url = "${pageContext.request.contextPath}/user/checkInputServlet";
            var jsonData = { "email": email };
            $.post(url, jsonData, function (data){
                if(data.status == "error") {
                    tips.loading("hide");
                    tips.notify("邮箱已绑定三个了，不能再多了，请更换~", "info", 1000);
                    return false;
                } else if(data.status == "ok") {
                    emailFlag = true;
                    tips.loading("hide");
                    tips.notify("邮箱可用~", "info", 1000);
                    return true;
                } else {
                    tips.loading("hide");
                    tips.notify("404，诶呀！你要验证的邮箱出了些问题诶~", "info", 1000);
                    return false;
                }
            }, "json");
        }
    }

    function checkInput(){
        tips.loading("show");
        var password = $("#password").val();
        var rePassword = $("#rePassword").val();
        var passwordReg = /^(?=.*?[a-z)(?=.*>[A-Z])(?=.*?[0-9])[a-zA_Z0-9]{6,20}$/;

        if (password == null || password == ""){
            tips.loading("hide");
            tips.notify("密码不能为空~", "info", 1000);
            return false;
        } else if (!passwordReg.test(password)){
            tips.loading("hide");
            tips.notify("密码必须由字母、数字组成，且长度需在6~20个字符之间~", "info", 1000);
            return false;
        } else if (rePassword == null || rePassword == ""){
            tips.loading("hide");
            tips.notify("确认密码不能为空~", "info", 1000);
            return false;
        } else if (rePassword != password){
            tips.loading("hide");
            tips.notify("确认密码和密码不一致~", "info", 1000);
            return false;
        } else if(!usernameFlag || !nameFlag || !emailFlag) {
            tips.loading("hide");
            tips.notify("请检查账号、用户名、邮箱格式是否正确~", "info", 1000);
            return false;
        } else {
            return true;
        }
    }

</script>

</body>
</html>