<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: 17TheWord
  Date: 2022/11/1
  Time: 18:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户首页</title>
    <link rel="stylesheet" type="text/css" href="../ui/mdui/css/mdui.css"/>
</head>
<body>
<%
    if (!(boolean) session.getAttribute("isLogin")) {
        response.sendRedirect("UserLogin.jsp");
    } else {
%>

<div class="mdui-row-xs-2">

    <a class="mdui-btn mdui-btn-block mdui-color-theme-accent mdui-ripple" href="BindSelfInfo.jsp">个人信息</a>


    <a class="mdui-btn mdui-btn-block mdui-color-theme-accent mdui-ripple"
       href="../HealthRecordList.jsp">核酸记录</a>

</div>
<%
    }
%>
</body>
</html>
