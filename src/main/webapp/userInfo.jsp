<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/20
  Time: 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<body>

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <nav class="navbar navbar-default" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">Brand</a>
                </div>


               <%-- 导航条--%>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="#">更多</a>
                        </li>
                        <li>
                            <a href="#">关于我们</a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">选择<strong class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#">活动</a>
                                </li>
                                <li>
                                    <a href="#">活动地址</a>
                                </li>
                                <li>
                                    <a href="#">其它</a>
                                </li>
                                <li class="divider">
                                </li>
                                <li>
                                    <a href="#">链接</a>
                                </li>
                                <li class="divider">
                                </li>
                                <li>
                                    <a href="#">一些有趣的事情</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <form class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" />
                        </div> <button type="submit" class="btn btn-default">搜索</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#">链接关于我们</a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">下拉选项<strong class="caret"></strong></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="#">1</a>
                                </li>
                                <li>
                                    <a href="#">2</a>
                                </li>
                                <li>
                                    <a href="#">3</a>
                                </li>
                                <li class="divider">
                                </li>
                                <li>
                                    <a href="#">产品链接</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>

            <div class="jumbotron">
                <h1>
                   用户心得分享
                </h1>
                <p>
                    世界那么大，我想要去看看。谈起旅游你有什么样的看法或者是想法呢？相信很多人都去过旅游，不管是比较大型的旅游，还是一个人的旅游，但是不管是什么样的旅游，你去旅游过了那么多次，你真正明白了什么是旅游吗？关于旅游你又知道多少。
                    旅游在很多人的眼里或者是多数人的眼里就是当你在暑假或者是寒假有时间，
                    还有就是在平时攒的钱了之后，在你有时间的时候出去玩乐的。
                    但是这样的旅游并没有任何意义，其实旅游有很大的好处和作用，
                    他可以丰富你人生的阅历，开阔你的眼界，让你更好的了解外面的世界，
                    更好的融入世界。然而在我认为的旅游就是去了解外面的世界，不断地开阔自己的眼界，
                    当然也可以去放松自己，体验生活，但更多的不是有一大部分人的那种上车就睡觉，
                    下车拍照的那种旅游，那样的旅游毫无意义和价值。
                </p>
                <p>
                    <a class="btn btn-primary btn-large" href="#">学习更多</a>
                </p>
            </div>

            <div class="container">
                <div class="row clearfix">
                    <div class="col-md-12 column">

            <table class="table table-striped" >


                <tr >
                    <th>姓名</th>
                    <th>性别</th>
                    <th>职业</th>
                    <th>爱好的风景</th>

                </tr>
                <c:forEach items="${list}" var="user">
                    <tr>
                        <th class="info">${user.username }</th>
                        <th class="warning">${user.sex}</th>
                        <th class="info">${user.professional }</th>
                        <th class="success">${user.love}</th>
                    </tr>
                </c:forEach>
            </table>
             </div>
                </div>
         </div>
        </div>
    </div>

    </div>
<div align="center" style="margin-top: 10px" >
    跳转：<input type="text" value="" id="currentPage" onblur="goC();">当前页：${page.pageNum }/${page.pages }
    <a href="${pageContext.request.contextPath }/userList?currentPage=1">首页</a>
    <c:if test="${page.hasPreviousPage}">
        <a href="${pageContext.request.contextPath }/userList?currentPage=${page.prePage}">上一页</a>
    </c:if>
    <c:forEach items="${page.navigatepageNums }" var="index">
        <c:choose>
            <c:when test="${page.pageNum==index }">
                <a style="color:black;" href="${pageContext.request.contextPath }/userList?currentPage=${index}">第${index}页</a>
            </c:when>
            <c:otherwise>
                <a style="color:pink;" href="${pageContext.request.contextPath }/userList?currentPage=${index}">第${index}页</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${page.hasNextPage }">
        <a href="${pageContext.request.contextPath }/userList?currentPage=${page.nextPage}">下一页</a>
    </c:if>
    <a href="${pageContext.request.contextPath }/userList?currentPage=${page.pages}">尾页</a>
    总个数：${page.total };
</div>
</body>

<script type="text/javascript">
    function goC(){
        var a=document.getElementById("currentPage").value;
        if(a!=''){
            window.location.href="${pageContext.request.contextPath }/userList?currentPage="+a;
        }
    }
</script>
</html>
