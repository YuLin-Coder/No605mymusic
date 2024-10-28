<%--
  Created by IntelliJ IDEA.
  User: martin
  Date: 2020/11/13
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
    <title>新增歌手</title>
    <link rel="icon" href="favicon.ico" type="image/ico">
    <link href="${pageContext.request.contextPath }/css/manager/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath }css/manager/fonts.css" rel="stylesheet">
    <!--标签插件-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/js/manager/jquery-tags-input/jquery.tagsinput.min.css">
    <link href="${pageContext.request.contextPath }/css/manager/style.css" rel="stylesheet">
    <!--时间选择插件-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/js/manager/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css">
    <!--日期选择插件-->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/js/manager/bootstrap-datepicker/bootstrap-datepicker3.min.css">
</head>

<body>
<!--页面主要内容-->
<main class="ftdms-layout-content">

    <div class="container-fluid" style="margin-bottom:90px;">

        <div class="row" style="margin-top:15px;">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">

                        <form action="${pageContext.request.contextPath}/admin/addSingerServlet" method="post" class="row" enctype="multipart/form-data" onsubmit="return checkInput()">

                            <div class="form-group col-md-12">
                                <label for="name">姓名</label>
                                <input type="text" class="form-control" id="name" name="name" value="" placeholder="请输入歌手姓名" />
                            </div>
                            <div class="form-group col-md-12">
                                <label for="englishName">英文名（或者是姓名的大写全拼）</label>
                                <input type="text" class="form-control" id="englishName" name="englishName" value="" placeholder="请输入歌手姓名" />
                            </div>
                            <div class="form-group col-md-12">
                                <label for="sex">性别</label>
                                <div class="form-controls">
                                    <select name="sex" class="form-control" id="sex">
                                        <option value="1">男</option>
                                        <option value="0">女</option>
                                        <option value="2">组合</option>
                                        <option value="3">未知</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="birth">生日</label>
                                <input class="form-control js-datetimepicker" type="text" id="birth" name="birth" placeholder="请选择生日的具体时间" value="" data-side-by-side="true" data-locale="zh-cn" data-format="YYYY-MM-DD" />
                            </div>
                            <div class="form-group col-md-12">
                                <label for="location">地区</label>
                                <input type="text" class="form-control" id="location" name="location" value="" placeholder="地区" />
                            </div>
                            <div class="form-group col-md-12">
                                <label for="introduction">简介</label>
                                <textarea class="form-control" id="introduction" name="introduction" rows="5" value="" placeholder="描述"></textarea>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="musicImg" class="control-label">歌手头像：</label>
                                <input type="file" id="musicImg" name="musicImg">
                            </div>

<%--                            <div class="form-group col-md-12">--%>
<%--                                <label>头像</label>--%>
<%--                                <div class="form-controls">--%>
<%--                                    <ul class="list-inline clearfix ftdms-uploads-pic">--%>
<%--                                        <li class="col-xs-4 col-sm-3 col-md-2">--%>
<%--                                            <figure>--%>
<%--                                                <img src="${pageContext.request.contextPath }/img/img-1.jpg" alt="图片一">--%>
<%--                                                <figcaption>--%>
<%--                                                    <a class="btn btn-round btn-square btn-primary" href="#"><i class="ftsucai-eye-7"></i></a>--%>
<%--                                                    <a class="btn btn-round btn-square btn-danger" href="#"><i class="ftsucai-del"></i></a>--%>
<%--                                                </figcaption>--%>
<%--                                            </figure>--%>
<%--                                        </li>--%>
<%--                                        <li class="col-xs-4 col-sm-3 col-md-2">--%>
<%--                                            <figure>--%>
<%--                                                <img src="${pageContext.request.contextPath }/img/img-2.jpg" alt="图片二">--%>
<%--                                                <figcaption>--%>
<%--                                                    <a class="btn btn-round btn-square btn-primary" href="#"><i class="ftsucai-eye-7"></i></a>--%>
<%--                                                    <a class="btn btn-round btn-square btn-danger" href="#"><i class="ftsucai-del"></i></a>--%>
<%--                                                </figcaption>--%>
<%--                                            </figure>--%>
<%--                                        </li>--%>
<%--                                        <li class="col-xs-4 col-sm-3 col-md-2">--%>
<%--                                            <figure>--%>
<%--                                                <img src="${pageContext.request.contextPath }/img/img-3.jpg" alt="图片三">--%>
<%--                                                <figcaption>--%>
<%--                                                    <a class="btn btn-round btn-square btn-primary" href="#"><i class="ftsucai-eye-7"></i></a>--%>
<%--                                                    <a class="btn btn-round btn-square btn-danger" href="#"><i class="ftsucai-del"></i></a>--%>
<%--                                                </figcaption>--%>
<%--                                            </figure>--%>
<%--                                        </li>--%>
<%--                                        <li class="col-xs-4 col-sm-3 col-md-2">--%>
<%--                                            <a class="pic-add" id="add-pic-btn" href="#" title="点击上传"></a>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                            <div class="form-group col-md-12">
                                <label for="debutDate">出道日期</label>
                                <input class="form-control js-datetimepicker" type="text" id="debutDate" name="debutDate" placeholder="请选择出道日期" value="" data-side-by-side="true" data-locale="zh-cn" data-format="YYYY-MM-DD" />
                            </div>
                            <div class="form-group col-md-12">
                                <label for="accessCount">初始热度</label>
                                <input type="text" class="form-control" id="accessCount" name="accessCount" value="0" />
                            </div>
                            <div class="form-group col-md-12">
                                <button type="submit" class="btn btn-primary ajax-post" target-form="add-form">确 定</button>
                                <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/manager/perfect-scrollbar.min.js"></script>
