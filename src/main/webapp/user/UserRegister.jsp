<%--
  Created by IntelliJ IDEA.
  User: 17TheWord
  Date: 2022/11/6
  Time: 18:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/UserServlet" method="post">
    <input type="hidden" name="methodWay" value="register">
    用户名：<input type="text" name="userName" required><br>
    密码：<input type="text" name="userPassword" required><br>
    确认密码：<input type="text" name="confirmUserPassword" required><br>
    已有账号？ <a href="UserRegister.jsp">登录</a>
    <input type="submit" value="注册">
</form>
</body>
</html>
