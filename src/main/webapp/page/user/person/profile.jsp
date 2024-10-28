
<%@ include file="../_pre.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: martin
  Date: 2020/11/16
  Time: 16:16
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
    <title>个人资料</title>
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/page/user/assets/css/app.css">
</head>

<body class="sidebar-mini sidebar-collapse theme-dark  sidebar-expanded-on-hover has-preloader" style="display: none;">

<div id="app">
<!--Page Content-->
<main id="pageContent" class="page has-sidebar">
    <div class="container-fluid relative animatedParent animateOnce p-lg-5">
        <div class="card no-b shadow no-r">
            <div class="row no-gutters">
                <div class="col-md-4 b-r">
                    <div class="text-center p-5 mt-5">
                        <figure class="avatar avatar-xl">
                            <img src="${pageContext.request.contextPath }/${sessionScope.user.avatar}" alt=""></figure>
<%--                            <img src="${pageContext.request.contextPath + sessionScope.user.avatar }" alt=""></figure>--%>
                        <div>
                            <h4 class="p-t-10">${sessionScope.user.name}</h4>
                            ${sessionScope.user.email}
                        </div>
                        <a href="#" class="btn btn-outline-primary btn-sm  mt-3">修改个人信息</a>
                        <div class="mt-5">
                            <ul class="social social list-inline">
                                <li class="list-inline-item"><a href="#" class="grey-text"><i class="icon-facebook"></i></a>
                                </li>
                                <li class="list-inline-item"><a href="#" class="grey-text"><i class="icon-youtube"></i></a>
                                </li>
                                <li class="list-inline-item"><a href="#" class="grey-text"><i class="icon-twitter"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="p5 b-b">
                        <div class="pl-4 mt-4">
                            <h5>官方资料</h5>
                        </div>
                        <div class="row">
                            <div class="col-md-5">
                                <div class="p-4">
                                    <h4>用户账号</h4>
                                    <span>${sessionScope.user.username}</span>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="p-4">
                                    <h4>邮箱</h4>
                                    <span>${sessionScope.user.email}</span>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="p-4">
                                    <h4>电话号码</h4>
                                    <span>${sessionScope.user.phone}</span>
                                </div>
                            </div>


                        </div>
                    </div>
                    <div class="p5 b-b">
                        <div class="pl-4 mt-4">
                            <h5>个人信息</h5>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="p-4">
                                    <h4>生日</h4>
                                    <span>${sessionScope.user.birth}</span>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="p-4">
                                    <h4>用户类型</h4>
                                    <span>${sessionScope.user.type == 0 ? "普通用户" : "vip用户(" + sessionScope.user.vipDate + "到期）"}</span>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="p-4">
                                    <h4>个人签名</h4>
                                    <span>
                                        <img src="${pageContext.request.contextPath}/${sessionScope.user.sign}" alt="">
                                    </span>

                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="p-4">
                        <h4>新的关注者</h4>
                        <ul class="list-inline mt-3">
                            <li class="list-inline-item ">
                                <img src="${pageContext.request.contextPath }/page/user/assets/img/demo/u13.png" alt="" class="img-responsive w-40px circle mb-3">
                            </li>
                            <li class="list-inline-item">
                                <img src="${pageContext.request.contextPath }/page/user/assets/img/demo/u12.png" alt="" class="img-responsive w-40px circle mb-3">
                            </li>
                            <li class="list-inline-item">
                                <img src="${pageContext.request.contextPath }/page/user/assets/img/demo/u11.png" alt="" class="img-responsive w-40px circle mb-3">
                            </li>
                            <li class="list-inline-item">
                                <img src="${pageContext.request.contextPath }/page/user/assets/img/demo/u10.png" alt="" class="img-responsive w-40px circle mb-3">
                            </li>
                            <li class="list-inline-item">
                                <img src="${pageContext.request.contextPath }/page/user/assets/img/demo/u9.png" alt="" class="img-responsive w-40px circle mb-3">
                            </li>
                            <li class="list-inline-item">
                                <img src="${pageContext.request.contextPath }/page/user/assets/img/demo/u8.png" alt="" class="img-responsive w-40px circle mb-3">
                            </li>
                            <li class="list-inline-item ">
                                <img src="${pageContext.request.contextPath }/page/user/assets/img/demo/u7.png" alt="" class="img-responsive w-40px circle mb-3">
                            </li>
                            <li class="list-inline-item">
                                <img src="${pageContext.request.contextPath }/page/user/assets/img/demo/u6.png" alt="" class="img-responsive w-40px circle mb-3">
                            </li>
                            <li class="list-inline-item">
                                <img src="${pageContext.request.contextPath }/page/user/assets/img/demo/u5.png" alt="" class="img-responsive w-40px circle mb-3">
                            </li>
                            <li class="list-inline-item">
                                <img src="${pageContext.request.contextPath }/page/user/assets/img/demo/u4.png" alt="" class="img-responsive w-40px circle mb-3">
                            </li>
                            <li class="list-inline-item">
                                <img src="${pageContext.request.contextPath }/page/user/assets/img/demo/u3.png" alt="" class="img-responsive w-40px circle mb-3">
                            </li>
                            <li class="list-inline-item">
                                <img src="${pageContext.request.contextPath }/page/user/assets/img/demo/u2.png" alt="" class="img-responsive w-40px circle mb-3">
                            </li>
                        </ul>
                    </div>

                </div>
            </div>

        </div>

    </div>

    <div class="center col-12 col-xl-9">
        <div class="card no-b">
            <div class="card-header pb-0">
                <div class="d-flex justify-content-between">
                    <div class="align-self-center">
                        <ul class="nav nav-pills mb-3" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active show r-20" id="w3--tab1" data-toggle="tab"
                                   href="#w3-tab1" role="tab" aria-controls="tab1" aria-expanded="true"
                                   aria-selected="true">歌单1</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link r-20" id="w3--tab2" data-toggle="tab" href="#w3-tab2"
                                   role="tab" aria-controls="tab2" aria-selected="false">Tab 2</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link r-20" id="w3--tab3" data-toggle="tab" href="#w3-tab3"
                                   role="tab" aria-controls="tab3" aria-selected="false">新建歌单</a>
                            </li>
                        </ul>
                    </div>
                    <div class="align-self-center">
                        <h5>歌单</h5>
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
                    <div class="tab-pane fade text-center p-5" id="w3-tab2" role="tabpanel"
                         aria-labelledby="w3-tab2">
                        <h4 class="card-title">Tab 2</h4>
                        <p class="card-text">With supporting text below as a natural lead-in to additional
                            content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                    <div class="tab-pane fade text-center p-5" id="w3-tab3" role="tabpanel"
                         aria-labelledby="w3-tab3">
                        <h4 class="card-title">Tab 3</h4>
                        <p class="card-text">With supporting text below as a natural lead-in to additional
                            content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>

            </div>
        </div>
    </div>


</main><!--@Page Content-->
</div><!--@#app-->
<!--/#app -->
<script src="${pageContext.request.contextPath }/page/user/assets/js/app.js"></script>


</body>
</html>