<!--标签插件-->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/manager/jquery-tags-input/jquery.tagsinput.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/manager/main.min.js"></script>
<!--时间选择插件-->
<script src="${pageContext.request.contextPath }/js/manager/bootstrap-datetimepicker/moment.min.js"></script>
<script src="${pageContext.request.contextPath }/js/manager/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
<%--<script src="${pageContext.request.contextPath }/js/manager/bootstrap-datetimepicker/locale/zh-cn.js"></script>--%>
<!--日期选择插件-->
<script src="${pageContext.request.contextPath }/js/manager/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<%--<script src="${pageContext.request.contextPath }/js/manager/bootstrap-datepicker/locales/bootstrap-datepicker.zh-CN.min.js"></script>--%>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/manager/main.min.js"></script>
<script type="text/javascript">
    !function(a){
        a.fn.datepicker.dates["zh-CN"]={
            days:["星期日","星期一","星期二","星期三","星期四","星期五","星期六"],
            daysShort:["周日","周一","周二","周三","周四","周五","周六"],
            daysMin:["日","一","二","三","四","五","六"],
            months:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],
            monthsShort:["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"],
            today:"今日",clear:"清除",format:"yyyy年mm月dd日",titleFormat:"yyyy年mm月",weekStart:1
        }
    }(jQuery);

    (function (global, factory) {
        typeof exports === 'object' && typeof module !== 'undefined' ? factory(require('../moment')) :
            typeof define === 'function' && define.amd ? define(['moment'], factory) :
                factory(global.moment)
    }(this, function (moment) { 'use strict';

        var zh_cn = moment.defineLocale('zh-cn', {
            months : '一月_二月_三月_四月_五月_六月_七月_八月_九月_十月_十一月_十二月'.split('_'),
            monthsShort : '1月_2月_3月_4月_5月_6月_7月_8月_9月_10月_11月_12月'.split('_'),
            weekdays : '星期日_星期一_星期二_星期三_星期四_星期五_星期六'.split('_'),
            weekdaysShort : '周日_周一_周二_周三_周四_周五_周六'.split('_'),
            weekdaysMin : '日_一_二_三_四_五_六'.split('_'),
            longDateFormat : {
                LT : 'Ah点mm分',
                LTS : 'Ah点m分s秒',
                L : 'YYYY-MM-DD',
                LL : 'YYYY年MMMD日',
                LLL : 'YYYY年MMMD日Ah点mm分',
                LLLL : 'YYYY年MMMD日ddddAh点mm分',
                l : 'YYYY-MM-DD',
                ll : 'YYYY年MMMD日',
                lll : 'YYYY年MMMD日Ah点mm分',
                llll : 'YYYY年MMMD日ddddAh点mm分'
            },
            meridiemParse: /凌晨|早上|上午|中午|下午|晚上/,
            meridiemHour: function (hour, meridiem) {
                if (hour === 12) {
                    hour = 0;
                }
                if (meridiem === '凌晨' || meridiem === '早上' ||
                    meridiem === '上午') {
                    return hour;
                } else if (meridiem === '下午' || meridiem === '晚上') {
                    return hour + 12;
                } else {
                    // '中午'
                    return hour >= 11 ? hour : hour + 12;
                }
            },
            meridiem : function (hour, minute, isLower) {
                var hm = hour * 100 + minute;
                if (hm < 600) {
                    return '凌晨';
                } else if (hm < 900) {
                    return '早上';
                } else if (hm < 1130) {
                    return '上午';
                } else if (hm < 1230) {
                    return '中午';
                } else if (hm < 1800) {
                    return '下午';
                } else {
                    return '晚上';
                }
            },
            calendar : {
                sameDay : function () {
                    return this.minutes() === 0 ? '[今天]Ah[点整]' : '[今天]LT';
                },
                nextDay : function () {
                    return this.minutes() === 0 ? '[明天]Ah[点整]' : '[明天]LT';
                },
                lastDay : function () {
                    return this.minutes() === 0 ? '[昨天]Ah[点整]' : '[昨天]LT';
                },
                nextWeek : function () {
                    var startOfWeek, prefix;
                    startOfWeek = moment().startOf('week');
                    prefix = this.unix() - startOfWeek.unix() >= 7 * 24 * 3600 ? '[下]' : '[本]';
                    return this.minutes() === 0 ? prefix + 'dddAh点整' : prefix + 'dddAh点mm';
                },
                lastWeek : function () {
                    var startOfWeek, prefix;
                    startOfWeek = moment().startOf('week');
                    prefix = this.unix() < startOfWeek.unix()  ? '[上]' : '[本]';
                    return this.minutes() === 0 ? prefix + 'dddAh点整' : prefix + 'dddAh点mm';
                },
                sameElse : 'LL'
            },
            ordinalParse: /\d{1,2}(日|月|周)/,
            ordinal : function (number, period) {
                switch (period) {
                    case 'd':
                    case 'D':
                    case 'DDD':
                        return number + '日';
                    case 'M':
                        return number + '月';
                    case 'w':
                    case 'W':
                        return number + '周';
                    default:
                        return number;
                }
            },
            relativeTime : {
                future : '%s内',
                past : '%s前',
                s : '几秒',
                m : '1 分钟',
                mm : '%d 分钟',
                h : '1 小时',
                hh : '%d 小时',
                d : '1 天',
                dd : '%d 天',
                M : '1 个月',
                MM : '%d 个月',
                y : '1 年',
                yy : '%d 年'
            },
            week : {
                // GB/T 7408-1994《数据元和交换格式·信息交换·日期和时间表示法》与ISO 8601:1988等效
                dow : 1, // Monday is the first day of the week.
                doy : 4  // The week that contains Jan 4th is the first week of the year.
            }
        });

        return zh_cn;

    }));
