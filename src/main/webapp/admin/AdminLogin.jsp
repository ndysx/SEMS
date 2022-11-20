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
</head>
<body>
<form action="${pageContext.request.contextPath}/AdminServlet" method="post">
    <input type="hidden" name="methodWay" value="login" required>
    用户名：<input type="text" name="adminName" required><br>
    密码：<input type="text" name="adminPassword" required><br>
    <input type="submit" value="登录">
</form>
</body>
</html>
