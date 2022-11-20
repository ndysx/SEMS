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
    <title>Title</title>
</head>
<body>
<%
    if (!(boolean) session.getAttribute("isLogin")) {
        response.sendRedirect("UserLogin.jsp");
    } else {
%>
用户首页
<a href="BindSelfInfo.jsp">绑定个人信息</a>
<a href="../HealthRecordList.jsp">核酸记录</a>

<%
    }
%>
</body>
</html>
