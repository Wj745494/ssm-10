<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/20
  Time: 20:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta name="author" content="order by orders.com"/>
    <title>订单表</title>
    <link rel="stylesheet" type="text/css" href="file/css/style.css">
    <link rel="stylesheet" type="text/css" href="file/css/css.css" />
    <script type="text/javascript" src="file/js/jquery-1.7.2.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div id="top">
    <div id="top_main">
        <ul class="topu">
            <li>
                <div class="xing">
                </div>
                <a href="#">收藏商城</a>
            </li>
        </ul>
        <div id="hello">
					<span>您好，欢迎来到商城！
			<a href="login.html">[登陆]</a><a href="login.html">[免费注册]</a>
			</span>
        </div>
        <div class="topright">
            <ul>
                <li>
                    <div class="cun">
                        <a href="#">我的订单</a>
                    </div>
                </li>
                <li class="kefu">
                    <div class="cun">
                        <div class="a1">
                            <div class="kefuhide">
                                <span>客户服务</span>
                                <div class="downjian1">
                                </div>
                                <ul>
                                    <li><a href="#">帮助中心</a></li>
                                    <li><a href="#">售后服务</a></li>
                                    <li><a href="#">在线客服</a></li>
                                    <li><a href="#">投诉中心</a></li>
                                    <li><a href="#">客服邮箱</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="wangzhan">
                    <div class="cun">
                        <span>网站导航</span>
                        <div class="downjian1">
                        </div>
                    </div>
                    <div class="wangzhanhide">
                        <div class="tese">
                            <span>特色栏目</span>
                        </div>
                        <div class="tesemain">
                            <a href="#">商城通信</a>
                            <a href="#">校园之星</a>
                            <a href="#">视频购物</a>
                            <a href="#">商城社区</a>
                            <a href="#">在线读书</a>
                            <a href="#">装机大师</a>
                            <a href="#">商城E卡　</a>
                            <a href="#">家装城</a>
                            <a href="#">搭配购　</a>
                            <a href="#">我喜欢　</a>
                            <a href="#">游戏社区</a>
                        </div>
                        <div class="tese">
                            <span>企业服务</span>
                        </div>
                        <div class="tesemain1">
                            <a href="#">企业采购</a>
                            <a href="#">办公直通车</a>
                        </div>
                        <div class="tese">
                            <span>旗下网站</span>
                        </div>
                        <div class="tesemain2">
                            <a href="#">English Site</a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<!-- 搜索区域开始 -->
<div id="serach">
    <div class="logo">
        <a href="index.html">
            <img src="images/logo.png" alt="" /></a>
        <div class="dongtu">
        </div>
    </div>
    <div class="sou">
        <div class="sousuo">
            <input type="text" class="kuang" value="跨界" style="color:#999;font-size:14px" />
            <div class="souzi">
                <a href="#">搜索</a>
            </div>
        </div>
        <div class="reci">
            <span>热门搜索:</span>
            <a href="#" style="color:red">校园之星</a>
            <a href="#">影院到家</a>
            <a href="#">JD制暖节</a>
            <a href="#">腕表领券</a>
            <a href="#">自营满减</a>
            <a href="#">N3抢购</a>
            <a href="#">图书换购</a>
            <a href="#">12.12</a>
        </div>
    </div>
    <div class="myjd">
        <div class="mytu">
        </div>
        <a href="#">我的商城</a>
        <div class="jiantou">
        </div>
        <div class="myjdhide">
            <div class="hello">
                <span>您好，请</span>
                <a href="#">登录</a>
            </div>
            <div class="hey">
                <div class="heyleft">
                    <ul>
                        <li><a href="#">待处理订单</a></li>
                        <li><a href="#">咨询回复</a></li>
                        <li><a href="#">降价商品</a></li>
                        <li><a href="#">返修退换货</a></li>
                        <li><a href="#">优惠券</a></li>
                    </ul>
                </div>
                <div class="heyright">
                    <ul>
                        <li><a href="#">我的关注></a></li>
                        <li><a href="#">我的京豆></a></li>
                        <li><a href="#">我的理财></a></li>
                        <li><a href="#">我的白条></a></li>
                    </ul>
                </div>
            </div>
            <div class="hidebot">
                <div class="bottop">
                    <span>最近浏览的商品:</span>
                    <a href="#">查看浏览历史></a>
                </div>
                <div class="botdown">
                    <span>「暂无数据」</span>
                </div>
            </div>
        </div>
    </div>
    <div class="gouwuche">
        <div class="chetu">
        </div>
        <a href="#">去购物车结算</a>
        <div class="jianleft">
        </div>
        <div class="num">
            <div class="numright">
            </div>
            <div class="numzi">
                <span>0</span>
            </div>
        </div>
        <div class="hideche">
            <div class="kongche">
            </div>
            <span>购物车中还没有商品，赶紧选购吧！</span>
        </div>
    </div>
    <div class="jubao">
    </div>
</div>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">

            <table class="table table-striped" >

                <tr >
                    <th>订单编号</th>
                    <th>订单开始时间</th>
                    <th>订单结束时间</th>
                    <th>酒店名称</th>
                    <th>支付金额</th>

                </tr>
                <c:forEach items="${list}" var="os">
                    <tr>
                        <th >${os.id }</th>
                        <th >${os.startime}</th>
                        <th >${os.endtime }</th>
                        <th >${os.hotel}</th>
                        <th >${os.paymoney}</th>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>
</div>
</div>



<div align="center" style="margin-top: 10px" >
    跳转：<input type="text" value="" id="currentPage" onblur="goC();">当前页：${page.pageNum }/${page.pages }
    <a href="${pageContext.request.contextPath }/orderByPage?currentPage=1">首页</a>
    <c:if test="${page.hasPreviousPage}">
        <a href="${pageContext.request.contextPath }/orderByPage?currentPage=${page.prePage}">上一页</a>
    </c:if>
    <c:forEach items="${page.navigatepageNums }" var="index">
        <c:choose>
            <c:when test="${page.pageNum==index }">
                <a style="color:black;" href="${pageContext.request.contextPath }/orderByPage?currentPage=${index}">第${index}页</a>
            </c:when>
            <c:otherwise>
                <a style="color:pink;" href="${pageContext.request.contextPath }/orderByPage?currentPage=${index}">第${index}页</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${page.hasNextPage }">
        <a href="${pageContext.request.contextPath }/orderByPage?currentPage=${page.nextPage}">下一页</a>
    </c:if>
    <a href="${pageContext.request.contextPath }/orderByPage?currentPage=${page.pages}">尾页</a>
    总个数：${page.total };
</div>

<!-- 底部开始 -->
<div id="down">
    <div class="down_top">
        <a href="#">关于我们</a>
        <a href="#">联系我们</a>
        <a href="#">商家入驻</a>
        <a href="#">营销中心</a>
        <a href="#">手机商城</a>
        <a href="#">友情链接</a>
        <a href="#">销售联盟</a>
        <a href="#">商城社区</a>
        <a href="#">商城公益</a>
        <a href="#" style="border-right:none">English Site</a>
    </div>

    <div class="down_bot">
        <img src="file/images/bot1.gif" alt="" />
        <img src="file/images/bot2.gif" alt="" />
        <img src="file/images/bot3.png" alt="" />
        <img src="file/images/bot4.png" alt="" />
    </div>
</div>
</body>


<script type="text/javascript">
    function goC(){
        var a=document.getElementById("currentPage").value;
        if(a!=''){
            window.location.href="${pageContext.request.contextPath }/orderByPage?currentPage="+a;
        }
    }
</script>

</html>
