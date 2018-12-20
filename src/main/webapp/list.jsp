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
<button style="margin-top: 20px" class="btn btn-primary btn-sm" data-toggle="modal"  data-target="#addUserModal">
    添加用户
</button>

<form method="post" action="addUser" class="form-horizontal" role="form" id="form_data" onsubmit="return check_form()" style="margin: 20px;">
    <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        用户信息
                    </h4>
                </div>
                <div class="modal-body">
                    <form   class="form-horizontal" role="form" >

                        <div class="form-group">
                            <label  class="col-sm-3 control-label">用户名</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="username" id="username"
                                       placeholder="用户名">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">密码</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" name="pwd"  id="pwd"
                                       placeholder="密码">
                            </div>
                        </div>

                        <fieldset class="form-group">
                            <label class="control-label">性别</label>
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input class="form-check-input" type="radio" name="sex"
                                         value="男" >男
                                </label>
                                <label class="form-check-label" style="margin-left: 50px">
                                    <input class="form-check-input" type="radio" name="sex"
                                         value="女" >女
                                </label>
                            </div>
                        </fieldset>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">年龄</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="age"  id="age"
                                       placeholder="年龄">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">职业</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" name="professional"  id="professional"
                                       placeholder="职业">
                            </div>
                        </div>


                        <div class="form-group">
                            <label  class="col-sm-3 control-label">喜爱的风景</label>
                            <div class="col-sm-9">
                                <textarea  class="form-control"  name="love" id="love"
                                           placeholder="描述">
                                </textarea>
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
                <h4 class="modal-title">编辑用户</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>


            <div class="modal-body">
                <form id="editForm" action="userUpdate" method="post">
                    <input type="hidden" name="id"/>
                    <div class="form-group">
                        <label class="control-label">用户名</label>
                        <input name="username" class="form-control" type="text">
                    </div>

                    <div class="form-group">
                        <label class="control-label">密码</label>
                        <input name="pwd" class="form-control" type="password">
                    </div>

                    <fieldset class="form-group">
                        <label class="control-label">性别</label>
                        <div class="form-check">
                            <label class="form-check-label">
                                <input class="form-check-input" type="radio" name="sex"
                                       value="0">男
                            </label>
                            <label class="form-check-label" style="margin-left: 50px">
                                <input class="form-check-input" type="radio" name="sex"
                                       value="1">女
                            </label>
                        </div>
                    </fieldset>
                    <div class="form-group">
                        <label class="control-label">年龄</label>
                        <input class="form-control" type="text" name="age">
                    </div>

                    <div class="form-group">
                        <label class="control-label">职业</label>
                        <input class="form-control" type="text" name="professional">
                    </div>

                    <div class="form-group">
                        <label class="control-label">喜爱的风景</label>
                        <input class="form-control" type="text" name="love">
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
                            '<button id="btnEdit" class="btn btn-primary">编辑</button> &nbsp;&nbsp;&nbsp;&nbsp;',
                            '<button id="btnDelete" class="btn btn-danger">删除</button>'
                        ].join("");
                    }


                    window.opertEvents = {
                        "click #btnEdit" : function(e,v,r,i){

                            $.get(
                                'user/' + r.id,
                                function(data){
                                    $('#editForm [name=id]').val(data.id);
                                    $('#editForm [name=username]').val(data.username);
                                    $('#editForm [name=pwd]').val(data.pwd);
                                    $('#editForm [type=radio][value='+data.sex+']').attr('checked',true);
                                    $('#editForm [name=age]').val(data.age);
                                    $('#editForm [name=professional]').val(data.professional);
                                    $('#editForm [name=love]').val(data.love);
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
                                    'user/' + r.id,
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
                    url:'userByPage',
                    columns:[{
                        checkbox:true,//开启复选框
                        visible: true
                    },{
                        field: 'id',
                        title: '序号'
                    },{
                        field: 'username',
                        title: '姓名'
                    },{
                        field: 'sex',
                        title: '性别'

                    },{
                        field: 'age',
                        title: '年龄'

                    },{
                        field: 'professional',
                        title: '职业'
                    }, {
                        field: 'love',
                        title: '喜欢的风景'
                    },{
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
                    sortable: true,         //开启排序
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
