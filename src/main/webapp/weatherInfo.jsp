<%--
  Created by IntelliJ IDEA.
  User: ZXJ
  Date: 2018/12/20
  Time: 19:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="http://analyse.weather.com.cn/js/v1/wa.js?site_id=1"></script>
    <script type="text/javascript" async="" charset="utf-8" src="https://c.cnzz.com/core.php?web_id=1257969847&amp;t=z"></script>
    <link rel="dns-prefetch" href="http://i.tq121.com.cn">
    <link href="http://i.tq121.com.cn/c/weather2017/headStyle_1.css" rel="stylesheet">
    <link href="http://i.tq121.com.cn/c/weather2015/common.css?20171" rel="stylesheet" type="text/css">
    <link href="http://i.tq121.com.cn/c/weather2015/bluesky/c_7d.css?v=20170407" rel="stylesheet" type="text/css">
    <title>Title</title>
</head>
<body>
<div class="left fl">

    <div id="7d" class="c7d">
        <input type="hidden" id="hidden_title" value="12月20日20时 周四  阴  7/15°C">
        <input type="hidden" id="fc_24h_internal_update_time" value="2018122020">
        <input type="hidden" id="update_time" value="18:00">
        <ul class="t clearfix">
            <c:forEach var="weather" items="${list}">
                <li class="sky skyid lv3">
                    <h1>${weather.date}</h1>
                    <big class="png40"></big>
                    <big class="png40 n02"></big>
                    <p title="阴" class="wea">${weather.weather}</p>
                    <p class="tem">
                        <i>${weather.temperature}℃</i>
                    </p>
                    <p class="win">
                        <em>
                            <span title="无持续风向" class="NNW"></span>
                        </em>
                        <i>&lt;3级</i>
                    </p>
                    <div class="slid"></div>
                </li>
            </c:forEach>
        </ul>
        <i class="line1"></i>

        <div class="btn">
            <em class="on">分时段预报</em>
            <em>生活指数</em>

            <!--<p id="fb_sub" class="fb_sub">报告蓝天</p>-->
            <div class="r">
                <span class="tit">蓝天预报</span>
                <i id="sky-on" class="turn">
                    <i></i>
                </i>
                <!--<i class="icon"></i>-->
                <div class="skypop">
                    <h3>蓝天预报综合天气现象、能见度、空气质量等因子，预测未来一周的天空状况。</h3>
                    <ul>
                        <li class="lv1">
                            <em></em><span>天空蔚蓝</span>
                            <b>可见透彻蓝天，或有蓝天白云美景。</b>
                        </li>
                        <li class="lv2">
                            <em></em><span>天空淡蓝</span>
                            <b>天空不够清澈，以浅蓝色为主。</b>
                        </li>
                        <li class="lv3">
                            <em></em><span>天空阴沉</span>
                            <b>阴天或有雨雪，天空灰暗。</b>
                        </li>
                        <li class="lv4">
                            <em></em><span>天空灰霾</span>
                            <b>出现霾或沙尘，天空灰蒙浑浊。</b>
                        </li>
                    </ul>
                    <i class="s"></i>
                </div>
            </div>


        </div>

        </ul>
    </div>
    <div style="margin: auto">
        <img src="http://img.pptjia.com/image/20180117/f4b76385a3ccdbac48893cc6418806d5.jpg" width="98%"> </img>
    </div>
</div>
</body>
</html>
