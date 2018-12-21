<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/18
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

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
<button style="margin-top: 20px" class="btn btn-primary btn-sm" data-toggle="modal"  data-target="#addHotelModal">
    添加酒店
</button>

<form method="post" action="addHotel" class="form-horizontal" role="form" id="form_data" onsubmit="return check_form()" style="margin: 20px;">
    <div class="modal fade" id="addHotelModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>

                </div>
                <div class="modal-body">
                    <form   class="form-horizontal" role="form" >

                        <div class="form-group">
                            <label  class="col-sm-3 control-label">酒店名</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="name" id="name"
                                       placeholder="酒店名称">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">价格</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="price"  id="price"
                                       placeholder="酒店价格">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">酒店信息</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="info"  id="info"
                                       >
                            </div>
                        </div>




                        <div class="form-group">
                            <label class="col-sm-3 control-label">地址</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="address"  id="address"
                                       placeholder="酒店地址">
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

<table id="table" class=""></table>


<div class="modal fade" id="editModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="modal-header">
                <h4 class="modal-title">修改酒店</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>


            <div class="modal-body">
                <form id="editForm" action="hotelUpdate" method="post">
                    <input type="hidden" name="id"/>
                    <div class="form-group">
                        <label class="control-label">酒店名</label>
                        <input name="name" class="form-control" type="text">
                    </div>

                    <div class="form-group">
                        <label class="control-label">价格</label>
                        <input name="price" class="form-control" type="text">
                    </div>


                    <div class="form-group">
                        <label class="control-label">酒店简介</label>
                        <input class="form-control" type="text" name="info">
                    </div>

                    <div class="form-group">
                        <label class="control-label">酒店地址</label>
                        <input class="form-control" type="text" name="address">
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
            $(function() {
                    //addButton
                    function addButton() {
                        return [
                            '<button id="btnEdit" class="btn btn-primary">修改</button> &nbsp;&nbsp;&nbsp;&nbsp;',
                            '<button id="btnDelete" class="btn btn-danger">删除</button>'
                        ].join("");
                    }




                    window.opertEvents = {
                        "click #btnEdit" : function(e,v,r,i){

                            $.get(
                                'hotel/' + r.id,
                                function(data){
                                    $('#editForm [name=id]').val(data.id);
                                    $('#editForm [name=name]').val(data.name);
                                    $('#editForm [name=price]').val(data.price);
                                    $('#editForm [name=info]').val(data.info);
                                    $('#editForm [name=address]').val(data.address);
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
                                    'hotel/' + r.id,
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
                    url:'hotelByPage',
                    columns:[{
                        checkbox:true,//开启复选框
                        visible: true
                    },{
                        field: 'id',
                        title: '序号'
                    },{
                        field: 'name',
                        title: '名称'
                    },{
                        field: 'price',
                        title: '价格'

                    },{
                        field: 'info',
                        title: '信息'

                    },{
                        field: 'address',
                        title: '地址'
                    }, {
                        field:'button',
                        title:'操作',
                        formatter:addButton,
                        events:opertEvents
                    }],
                    method:'post',   //提交的方式
                    search:true,    //开启搜索框
                    searchOnEnterKey:true,   //开启键盘回车键
                    pageNumber:1,          //从第一页开始
                    pageSize:8,            //每页显示的条数
                    toolbar : "#toolbar",
                    pageList:[8,10,20,30,40,50],
                    pagination: true,//是否开启分页（*）
                    sidePagination:'server', //从后台拿取数据
                    striped:true,          //开启隔行变色
                    showRefresh:true  //刷新按钮
            });
            });


        </script>


</body>
</html>
