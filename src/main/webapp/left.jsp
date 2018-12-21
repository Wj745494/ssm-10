<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/17
  Time: 16:49
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
    <title>Title</title>
</head>
<body>
    <div class="sidebar">
        <div class="sidebar-dropdown"><a href="#">导航</a></div>

        <!--- Sidebar navigation -->
        <!-- If the main navigation has sub navigation, then add the class "has_sub" to "li" of main navigation. -->
        <ul id="nav">
            <!-- Main menu with font awesome icon -->
            <li><a href="#" class="open"><i class="icon-home"></i> 首页</a>
                <!-- Sub menu markup
                <ul>
                  <li><a href="#">Submenu #1</a></li>
                  <li><a href="#">Submenu #2</a></li>
                  <li><a href="#">Submenu #3</a></li>
                </ul>-->
            </li>
            <li class="has_sub"><a href="#"><i class="icon-list-alt"></i>后台管理<span class="pull-right"><i class="icon-chevron-right"></i></span></a>
                <ul>
                    <li><a href="weather.jsp" target="right">查看一号学弟</a></li>
                    <li><a href="attractions.jsp" target="right">查看二号学弟</a></li>
                    <li><a href="hotellist.jsp" target="right">查看三号学弟</a></li>
                    <li><a href="ordersList.jsp" target="right">查看四号学弟</a></li>
                    <li><a href="${pageContext.request.contextPath}/list.jsp" target="right">查看五号学弟</a></li>
                </ul>
            </li>
            <li class="has_sub"><a href="#"><i class="icon-file-alt"></i> 前台查看 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
                <ul>
                    <li><a href="toWeather" target="right">查看一号学弟</a></li>
                    <li><a href="showList" target="right">查看二号学弟</a></li>
                    <li><a href="queryHotel" target="right">查看三号学弟</a></li>
                    <li><a href="orderByPage?currentPage=1" target="right">查看四号学弟</a></li>
                    <li><a href="${pageContext.request.contextPath}/userList?currentPage=1" target="right">查看五号学弟</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>

<script src="js/jquery.js"></script> <!-- jQuery -->
<script src="js/bootstrap.js"></script> <!-- Bootstrap -->
<script src="js/jquery-ui-1.9.2.custom.min.js"></script> <!-- jQuery UI -->
<script src="js/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->
<script src="js/jquery.rateit.min.js"></script> <!-- RateIt - Star rating -->
<script src="js/jquery.prettyPhoto.js"></script> <!-- prettyPhoto -->

<script src="js/excanvas.min.js"></script>
<script src="js/jquery.flot.js"></script>
<script src="js/jquery.flot.resize.js"></script>
<script src="js/jquery.flot.pie.js"></script>
<script src="js/jquery.flot.stack.js"></script>


<script src="js/jquery.noty.js"></script> <!-- jQuery Notify -->
<script src="js/themes/default.js"></script> <!-- jQuery Notify -->
<script src="js/layouts/bottom.js"></script> <!-- jQuery Notify -->
<script src="js/layouts/topRight.js"></script> <!-- jQuery Notify -->
<script src="js/layouts/top.js"></script> <!-- jQuery Notify -->


<script src="js/sparklines.js"></script> <!-- Sparklines -->
<script src="js/jquery.cleditor.min.js"></script> <!-- CLEditor -->
<script src="js/bootstrap-datetimepicker.min.js"></script> <!-- Date picker -->
<script src="js/jquery.uniform.min.js"></script> <!-- jQuery Uniform -->
<script src="js/bootstrap-switch.min.js"></script> <!-- Bootstrap Toggle -->
<script src="js/filter.js"></script> <!-- Filter for support page -->
<script src="js/custom.js"></script> <!-- Custom codes -->
<script src="js/charts.js"></script> <!-- Charts & Graphs -->
    <script type="text/javascript">
        $(function () {

            /* Bar Chart starts */

            var d1 = [];
            for (var i = 0; i <= 20; i += 1)
                d1.push([i, parseInt(Math.random() * 30)]);

            var d2 = [];
            for (var i = 0; i <= 20; i += 1)
                d2.push([i, parseInt(Math.random() * 30)]);


            var stack = 0, bars = true, lines = false, steps = false;

            function plotWithOptions() {
                $.plot($("#bar-chart"), [ d1, d2 ], {
                    series: {
                        stack: stack,
                        lines: { show: lines, fill: true, steps: steps },
                        bars: { show: bars, barWidth: 0.8 }
                    },
                    grid: {
                        borderWidth: 0, hoverable: true, color: "#777"
                    },
                    colors: ["#ff6c24", "#ff2424"],
                    bars: {
                        show: true,
                        lineWidth: 0,
                        fill: true,
                        fillColor: { colors: [ { opacity: 0.9 }, { opacity: 0.8 } ] }
                    }
                });
            }

            plotWithOptions();

            $(".stackControls input").click(function (e) {
                e.preventDefault();
                stack = $(this).val() == "With stacking" ? true : null;
                plotWithOptions();
            });
            $(".graphControls input").click(function (e) {
                e.preventDefault();
                bars = $(this).val().indexOf("Bars") != -1;
                lines = $(this).val().indexOf("Lines") != -1;
                steps = $(this).val().indexOf("steps") != -1;
                plotWithOptions();
            });

            /* Bar chart ends */

        });


        /* Curve chart starts */

        $(function () {
            var sin = [], cos = [];
            for (var i = 0; i < 14; i += 0.5) {
                sin.push([i, Math.sin(i)]);
                cos.push([i, Math.cos(i)]);
            }

            var plot = $.plot($("#curve-chart"),
                [ { data: sin, label: "sin(x)"}, { data: cos, label: "cos(x)" } ], {
                    series: {
                        lines: { show: true, fill: true},
                        points: { show: true }
                    },
                    grid: { hoverable: true, clickable: true, borderWidth:0 },
                    yaxis: { min: -1.2, max: 1.2 },
                    colors: ["#1eafed", "#1eafed"]
                });

            function showTooltip(x, y, contents) {
                $('<div id="tooltip">' + contents + '</div>').css( {
                    position: 'absolute',
                    display: 'none',
                    top: y + 5,
                    left: x + 5,
                    border: '1px solid #000',
                    padding: '2px 8px',
                    color: '#ccc',
                    'background-color': '#000',
                    opacity: 0.9
                }).appendTo("body").fadeIn(200);
            }

            var previousPoint = null;
            $("#curve-chart").bind("plothover", function (event, pos, item) {
                $("#x").text(pos.x.toFixed(2));
                $("#y").text(pos.y.toFixed(2));

                if ($("#enableTooltip:checked").length > 0) {
                    if (item) {
                        if (previousPoint != item.dataIndex) {
                            previousPoint = item.dataIndex;

                            $("#tooltip").remove();
                            var x = item.datapoint[0].toFixed(2),
                                y = item.datapoint[1].toFixed(2);

                            showTooltip(item.pageX, item.pageY,
                                item.series.label + " of " + x + " = " + y);
                        }
                    }
                    else {
                        $("#tooltip").remove();
                        previousPoint = null;
                    }
                }
            });

            $("#curve-chart").bind("plotclick", function (event, pos, item) {
                if (item) {
                    $("#clickdata").text("You clicked point " + item.dataIndex + " in " + item.series.label + ".");
                    plot.highlight(item.series, item.datapoint);
                }
            });

        });


    </script>
</body>
</html>
