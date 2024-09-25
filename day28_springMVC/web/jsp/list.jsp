<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table tr{
            text-align: center;
        }

    </style>
</head>
<body>
<table border="1" width="400px">
    <tr>
        <td>id</td><td>username</td><td>address</td>
    </tr>
    <c:forEach items="${userList}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.address}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
