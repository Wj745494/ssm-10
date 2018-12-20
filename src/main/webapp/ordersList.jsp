<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/20
  Time: 17:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单管理</title>
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

<!-- 按钮触发模态框 -->
<button style="margin-top: 20px" class="btn btn-primary btn-sm" data-toggle="modal"  data-target="#addOrdersModal">
    添加订单
</button>

<form method="post" action="addOrders" class="form-horizontal" role="form" id="form_data" onsubmit="return check_form()" style="margin: 20px;">
    <div class="modal fade" id="addOrdersModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        订单信息
                    </h4>
                </div>
                <div class="modal-body">
                    <form   class="form-horizontal" role="form" >

                        <div class="form-group">
                            <label  class="col-sm-3 control-label">开始时间</label>
                            <div class="col-sm-9">
                                <input type="date" class="form-control" name="startime" id="startime" >

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">结束时间</label>
                            <div class="col-sm-9">
                                <input type="date" class="form-control" name="endtime"  id="endtime" >
                            </div>
                        </div>



                        <div class="form-group">
                            <label class="col-sm-3 control-label">酒店名称</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="hotel"  id="hotel"
                                       placeholder="请输入酒店名称">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">支付金额</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="paymoney"  id="paymoney"
                                       placeholder="支付金额">
                            </div>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="submit" class="btn btn-primary">
                        提交
                    </button><span id="tip"> </span>
                </div>
            </div>
        </div>
    </div>
</form>
</div>



    <table id="table" class="table"></table>

   <%-- 用户编辑得模态框--%>
    <div class="modal fade" id="editModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <div class="modal-header">
                    <h4 class="modal-title">编辑订单</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <div class="modal-body">
                    <form id="editForm" action="ordersUpdate" method="post">
                        <input type="hidden" name="id"/>
                        <div class="form-group">
                            <label class="control-label">开始时间</label>
                            <input name="startime" class="form-control" type="date">
                        </div>

                        <div class="form-group">
                            <label class="control-label">结束时间</label>
                            <input name="endtime" class="form-control" type="date">
                        </div>


                        <div class="form-group">
                            <label class="control-label">酒单名称</label>
                            <input class="form-control" type="text" name="hotel">
                        </div>

                        <div class="form-group">
                            <label class="control-label">支付金额</label>
                            <input class="form-control" type="text" name="paymoney">
                        </div>

                        <div class="modal-footer">
                            <button id="btnEditCommit" type="submit" class="btn btn-primary">更改</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
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

            //addButton
            function addButton() {
                return [
                    '<button id="btnEdit" class="btn btn-primary">编辑</button> &nbsp;&nbsp;&nbsp;&nbsp;',
                    '<button id="btnDelete" class="btn btn-danger">删除</button>'
                ].join("");
            }


            window.opertEvents = {
                "click #btnEdit" : function(e,v,r,i){

                    $.get(
                        'orders/' + r.id,
                        function(data){
                            $('#editForm [name=id]').val(data.id);
                            $('#editForm [name=startime]').val(data.startime);
                            $('#editForm [name=endtime]').val(data.endtime);
                            $('#editForm [name=hotel]').val(data.hotel);
                            $('#editForm [name=paymoney]').val(data.paymoney);
                        }

                    );
                    //将模态框显示出来
                    var d = $('#editModal').modal({
                        backdrop:'static',
                        keyboard: false
                    });
                    d.modal('show');
                },

                "click #btnDelete":function(e,v,r,i){
                    $.post(
                        'orders/' + r.id,
                        {'method':'DELETE'},
                        function(data){
                            if(data > 0){
                                //删除成功之后回到第一页（刷新回第一页）
                                $('#table').bootstrapTable(('refresh'),{pageNumber:1});
                            }
                        },
                        'json'
                    );
                }
            };




            $('#table').bootstrapTable({
                url: 'ordersList',
                columns: [{
                    checkbox: true,//开启复选框
                    visible: true
                }, {
                    field: 'id',
                    title: '订单序号'
                }, {
                    field: 'startime',
                    title: '开始时间'
                }, {
                    field: 'endtime',
                    title: '结束时间'

                }, {
                    field: 'hotel',
                    title: '酒店名称'

                }, {
                    field: 'paymoney',
                    title: '支付金额'
                }, {
                    field: 'button',
                    title: '操作',
                    formatter: addButton,
                    events: opertEvents
                }],
                method: 'post',   //提交的方式
                search: true,    //开启搜索框
                searchOnEnterKey: true,   //开启键盘回车键
                pageNumber: 1,          //从第一页开始
                pageSize: 8,            //每页显示的条数
                toolbar: "#toolbar",
                sortable: true,         //开启排序
                pageList: [8, 10, 20, 30, 40, 50],
                pagination: true,//是否开启分页（*）
                sidePagination: 'server', //从后台拿取数据
                striped: true,          //开启隔行变色
                showRefresh: true  //刷新按钮


            });
        });






    </script>






</body>
</html>
