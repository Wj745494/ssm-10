<%--
  Created by IntelliJ IDEA.
  User: wcl
  Date: 2018/12/19
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>首页</title>
    <style>
        #nav_ul li {
            display: inline;
        }

        #cnt li {
            display: inline;
            margin-left: 70px
        }

        #nav_ul li a {
            text-decoration: none;
            padding-left: 120px;
        }

        #nav_ul li a:link {
            color: black;
        }

        #mv img{
            display: inline;
        }
        #imgs {
            float: left;
            text-align: center;
            margin-left: 50px;
        }
        a {
            text-decoration: none;
        }
    </style>
    <script>
        var i=1;
        window.onload = function(){
            setInterval(lb,3000);

        }
        function lb(){
            var lbt = document.getElementById("1bt");
            i++;
            //debugger;
            if(i==4){
                i=1;

            }
            lbt.src="img/b"+i+".jpeg";
        }

    </script>
</head>
<body>
<table width="850px" align="center"  cellpadding="0px" cellspacing="0px">
    <!--top:logo-->
    <tr>
        <td>
            <table width="100%"  cellpadding="0px" cellspacing="0px">
                <tr>
                    <!--logo-->
                    <td id="logo">
                        <img src="img/6.jpg" height="33px" width="150px"  />
                    </td>
                    <!--登录和注册按钮-->
                    <td width="80%" align="right">
                        <a href="#">登录</a>
                        <a href="#"> 注册</a>
                    </td>
                </tr>

            </table>

        </td>

    </tr>
    <!--banner-->
    <tr>
        <td>
            <img id="1bt" width="100%" height="278.47px" src="img/b1.jpeg" />
        </td>
    </tr>
    <!--菜单栏-->
    <tr bgcolor="gainsboro">
        <td>
            <ul id="nav_ul">
                <li>
                    <a href="#">首页</a>
                </li>
                <li>
                    <a href="#">目的地</a>
                </li>
                <li>
                    <a href="#">旅游攻略</a>
                </li>
                <li>
                    <a href="#">社区</a>
                </li>
            </ul>

        </td>

    </tr>
    <!---->
    <tr>
        <td>
            <div width="100%">

                <c:forEach items="${aions}" var="aions">

                        <div id="imgs" width="25%" style="margin-top: 10px;">
                            <img style="border-radius: 6px"  src="${pageContext.request.contextPath }/img/4.jpeg" />
                            <p style="width: 200px">${aions.name}</p>
                        </div>

                </c:forEach>
            </div>

        </td>

    </tr>

    <!--关于我们-->
    <tr>
        <td align="center">
            <ul id="cnt"style="margin-top: 20px;padding-left: 0px;padding-bottom: 20px" >
                <li >关于我们</li>
                <li >联系我们</li>
                <li >加入我们</li>
                <li >成为我们</li>
                <li >投诉我们</li>
            </ul>
        </td>
    </tr>
    <!--版权信息-->
    <tr>
        <td align="center">
            &copy;JavaEE1806版权所有 备案号ISPN18239A
        </td>
    </tr>
</table>
</body>
<script>
    function fn(){
        location.href="login.html";
    }
</script>
</html>