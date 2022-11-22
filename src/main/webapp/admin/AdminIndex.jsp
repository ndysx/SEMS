<%--
  Created by IntelliJ IDEA.
  User: 17TheWord
  Date: 2022/11/7
  Time: 0:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员页面</title>
    <link rel="stylesheet" type="text/css" href="../ui/mdui/css/mdui.css"/>
</head>
<body>
<%
    if (!(boolean) session.getAttribute("isLogin")) {
        response.sendRedirect("AdminLogin.jsp");
    } else {
%>

<div class="mdui-row-xs-2">
    <a class="mdui-btn mdui-btn-block mdui-color-theme-accent mdui-ripple"
       href="SubManager.jsp?subName=Student">学生管理</a>
    <a class="mdui-btn mdui-btn-block mdui-color-theme-accent mdui-ripple"
       href="SubManager.jsp?subName=User">用户管理</a>
    <a class="mdui-btn mdui-btn-block mdui-color-theme-accent mdui-ripple"
       href="SubManager.jsp?subName=Record">核酸管理</a>
</div>
<%
    }
%>
</body>
</html>
