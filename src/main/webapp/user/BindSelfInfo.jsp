<%@ page import="com.scareye.sems.service.UserService" %>
<%@ page import="com.scareye.sems.controlObject.Student" %><%--
  Created by IntelliJ IDEA.
  User: 17TheWord
  Date: 2022/11/2
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>绑定个人信息</title>
</head>
<body>
<%
    // 是否登录
    if ((boolean) session.getAttribute("isLogin")) {
        UserService userService = new UserService();
        if (userService.ifBind((String) session.getAttribute("userName"))) {
            // 用户是否绑定信息
            Student student = userService.getStudentInfo(userService.getUserStuID((String) session.getAttribute("userName")));
            int stuID = student.getStuID();
            String stuName = student.getStuName();
            String stuSex = student.getStuSex();
            int stuAge = student.getStuAge();
            String stuPhoneNum = student.getStuPhoneNum();
            String stuClassNum = student.getStuClassNum();
            String stuProfessional = student.getStuProfessional();
%>
<table border="1">
    <tr>
        <th>学号</th>
        <th>姓名</th>
        <th>性别</th>
        <th>年龄</th>
        <th>电话号码</th>
        <th>班级</th>
        <th>专业</th>
    </tr>
    <tr>
        <td><%=stuID%>
        </td>
        <td><%=stuName%>
        </td>
        <td><%=stuSex%>
        </td>
        <td><%=stuAge%>
        </td>
        <td><%=stuPhoneNum%>
        </td>
        <td><%=stuClassNum%>
        </td>
        <td><%=stuProfessional%>
        </td>
    </tr>
</table>
<form action="${pageContext.request.contextPath}/UserServlet" method="post">
    <button name="methodWay" value="unBindSelfInfo">解绑
    </button>
</form>

<%
} else {
%>
<form action="${pageContext.request.contextPath}/UserServlet" method="post">
    <input type=hidden name="methodWay" value="bindSelfInfo">
    学号<input type="text" name="stuID" required><br>
    姓名<input type="text" name="stuName" required><br>
    性别<input type="text" name="stuSex" required><br>
    年龄<input type="text" name="stuAge" required><br>
    手机号<input type="text" name="stuPhoneNum" required><br>
    班级<input type="text" name="stuClassNum" required><br>
    专业<input type="text" name="stuProfessional" required><br>
    <button type="submit">绑定</button>
</form>
<%
    }
%>
<%
    } else {
        response.sendRedirect("UserLogin.jsp");
    }
%>

</body>
</html>
