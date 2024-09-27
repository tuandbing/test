<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--导入jstl标签库--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    //获取当前web工程的绝对路径
    String path = request.getContextPath();
%>
<html lang="zh_CN">
<head>
    <title>商品上架</title>
    <link rel="stylesheet" href="<%=path%>/css/style.css">
</head>
<%--导入jquery的库--%>
<script src="<%=path%>/jquery/jquery-1.7.2.js"></script>
<script>


    $(function () {
        $.ajax({
            url: "http://localhost:8080/web/brand/findBrandAll",
            type: "post",
            success: function (obj) {
                for (let i in obj) {
                    $("select").append("<option value='" + obj[i].bid + "'>" + obj[i].brandName + "</option>")
                }
            },
            dataType: "json"
        })

        $("[value='上架']").click(function () {
            $.ajax({
                url: "http://localhost:8080/web/goods/insertGoods",
                type: "post",
                data: $("form").serialize(),
                success: function (obj) {
                    if (obj == "1") {
                        alert("上架成功")
                        location.href = "http://localhost:8080/web/goods/list"
                    } else if (obj == "2") {
                        alert("当前商品已存在，库存加一！！")
                        location.href = "http://localhost:8080/web/goods/list"
                    } else if (obj == "3") {
                        alert("上架失败，请联系管理员")
                    } else {
                        alert("当前商品已存在，库存添加失败，请联系管理员！！")
                    }
                },
                dataType: "text"
            })
        })
    })

</script>
<body>

<h1 align="center">SSM-商品上架</h1>

<form>
    <table class="table">

        <tr>
            <td>商品名称:</td>
            <td>
                <input type="text" name="goodsName">
            </td>
        </tr>
        <tr>
            <td>价格:</td>
            <td>
                <input type="text" name="price">
            </td>
        </tr>
        <tr>
            <td>品牌:</td>
            <td>
                <select name="brandId"></select>
            </td>
        </tr>
        <tr>
            <td>类别:</td>
            <td>
                家用电器：<input type="radio" name="cateId" value="1">
                电子产品：<input type="radio" name="cateId" value="2">
                运动器材：<input type="radio" name="cateId" value="3">
                服装服饰：<input type="radio" name="cateId" value="4">
            </td>
        </tr>
        <tr>
            <td>商品描述:</td>
            <td>
                <input type="text" name="goodsDesc">
            </td>
        </tr>

        <tr>
            <td colspan="20" align="center">
                <input type="button" class="btn btn-warning" value="上架">
            </td>
        </tr>

    </table>
</form>

</body>
</html>
