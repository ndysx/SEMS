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
</head>
<body>
<%
    if (!(boolean) session.getAttribute("isLogin")) {
        response.sendRedirect("AdminLogin.jsp");
    } else {
%>

<a href="SubManager.jsp?subName=Student">学生管理</a>
<a href="SubManager.jsp?subName=User">用户管理</a>
<a href="SubManager.jsp?subName=Record">核酸管理</a>

<%
    }
%>
</body>
</html>
