<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/12/20
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>酒店列表</title>
    <style>
        #a{
            background: #4affee;
            border-style:solid;
            border-color:red;
        }
        .t
        {
            float:left;
            width:210px;
            height:130px;
            margin:5px;
        }

    </style>
</head>
<!-- Main CSS-->
<link rel="stylesheet" type="text/css" href="css/main.css">
<!-- Font-icon css-->
<link rel="stylesheet" type="text/css"
      href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<%--表格控件css--%>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/bootstrap-table.min.css">
<%--时间控件css--%>
<link rel="stylesheet"
      href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css">
<body>
<h3>酒店列表</h3>
<c:forEach var="hotel" items="${list}">
    <div class="per_result">

        <div id="a" class="result_intro">
            <img src="img\1.JPG" class="t">
            <dl class="view_name per_intro">
                <dt>酒店名：</dt>
                <dd>${hotel.name}</dd>
                <dt>酒店价格：</dt>
                <dd>${hotel.price}</dd>
                <dt>酒店地址：</dt>
                <dd>${hotel.address}</dd>
            <dl class="view_name per_intro">
            <dt>酒店简介：</dt>
            <dd>${hotel.info}</dd>
            </dl>
        </div>

    </div>
</c:forEach>

</body>
</html>
