<%--
  Created by IntelliJ IDEA.
  User: 17TheWord
  Date: 2022/11/1
  Time: 17:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/UserServlet" method="post">
    <input type="hidden" name="methodWay" value="login">
    用户名：<input type="text" name="userName" required><br>
    密码：<input type="text" name="userPassword" required><br>
    <a href="UserRegister.jsp">注册账号</a>
    <input type="submit" value="登录">
</form>
</body>
</html>
