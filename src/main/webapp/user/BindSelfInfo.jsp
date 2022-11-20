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
    <link rel="stylesheet" type="text/css" href="../ui/mdui/css/mdui.css"/>
    <link rel="stylesheet" type="text/css" href="../ui/layui/css/layui.css"/>
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
<div class="mdui-table-fluid">
    <table class="mdui-table mdui-table-hoverable">
        <thead>
        <tr>
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>电话号码</th>
            <th>班级</th>
            <th>专业</th>
        </tr>
        </thead>
        <tbody>
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
        </tbody>
    </table>
</div>
<form action="${pageContext.request.contextPath}/UserServlet" method="post">
    <button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent" name="methodWay" value="unBindSelfInfo">解绑
    </button>
</form>

<%
} else {
%>

<form action="${pageContext.request.contextPath}/UserServlet" class="layui-form" method="post">
    <input type=hidden name="methodWay" value="bindSelfInfo">
    <div class="layui-form-item">
        <label class="layui-form-label">学号</label>
        <div class="layui-input-block">
            <input type="text" name="stuID" required lay-verify="required" placeholder="请输入学号" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input type="text" name="stuName" required lay-verify="required" placeholder="请输入姓名" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="stuSex" value="男" title="男">
            <input type="radio" name="stuSex" value="女" title="女" checked>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">年龄</label>
        <div class="layui-input-block">
            <input type="text" name="stuAge" required lay-verify="required" placeholder="请输入年龄" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-block">
            <input type="text" name="stuPhoneNum" required lay-verify="required" placeholder="请输入手机号" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">班级</label>
        <div class="layui-input-block">
            <input type="text" name="stuClassNum" required lay-verify="required" placeholder="请输入班级" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">专业</label>
        <div class="layui-input-block">
            <input type="text" name="stuProfessional" required lay-verify="required" placeholder="请输入专业"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<%
    }
%>
<%
    } else {
        response.sendRedirect("UserLogin.jsp");
    }
%>
<script src="../ui/layui/layui.js">
    layui.use('form', function () {
        var form = layui.form;

    });
</script>
</body>
</html>
