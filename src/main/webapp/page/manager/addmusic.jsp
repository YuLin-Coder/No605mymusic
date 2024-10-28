<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/10 0010
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>新增音乐</title>
    <link rel="icon" href="favicon.ico" type="image/ico">
    <link href="${pageContext.request.contextPath }/css/manager/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/manager/fonts.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/manager/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }/css/manager/animate.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/js/manager/jquery-tags-input/jquery.tagsinput.min.css">
</head>

<body>
<!--页面主要内容-->
<main class="ftdms-layout-content">

    <div class="container-fluid">

        <div class="row" style="margin-top:15px;">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header"><h4>新增音乐向导</h4></div>
                    <div class="card-body">

                        <form action="<%=request.getContextPath()%>/admin/uploadFileServlet?currentPage=${sessionScope.pb.currentPage + 1}&rows=6&name=${sessionScope.condition.song_name[0]}&singerName=${sessionScope.condition.singer_name[0]}&type=${sessionScope.condition.song_type[0]}" method="post" onsubmit="return submitFunc(this)" enctype="multipart/form-data" class="guide-box" data-navigateable="true">
                            <ul class="nav-step step-dots">
                                <li class="nav-step-item active">
                                    <span>填写歌曲名、歌手名</span>
                                    <a class="active" data-toggle="tab" href="#step-1"></a>
                                </li>

                                <li class="nav-step-item">
                                    <span>歌曲语言及标签</span>
                                    <a data-toggle="tab" href="#step-2"></a>
                                </li>

                                <li class="nav-step-item">
                                    <span>歌曲文件</span>
                                    <a data-toggle="tab" href="#step-3"></a>
                                </li>

                                <li class="nav-step-item">
                                    <span>歌词</span>
                                    <a data-toggle="tab" href="#step-4"></a>
                                </li>
                            </ul>
                            <!--对应内容-->
                            <div class="nav-step-content">
                                <div class="nav-step-pane hidden active" id="step-1">
                                    <div class="form-group">
                                        <label for="songName" class="control-label">歌曲名称：</label>
                                        <input type="text" class="form-control" id="songName" name="songName">
                                    </div>
                                    <div class="form-group">
                                        <label for="singerName" class="control-label">歌手名称：</label>
                                        <input type="text" class="form-control" id="singerName" name="singerName">
                                    </div>
                                </div>

                                <div class="nav-step-pane hidden" id="step-2">
                                    <div class="form-group">
                                        <label for="language" class="control-label">歌曲语种：</label>
                                        <input type="text" class="form-control" id="language" name="language">
                                    </div>
                                    <div class="form-group">
                                        <label for="songType" class="control-label">歌曲类型：</label>
                                        <input class="form-control js-tags-input" type="text" id="songType" name="songType" placeholder="请输入标签" value="流行,摇滚">
                                    </div>
                                </div>

                                <div class="nav-step-pane hidden" id="step-3">
                                    <div class="form-group">
                                        <label for="musicFile" class="control-label">歌曲文件：</label>
                                        <input type="file" id="musicFile" name="musicFile">
                                    </div>
                                </div>

                                <div class="nav-step-pane hidden" id="step-4">
                                    <div class="form-group">
                                        <label for="lyric" class="control-label">歌词：</label>
                                        <textarea class="form-control" id="lyric" name="lyric"></textarea>
                                    </div>
                                </div>
                            </div>
                            <!--End 对应内容-->
                            <hr>
                            <div class="nav-step-button">
                                <button class="btn btn-secondary disabled" data-wizard="prev" type="button">上一步</button>
                                <button class="btn btn-secondary" data-wizard="next" type="button">下一步</button>
                                <button class="btn btn-primary hidden" data-wizard="finish" type="submit">完成</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>

        </div>

    </div>

</main>
<!--End 页面主要内容-->
</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/manager/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/manager/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/manager/main.min.js"></script>
<script src="${pageContext.request.contextPath }/js/manager/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/manager/tips.js"></script>
<%-- 标签插入 --%>
<script src="${pageContext.request.contextPath }/js/manager/jquery-tags-input/jquery.tagsinput.min.js"></script>
<!--向导插件-->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/manager/jquery.bootstrap.wizard.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('.guide-box').bootstrapWizard({
            'tabClass': 'nav-step',
            'nextSelector': '[data-wizard="next"]',
            'previousSelector': '[data-wizard="prev"]',
            'finishSelector': '[data-wizard="finish"]',
            'onTabClick': function(e, t, i) {
                if (!$('.guide-box').is('[data-navigateable="true"]')) return ! 1
            },
            'onTabShow': function(e, t, i) {
                t.children(":gt(" + i + ").complete").removeClass("complete");
                t.children(":lt(" + i + "):not(.complete)").addClass("complete");
            },
            'onFinish': function(e, t, i) {
                // 点击完成后处理提交
                // return submitFunc();
            }
        });
    });

    function submitFunc(e) {
        tips.loading("show");
        var songName = $("#songName").val();
        var singerName = $("#singerName").val();
        var language = $("#language").val();
        var songType = $("#songType").val();
        var lyric = $("#lyric").val();
        var musicFile = $('#musicFile').get(0).files[0];

        if (songName == null || songName == "") {
            tips.loading("hide");
            tips.notify('歌曲名不能为空~', 'danger', 100);
            return false;
        }
        if (singerName == null || singerName == "") {
            tips.loading("hide");
            tips.notify('歌手名不能为空~', 'danger', 100);
            return false;
        }
        if (language == null || language == "") {
            tips.loading("hide");
            tips.notify('歌曲语种不能为空~', 'danger', 100);
            return false;
        }
        if (songType == null || songType == "") {
            tips.loading("hide");
            tips.notify('歌曲类型不能为空~', 'danger', 100);
            return false;
        }
        if (lyric == null || lyric == "") {
            tips.loading("hide");
            tips.notify('歌词不能为空~', 'danger', 100);
            return false;
        }
        if (!musicFile) {
            tips.loading("hide");
            tips.notify('歌曲文件不能为空~', 'danger', 100);
            return false;
        }
        var pathUrl = getPath() + "/admin/addSongServlet";
        var uploadUrl = getPath() + "/admin/uploadFileServlet";
        var formatData = new FormData();
        formatData.append("musicFile", musicFile);
        var jsonData = {
            "songName": songName,
            "singerName": singerName,
            "language": language,
            "songType": songType,
            "lyric": lyric,
        }

        // $.post(pathUrl, jsonData, function (data) {
        //     // 添加成功后的操作
        //     tips.loading("hide");
        //     if (data.status == "ok") {
        //         tips.notify(data.text, "success", 3000);
        //
        //         $.ajax({
        //             url: uploadUrl,
        //             data: formatData,
        //             type: "POST",
        //             //ajax2.0可以不用设置请求头，但是jq帮我们自动设置了，这样的话需要我们自己取消掉
        //             contentType: false,
        //             //取消帮我们格式化数据，是什么就是什么
        //             processData: false,
        //             enctype: "multipart/form-data",
        //             success: function (data) {
        //                 // 添加成功后的操作
        //                 tips.loading("hide");
        //                 if (data.tip == "ok") {
        //                     tips.notify(data.message, "success", 3000);
        //                     window.location.reload();
        //                 } else if (data.tip == "error") {
        //                     tips.notify(data.message, "danger", 1000);
        //                 }
        //             },
        //             dataType: "json"
        //         });
        //         window.location.reload();
        //     } else if (data.status == "error") {
        //         tips.notify(data.text, "danger", 1000);
        //     }
        // }, "json");
    }
</script>
</body>
</html>