<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--导入jstl标签库--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();//获取当前web工程的绝对路径
%>
<html>
<head>
    <title>学生列表</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<%--导入jquery的控件--%>
<script src = "<%=path%>/jquery/jquery-1.7.2.js"></script>

<script>

    //文本就绪函数
    $(function (){

        //绑定单击事件
        $("#add").click(function (){
             location.href = "http://localhost:8080/ssm/jsp/add.jsp";
        })

        //绑定单击事件
        $("#qxOrQbx").click(function (){

            let flag = this.checked

            //获取所有的多选框
            $(".cks").each(function (){
                this.checked = flag;
            })

        })
    })

    //访问后端根据学生id查询学生记录


    //删除
    function deleteUserById(id){

        $.ajax({
            //提交到后端的地址
            url : "http://localhost:8080/ssm/user/deleteUserById",
            //提交的方式
            type : "post",
            //提交到后端的数据
            data : {id : id},
            //请求成功之后的回调函数
            success : function (obj){

                if (obj == "true"){
                    alert("删除成功")
                    location.href="http://localhost:8080/ssm/user/list"
                }else {
                    alert("删除失败，有问题请联系管理员！！")
                }
            },
            //预期服务器的返回值类型
            dataType : "text"
        })
    }

    function selectUserById(id){
        location.href="http://localhost:8080/ssm/user/selectUserById?id="+id
    }

    //删除
    function deleteUserByIds(){

        //获取被选中的多选框
        let length = $(".cks:checked").length
        if (length > 0){
            if (confirm("是否确定要删除")){
                let Ids = "";
                //获取被选中状态多选框的主键id
                $(".cks:checked").each(function (){
                    Ids += ","+this.value;
                })
                Ids = Ids.substring(1);

                $.ajax({
                    //提交到后端的地址
                    url : "http://localhost:8080/ssm/user/deleteUserByIds",
                    //提交的方式
                    type : "post",
                    //提交到后端的数据
                    data : {Ids : Ids},
                    //请求成功之后的回调函数
                    success : function (obj){

                        if (obj == "true"){
                            alert("删除成功")
                            location.href="http://localhost:8080/ssm/user/list"
                        }else {
                            alert("删除失败，有问题请联系管理员！！")
                        }
                    },
                    //预期服务器的返回值类型
                    dataType : "text"
                })

            }

        }else {
            alert("请至少选择一条数据")
        }

    }




</script>

<body>


    <h1 align="center">学生列表</h1>


    <form action="http://localhost:8080/ssm/user/list" method="post">
        根据姓名模糊查询：<input type="text" name="likeName" value="${likeName}">
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" value="搜索" class="btn btn-warning">
    </form>

    <table  class="table">
        <tr>
            <td colspan="10" align="center">
                <input type="button" id="add" value="添加学生" class="btn btn-info">
                <input type="button"  value="批量删除" onclick="deleteUserByIds()" class="btn btn-info">
            </td>
        </tr>
        <tr>
            <th><input type="checkbox" id="qxOrQbx">全选/全不选</th>
            <th>学生姓名</th>
            <th>密码</th>
            <th>年龄</th>
            <th>居住地址</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${userList}" var="user">
            <tr>
                <td><input type="checkbox" class="cks" value="${user.id}"></td>
                <td>${user.name}</td>
                <td>${user.password}</td>
                <td>${user.age}</td>
                <td>${user.address}</td>
                <td>
                    <input type="button" value="删除" class="btn btn-warning" onclick="deleteUserById(${user.id})">
                    <input type="button" value="编辑" class="btn btn-warning" onclick="selectUserById(${user.id})">
                </td>
            </tr>
        </c:forEach>
    </table>



</body>
</html>
