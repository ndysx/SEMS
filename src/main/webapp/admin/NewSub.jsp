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
    <link rel="stylesheet" type="text/css" href="../ui/mdui/css/mdui.css"/>
    <link rel="stylesheet" type="text/css" href="../ui/layui/css/layui.css" media="all"/>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    if ((boolean) session.getAttribute("isLogin")) {
        // 获取查询的班级信息
        String subName = request.getParameter("subName");
        if (subName.equals("User")) {
%>
<form class="layui-form" action="${pageContext.request.contextPath}/AdminServlet" method="post">
    <input type=hidden name="methodWay" value="newSub">
    <input type=hidden name="subName" value="User">
    <input type="hidden" name="stuID" value="0"><br>
    <div class="layui-form-item">
        <label class="layui-form-label">账号</label>
        <div class="layui-input-block">
            <input type="text" name="userName" required lay-verify="required" placeholder="请输入账号" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-inline">
            <input type="password" name="userPassword" required lay-verify="required" placeholder="请输入密码"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">确认密码</label>
        <div class="layui-input-inline">
            <input type="password" name="configmUserPassword" required lay-verify="required" placeholder="请输入密码"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent" type="submit">提交</button>
</form>
<%
} else if (subName.equals("Student")) {
%>
<form class="layui-form" action="${pageContext.request.contextPath}/AdminServlet" method="post">
    <input type=hidden name="methodWay" value="newSub">
    <input type=hidden name="subName" value="Student">
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
} else if (subName.equals("Record")) {
%>
<form class="layui-form" action="${pageContext.request.contextPath}/AdminServlet" method="post">
    <input type=hidden name="methodWay" value="newSub">
    <input type=hidden name="subName" value="Record">
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
        <label class="layui-form-label">温度</label>
        <div class="layui-input-block">
            <input type="text" name="stuTemperature" required lay-verify="required" placeholder="请输入温度"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">核酸</label>
        <div class="layui-input-block">
            <input type="radio" name="ifDetected" value="已做" title="已做" checked>
            <input type="radio" name="ifDetected" value="未做" title="未做">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">身体状况</label>
        <div class="layui-input-block">
            <input type="text" name="stuHealthSituation" required lay-verify="required" placeholder="请输入身体状况"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">日期</label>
        <div class="layui-input-block">
            <input id="date" type="text" name="stuHealthSituation" required lay-verify="required" placeholder="请输入日期"
                   autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <button class="mdui-btn mdui-btn-raised mdui-ripple mdui-color-theme-accent" type="submit">提交</button>
</form>
<%
        }
    } else {
        response.sendRedirect("AdminLogin.jsp");
    }
%>
<script src="../ui/layui/layui.js">
    layui.use('form', function () {
        var form = layui.form;
    });
</script>
<script>
    layui.use('laydate', function () {
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#date' //指定元素
        });
    });
</script>
</body>
</html>
