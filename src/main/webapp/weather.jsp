<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
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



    <title>天气表</title>
</head>
<body>

    <table id="table"></table>

    <div id="toolbar" class="btn-group">
        <button id="btn_add" type="button" class="btn btn-default" onclick="addWeatherTo();">
            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
        </button>
    </div>

    <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">编辑</h4>
                </div>
                <div class="modal-body">
                    <form action="weather" id="editForm" method="get">
                        <div class="form-group">
                            <label for="wid">序号</label>
                            <input type="text" class="form-control" id="wid" name="wid" disabled="disabled">
                        </div>
                        <div class="form-group">
                            <label for="date">时间</label>
                            <input type="text" class="form-control" id="date" name="date" placeholder="请输入名称">
                        </div>
                        <div class="form-group">
                            <label for="weather">天气</label>
                            <input type="text" class="form-control" id="weather"  name="weather" placeholder="请输入名称">
                        </div>
                        <div class="form-group">
                            <label for="temperature">温度</label>
                            <input type="text" class="form-control" id="temperature"  name="temperature" placeholder="请输入名称">
                        </div>
                        <%--<imput type="submit" class="btn btn-default">提交</imput>--%>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button id="btnEditCommit" type="submit" class="btn btn-primary" onclick="njec()" data-dismiss="modal">提交更改</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel1">添加</h4>
                </div>
                <div class="modal-body">
                    <form action="weather" id="addForm" method="get">
                        <div class="form-group">
                            <label for="wid1">序号</label>
                            <input type="text" class="form-control" id="wid1" name="wid" disabled="disabled">
                        </div>
                        <div class="form-group">
                            <label for="date1">时间</label>
                            <input type="text" class="form-control" id="date1" name="date" placeholder="2012-12-12">
                        </div>
                        <div class="form-group">
                            <label for="weather1">天气</label>
                            <input type="text" class="form-control" id="weather1"  name="weather" placeholder="请输入">
                        </div>
                        <div class="form-group">
                            <label for="temperature1">温度</label>
                            <input type="text" class="form-control" id="temperature1"  name="temperature" placeholder="请输入">
                        </div>
                        <%--<imput type="submit" class="btn btn-default">提交</imput>--%>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button id="btnAddCommit" type="submit" class="btn btn-primary" onclick="addWeather()" data-dismiss="modal">提交更改</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>


    <%--jquery库--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <%--bootstrap库--%>
    <script src="js/bootstrap.min.js"></script>
    <%--bootstrap-table库--%>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/bootstrap-table.min.js"></script>
    <%--bootstrap-table中文库--%>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.12.1/locale/bootstrap-table-zh-CN.min.js"></script>
    <%--时间控件js--%>
    <script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>
    <%--时间控件库--%>
    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>


    <script>
        $(function () {
            $('#table').bootstrapTable({
                url: 'weather',
                method: 'post',
                cache: false,
                pagination: true,
                sidePagination: 'server',
                pageNumber: 1,
                pageSize: 10,
                pageList: [2,3,5,7,10],
                search: true,
                searchOnEnterKey: true,
                showRefresh: true,
                toolbar: '#toolbar',
                columns: [{
                    checkbox: true
                }, {
                    field: 'wid',
                    title: '序号'
                }, {
                    field: 'date',
                    title: '时间'
                }, {
                    field: 'weather',
                    title: '天气'
                }, {
                    field: 'temperature',
                    title: '温度（℃）'
                }, {
                    field: 'button',
                    title: '操作',
                    formatter: operateFormatter,
                    events: operateEvents
                }],
            });

        });
        function operateFormatter(value, row, index) {
            return ['<button type="button" class="RoleOfedita btn btn-danger" style="margin-right:15px;">删除</button>',
                '<button type="button" class="RoleOfeditb btn btn-primary" style="margin-right:15px;">编辑</button>'
            ].join('')
        };
        window.operateEvents={'click .RoleOfeditb': function(e, v, r, i) {
            $('#editForm [name=wid]').val(r.wid);
            $('#editForm [name=date]').val(r.date);
            $('#editForm [name=weather]').val(r.weather);
            $('#editForm [name=temperature]').val(r.temperature);
            //将模态框显示出来
            var d = $('#editModal').modal({
                backdrop:'static',
                keyboard: false,
            });
                d.modal('show');
            },
        'click .RoleOfedita': function(e, v, r, i) {
                //alert(row.wid);
                var b = confirm("是否删除");
                if(!b){
                    return;
                }
                $(this).parents('tr').remove();
                $.post(
                    'weather/' + r.wid,
                    {'_method':'DELETE'},
                    function(data){
                        if(data > 0){
                            //删除成功之后回到第一页（刷新回第一页）
                            $('#table').bootstrapTable(('refresh'),{pageNumber:1});
                            alert('删除成功')
                        }
                    },
                    'json'
                );
                /*$.ajax({
                    url: 'remove',
                    type: 'post',
                    dataType: 'json',
                    data: {'wid':row.wid},
                    success: function (data) {
                        row.remove()
                    }
                })*/
            }};

        function addWeatherTo() {
            var d = $('#addModal').modal({
                backdrop:'static',
                keyboard: false,
            });
            d.modal('show');

        }

        function njec() {
            var wid=$('#editForm [name=wid]').val();
            var date=$('#editForm [name=date]').val();
            var weather=$('#editForm [name=weather]').val();
            var temperature=$('#editForm [name=temperature]').val();
            /*var arr=new Array(date,weather,temperature);*/
            $.ajax({
                url: 'weatherExit',
                type: 'post',
                data: {'wid':wid
                    ,'date':date
                    ,'weather':weather
                    ,'temperature':temperature
                },
                dataType: 'json',
                cache: false,
                success: function (data) {
                    if(data>0){
                        alert('修改成功');
                        $("#table").bootstrapTable('refresh')
                    }else {
                        alert('修改失败')
                    }
                },
                error: function () {
                    alert('请求异常')
                }
            });

        }

        function addWeather() {
            var date=$('#addModal [name=date]').val();
            var weather=$('#addModal [name=weather]').val();
            var temperature=$('#addModal [name=temperature]').val();
            /*var arr=new Array(date,weather,temperature);*/
            $.ajax({
                url: 'weatherAdd',
                type: 'post',
                data: {'date':date
                    ,'weather':weather
                    ,'temperature':temperature
                },
                dataType: 'json',
                cache: false,
                success: function (data) {
                    if(data>0){
                        alert('新增成功');
                        $("#table").bootstrapTable('refresh')
                    }else {
                        alert('新增失败')
                    }
                },
                error: function () {
                    alert('请求异常')
                }
            });

        }



    </script>
</html>
</body>