</script>

<script type="text/javascript">

    function checkInput() {
        tips.loading("show");
        var name = $("#name").val();
        var birth = $("#birth").val();
        var location = $("#location").val();
        var debutDate = $("#debutDate").val();
        var englishName = $("#englishName").val();
        var englishNameReg = /^[A-Z]+$/;
        var accessCountStr = $("#accessCount").val();
        var reg = /^\d+$/;
        if(!reg.test(accessCountStr)){
            tips.loading("hide");
            tips.notify('歌手热度必须为非负整数~', 'danger', 100);
            return false;
        }
        var accessCount = Number.parseInt(accessCountStr);

        if (name == null || name == "") {
            tips.loading("hide");
            tips.notify('歌手名字不能为空~', 'danger', 100);
            return false;
        }
        if (englishName == null || englishName == "") {
            tips.loading("hide");
            tips.notify('歌手英文名字不能为空~', 'danger', 100);
            return false;
        }
        if (englishNameReg.test(englishName)) {
            tips.loading("hide");
            tips.notify('歌手英文名字必须全部为大写字母~', 'danger', 100);
            return false;
        }
        if (birth == null || birth == "") {
            tips.loading("hide");
            tips.notify('生日不能为空~', 'danger', 100);
            return false;
        }
        if (location == null || location == "") {
            tips.loading("hide");
            tips.notify('歌手地区不能为空~', 'danger', 100);
            return false;
        }
        if (debutDate == null || debutDate == "") {
            tips.loading("hide");
            tips.notify('出道日期不能为空~', 'danger', 100);
            return false;
        }
        if (accessCount < 0 || accessCount > 5000) {
            tips.loading("hide");
            tips.notify('歌手初始热度不能低于0，且不能超过5000~', 'danger', 100);
            return false;
        }
        return true;
    }

</script>
</body>
</html>
