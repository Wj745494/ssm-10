<%--
  Created by IntelliJ IDEA.
  User: wcl
  Date: 2018/12/18
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>国内游</title>
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
</head>
<body>
    </br>
    </br>
    <button id="btnAdd" class="btn-info" type="button">新增</button>
    <table id="table" class="table"></table>
    <%--添加模态框开始--%>
    <div class="modal fade" id="addModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <%--模态框头部--%>
                <div class="modal-header">
                    <h4 class="modal-title">添加用户</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <%--模态框主体--%>
                <div class="modal-body">
                    <form id="addForm">
                        <div class="form-group">
                            <label class="control-label">风景点名称</label>
                            <input id="name" name="name" class="form-control" type="text" placeholder="">
                        </div>
                        <div class="form-group">
                            <label class="control-label">具体描述</label>
                            <input id="context" name="context" class="form-control" type="text" placeholder="">
                        </div>
                        <div class="form-group">
                            <label class="control-label">添加日期</label>
                            <input id="date" name="date" class="form-control" type="text" placeholder="">
                        </div>
                    </form>
                </div>
                <%--模态框底部--%>
                <div class="modal-footer">
                    <button id="btnAddCommit" type="button" class="btn btn-primary">提交</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
    <%--添加模态框结束--%>
    <%--编辑模态框开始--%>
    <div class="modal fade" id="editModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <%--模态框头部--%>
                <div class="modal-header">
                    <h4 class="modal-title">编辑用户</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <%--模态框主体--%>
                <div class="modal-body">
                    <form id="editForm">
                        <input type="hidden" name="aid"/>
                        <div class="form-group">
                            <label class="control-label">风景点名称</label>
                            <input name="name" class="form-control" type="text" placeholder="">
                        </div>
                        <div class="form-group">
                            <label class="control-label">具体描述</label>
                            <input class="form-control" type="text" name="context">
                        </div>
                        <div class="form-group">
                            <label class="control-label">添加日期</label>
                            <input class="form-control" type="text" name="date">
                        </div>
                    </form>
                </div>
                <%--模态框底部--%>
                <div class="modal-footer">
                    <button id="btnEditCommit" type="button" class="btn btn-primary">更改</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
    <%--编辑模态框结束--%>
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

    <script type="text/javascript">
        //转换日期格式(时间戳毫秒数转换为datetime格式)
        function changeDateFormat(cellval) {
            var dateVal = cellval + "";
            if (cellval != null) {
                var date = new Date(parseInt(dateVal.replace("/Date(", "").replace(")/", ""), 10));
                var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
                var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();
                return date.getFullYear() + "-" + month + "-" + currentDate;
            }
        }
        function addOperFunction(){
            return[
                '&ensp;&ensp;&ensp;&ensp;<button id="btnEdit" class="btn-dark" type="button">编辑</button> &ensp;&ensp;&ensp;&ensp;',
                '<button id="btnDelete" class="badge-danger" type="button">删除</button>'
            ].join("");
        }
        //操作按钮事件
        window.operateEvents = {
            "click #btnEdit": function (e, value, row, index) {
                $.get(
                    'addAion/' + row.aid,
                    function (data) {
                        $('#editForm [name=name]').val(data.name);
                        $('#editForm [name=date]').val(changeDateFormat(data.date));
                        //$('#editForm [type=radio][value='+data.sex+']').attr("checked",true);
                        $('#editForm [name=context]').val(data.context);
                        $('#editForm [name=aid]').val(data.aid);
                    },
                    'json'
                );
                var dialog = $('#editModal').modal({
                    backdrop: 'static',
                    keyboard: false
                });
                dialog.modal('show');
            },
            "click #btnDelete": function (e, value, row, index) {
               console.log(row);
                $.post(
                    'addAion/' + row.aid,
                    {'_method': 'DELETE'},
                    function (data) {
                        if (data > 0) {
                            $('#table').bootstrapTable(('refresh'),{pageNumber:1});
                        }
                    }
                );
            }
        };
        $(function () {
            $("#btnAdd").click(function () {
                var dialog = $('#addModal').modal({
                    backdrop: 'static',
                    keyboard: false
                });
                dialog.modal('show');
            });

        });

        $(function () {
            //初始化新增模态框日期控件
            $('#date').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn')
            });

            $('#table').bootstrapTable({
                url:'attractions',
                columns:[{
                    checkbox: true
                },{
                    //列属性
                    field:'aid',
                    title:'编号'
                },{
                    field:'name',
                    title:'风景点名称'
                },{
                    field:'context',
                    title:'具体描述'
                },{
                    field:'date',
                    title:'添加时间',
                    formatter: function (value) {
                        return changeDateFormat(value);
                    }
                },{ field: 'button', title: '操作', formatter: addOperFunction,
                    events: operateEvents }],
                method:'post',
                search: true,
                searchOnEnterKey: true,
                pageNumber: 1,
                pageSize: 6,
                pagination: true,
                sidePagination: 'server'
            });
            $("#btnAddCommit").click(function () {
                $.post(
                    'addAion',
                    $("#addForm").serialize(),
                    function (data) {
                        $('#addModal').modal('hide');
                        if (data > 0) {
                            $('#table').bootstrapTable(('refresh'));
                        }
                    }
                );
            });
            $("#btnEditCommit").click(function(){
                $.ajax({
                    url: 'addAion',
                    data: $("#editForm").serialize(),
                    type: 'PUT',
                    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
                    success: function (data) {
                        $('#editModal').modal('hide');
                        if (data > 0) {
                            $('#table').bootstrapTable(('refresh'));
                        }
                    }
                });
            });
        });
    </script>
</body>
</html>
