<%--
  Created by IntelliJ IDEA.
  User: ZXJ
  Date: 2018/12/20
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <!-- Title and other stuffs -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="">
    <!-- Stylesheets -->
    <link href="style/bootstrap.css" rel="stylesheet">
    <!-- Font awesome icon -->
    <link rel="stylesheet" href="style/font-awesome.css">
    <!-- jQuery UI -->
    <link rel="stylesheet" href="style/jquery-ui.css">
    <!-- Calendar -->
    <link rel="stylesheet" href="style/fullcalendar.css">
    <!-- prettyPhoto -->
    <link rel="stylesheet" href="style/prettyPhoto.css">
    <!-- Star rating -->
    <link rel="stylesheet" href="style/rateit.css">
    <!-- Date picker -->
    <link rel="stylesheet" href="style/bootstrap-datetimepicker.min.css">
    <!-- CLEditor -->
    <link rel="stylesheet" href="style/jquery.cleditor.css">
    <!-- Uniform -->
    <link rel="stylesheet" href="style/uniform.default.css">
    <!-- Bootstrap toggle -->
    <link rel="stylesheet" href="style/bootstrap-switch.css">
    <!-- Main stylesheet -->
    <link href="style/style.css" rel="stylesheet">
    <!-- Widgets stylesheet -->
    <link href="style/widgets.css" rel="stylesheet">

    <!-- HTML5 Support for IE -->
    <!--[if lt IE 9]>
    <script src="js/html5shim.js"></script>
    <![endif]-->

    <!-- Favicon -->
    <link rel="shortcut icon" href="img/favicon/favicon.png">
    <%--jquery库--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <%--bootstrap库--%>
    <script src="js\bootstrap.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.2/bootstrap-table.min.js"></script>

    <!-- Latest compiled and minified Locales -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.2/locale/bootstrap-table-zh-CN.min.js"></script>
    <%--时间控件js--%>
    <script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>
    <%--时间控件库--%>
    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
    <title>主页面</title>
</head>

<frameset rows="15%,85%" noresize="noresize">
    <frame src="top.jsp" />
    <frameset cols="18%,82%">
        <frame src="left.jsp" />
        <frame name="right" src="index.jsp"/>
    </frameset>
</frameset>

</html>
