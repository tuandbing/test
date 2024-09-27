<%@ page contentType="text/html;charset=UTF-8" %>
<%--导入jstl标签库--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    //获取当前web工程的绝对路径
    String path = request.getContextPath();
%>
<html lang="zh_CN">
<head>
    <title>商品列表</title>
    <link rel="stylesheet" href="<%=path%>/css/style.css">
</head>
<%--导入jquery的库--%>
<script src="<%=path%>/jquery/jquery-1.7.2.js"></script>
<script>
    function page(currentPage){

        location.href = "http://localhost:8080/web/goods/list?currentPage=" +

            currentPage+"&likeName=${goodsVo.likeName}&upTimeEnd=${goodsVo.upTimeEnd}&upTimeStart=${goodsVo.upTimeStart}&brandId=${goodsVo.brandId}";
    }

    $(function (){

        $("[value='商品上架']").click(function (){
            location.href="http://localhost:8080/web/goods/toInsertGoods"
        })

    })
</script>
<body>

<form action="http://localhost:8080/web/goods/list" method="post">
    名称查询<input type="text" name="likeName" value="${goodsVo.likeName}">

    &nbsp;&nbsp;&nbsp;&nbsp;
    品牌查询：<select name="brandId">

    <option value="">--请选择--</option>
    <c:forEach items="${brandList}" var="brand">

        <c:if test="${goodsVo.brandId == brand.bid}">
            <option selected value="${brand.bid}">${brand.brandName}</option>
        </c:if>

        <c:if test="${goodsVo.brandId != brand.bid}">
            <option value="${brand.bid}">${brand.brandName}</option>
        </c:if>

    </c:forEach>
</select>
    &nbsp;&nbsp;&nbsp;&nbsp;
    区间查询：
    <input type="date" name="upTimeStart" value="${goodsVo.upTimeStart}">--<input type="date" name="upTimeEnd" value="${goodsVo.upTimeEnd}">
    &nbsp;
    <input type="submit" value="搜索" class="btn btn-warning">
</form>

<table class="table">
    <tr>
        <td colspan="10" align="center">
            <input type="button" class="btn btn-info" value="商品上架">
            <input type="button" class="btn btn-info" value="商品下架">
        </td>
    </tr>
    <tr>
        <th><input type="checkbox" id="checkbox">全选</th>
        <th>商品名称</th>
        <th>价格</th>
        <th>上架时间</th>
        <th>品牌</th>
        <th>类别</th>
        <th>商品描述</th>
        <th>库存</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${goodsList}" var="goods">
        <tr>
            <td><input type="checkbox" class="cks" value="${goods.gid}"></td>
            <td>${goods.goodsName}</td>
            <td>${goods.price}</td>
            <td>${goods.upTime}</td>
            <td>${goods.brand.brandName}</td>
            <td>${goods.cate.cateName}</td>
            <td>${goods.goodsDesc}</td>
            <td>${goods.num}</td>
            <td>
                <input type="button" value="删除" data-value="${goods.gid}" class="btn btn-warning">
                <input type="button" value="编辑" data-value="${goods.gid}" class="btn btn-warning">
            </td>
        </tr>
    </c:forEach>
    <tr>
        <td colspan="20" align="center">
            当前页${pageUtils.currentPage}/${pageUtils.lastPage}
            <a href="#" onclick="page(1)">首页</a>
            <a href="#" onclick="page(${pageUtils.prevPage})">上一页</a>
            <a href="#" onclick="page(${pageUtils.nextPage})">下一页</a>
            <a href="#" onclick="page(${pageUtils.lastPage})">尾页</a>
        </td>
    </tr>
</table>


</body>
<script>

</script>
</html>
