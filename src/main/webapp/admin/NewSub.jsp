<%--
  Created by IntelliJ IDEA.
  User: 17TheWord
  Date: 2022/11/11
  Time: 0:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    if ((boolean) session.getAttribute("isLogin")) {
        // 获取查询的班级信息
        String subName = request.getParameter("subName");
        if (subName.equals("User")) {
%>
<form action="${pageContext.request.contextPath}/AdminServlet" method="post">
    <input type=hidden name="methodWay" value="newSub">
    <input type=hidden name="subName" value="User">
    用户名<input type="text" name="userName" required><br>
    新密码<input type="text" name="newUserPassword"><br>
    确认新密码<input type="text" name="confirmNewUserNewPassword"><br>
    学号<input type="text" name="stuID" required><br>
    <button type="submit">提交</button>
</form>
<%
} else if (subName.equals("Student")) {
%>
<form action="${pageContext.request.contextPath}/AdminServlet" method="post">
    <input type=hidden name="methodWay" value="newSub">
    <input type=hidden name="subName" value="Student">
    学号<input type="text" name="stuID" required><br>
    姓名<input type="text" name="stuName" required><br>
    性别<input type="text" name="stuSex" required><br>
    年龄<input type="text" name="stuAge" required><br>
    手机号<input type="text" name="stuPhoneNum" required><br>
    班级<input type="text" name="stuClassNum" required><br>
    专业<input type="text" name="stuProfessional" required><br>
    <button type="submit">提交</button>
</form>
<%
} else if (subName.equals("Record")) {
%>
<form action="${pageContext.request.contextPath}/AdminServlet" method="post">
    <input type=hidden name="methodWay" value="newSub">
    <input type=hidden name="subName" value="Record">
    学号<input type="text" name="stuID" required><br>
    姓名<input type="text" name="stuName" required><br>
    性别<input type="text" name="stuSex" required><br>
    年龄<input type="text" name="stuAge" required><br>
    手机号<input type="text" name="stuPhoneNum" required><br>
    班级<input type="text" name="stuClassNum" required><br>
    专业<input type="text" name="stuProfessional" required><br>
    体温<input type="text" name="stuTemperature" required><br>
    核酸<input type="text" name="ifDetected" required><br>
    身体状况<input type="text" name="stuHealthSituation" required><br>
    日期<input type="text" name="dateTime" required><br>
    <button type="submit">提交</button>
</form>
<%
        }
    } else {
        response.sendRedirect("AdminLogin.jsp");
    }
%>
</body>
</html>
