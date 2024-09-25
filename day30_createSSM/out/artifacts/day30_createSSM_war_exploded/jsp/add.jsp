<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>添加学生</title>
    <!-- 导入Bootstrap CSS 文件 -->
    <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    --%><style>
        .back {
            position: absolute;
            top: 0;
            bottom: 0;
            left: 0;
            right: 0;
            background-color: #E4E4E4;
            background-size: 100% 100%;
            background-repeat: no-repeat;
        }
        .container-round {
            background-color: rgba(255,255,255,0.5);
            width: 736px;
            border-radius: 10px;
            margin-top: 40px
        }
    </style>
</head>
<%--导入jquery的控件--%>
<script src = "../jquery/jquery-1.7.2.js"></script>

<script>

    //执行添加
    function toAdd(){

        $.ajax({
            //提交到后端的地址
            url : "http://localhost:8080/ssm/user/insert",
            //提交的方式
            type : "post",
            //提交到后端的数据
            data : $("form").serialize(),
            //请求成功之后的回调函数
            success : function (obj){

                if (obj == "true"){
                    alert("添加成功")
                    location.href="http://localhost:8080/ssm/user/list"
                }else {
                    alert("添加失败，有问题请联系管理员！！")
                }


            },
            //预期服务器的返回值类型
            dataType : "text"

        })

    }

</script>

<body class="back">

<table class="table table-hover">
</table>

<div class="container container-round">
    <h1 align="center" style="font-size: 30px">添加学生</h1>

    <form class="form-horizontal" role="form" style="margin-top: 20px">
        <div class="form-group">
            <label for="name" class="col-sm-3 control-label">学生姓名:</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="name" name="name" placeholder="学生姓名">
            </div>
        </div>

        <div class="form-group">
            <label for="password" class="col-sm-3 control-label">密码:</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="password" name="password" placeholder="密码">
            </div>
        </div>

        <div class="form-group">
            <label for="age" class="col-sm-3 control-label">年龄:</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="age" name="age" placeholder="年龄">
            </div>
        </div>


        <div class="form-group">
            <label for="address" class="col-sm-3 control-label">居住地址:</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="address" name="address" placeholder="居住地址">
            </div>
        </div>


        <div class="form-group">
            <div class="col-sm-offset-3 col-sm-6">
                <input type="button" class="btn btn-info" value="添加" onclick="toAdd()">
                <input type="button" class="btn btn-warning" value="取消" onclick="toHome()">
            </div>
        </div>
    </form>
</div>

</body>

</html>
