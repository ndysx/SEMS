<%--
  Created by IntelliJ IDEA.
  User: 17TheWord
  Date: 2022/11/6
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../ui/mdui/css/mdui.css"/>
    <link rel="stylesheet" type="text/css" href="../ui/layui/css/layui.css"/>
</head>
<body>
<form class="layui-form" action="${pageContext.request.contextPath}/AdminServlet" method="post">
    <input type="hidden" name="methodWay" value="login" required>
    <div class="layui-form-item">
        <label class="layui-form-label">账号</label>
        <div class="layui-input-block">
            <input type="text" name="adminName" required lay-verify="required" placeholder="请输入账号" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="password" name="adminPassword" required lay-verify="required" placeholder="请输入密码"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <input class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent" type="submit" value="登录">
</form>
</body>
</html>
