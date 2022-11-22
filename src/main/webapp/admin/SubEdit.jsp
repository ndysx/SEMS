<%--
  Created by IntelliJ IDEA.
  User: 17TheWord
  Date: 2022/11/19
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../ui/mdui/css/mdui.css"/>
    <link rel="stylesheet" type="text/css" href="../ui/layui/css/layui.css"/>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    if ((boolean) session.getAttribute("isLogin")) {
        // 获取查询的班级信息
        String subName = request.getParameter("subName");
        if (subName.equals("Record")) {
%>
<form class="layui-form" action="${pageContext.request.contextPath}/AdminServlet" method="post">
    <input type=hidden name="methodWay" value="recordEdit">
    <input type=hidden name="id" value="<%=request.getParameter("id")%>" required>
    <div class="layui-form-item">
        <label class="layui-form-label">学号</label>
        <div class="layui-input-block">
            <input type="text" name="stuID" required lay-verify="required" placeholder="请输入学号"
                   value="<%=request.getParameter("stuID")%>" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input type="text" name="stuName" required lay-verify="required" placeholder="请输入姓名"
                   value="<%=request.getParameter("stuName")%>" autocomplete="off"
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
            <input type="text" name="stuAge" required lay-verify="required" placeholder="请输入年龄"
                   value="<%=request.getParameter("stuAge")%>" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-block">
            <input type="text" name="stuPhoneNum" required lay-verify="required" placeholder="请输入手机号"
                   value="<%=request.getParameter("stuPhoneNum")%>" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">班级</label>
        <div class="layui-input-block">
            <input type="text" name="stuClassNum" required lay-verify="required" placeholder="请输入班级"
                   value="<%=request.getParameter("stuClassNum")%>" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">专业</label>
        <div class="layui-input-block">
            <input type="text" name="stuProfessional" required lay-verify="required" placeholder="请输入专业"
                   value="<%=request.getParameter("stuProfessional")%>"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">温度</label>
        <div class="layui-input-block">
            <input type="text" name="stuProfessional" required lay-verify="required" placeholder="请输入温度"
                   value="<%=request.getParameter("stuTemperature")%>"
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
            <input type="text" name="stuProfessional" required lay-verify="required" placeholder="请输入身体状况"
                   value="<%=request.getParameter("stuHealthSituation")%>"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">日期</label>
        <div class="layui-input-block">
            <input id="date" type="text" name="stuHealthSituation" required lay-verify="required" placeholder="请输入日期"
                   value="<%=request.getParameter("dateTime")%>"
                   autocomplete="off"
                   class="layui-input">
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
} else if (subName.equals("Student")) {
%>
<form class="layui-form" action="${pageContext.request.contextPath}/AdminServlet" method="post">
    <input type=hidden name="methodWay" value="studentEdit">
    <input type=hidden name="id" value="<%=request.getParameter("id")%>" required>
    <div class="layui-form-item">
        <label class="layui-form-label">学号</label>
        <div class="layui-input-block">
            <input type="text" name="stuID" required lay-verify="required" placeholder="请输入学号"
                   value="<%=request.getParameter("stuID")%>" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input type="text" name="stuName" required lay-verify="required" placeholder="请输入姓名"
                   value="<%=request.getParameter("stuName")%>" autocomplete="off"
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
            <input type="text" name="stuAge" required lay-verify="required" placeholder="请输入年龄"
                   value="<%=request.getParameter("stuAge")%>" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">手机号</label>
        <div class="layui-input-block">
            <input type="text" name="stuPhoneNum" required lay-verify="required" placeholder="请输入手机号"
                   value="<%=request.getParameter("stuPhoneNum")%>" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">班级</label>
        <div class="layui-input-block">
            <input type="text" name="stuClassNum" required lay-verify="required" placeholder="请输入班级"
                   value="<%=request.getParameter("stuClassNum")%>" autocomplete="off"
                   class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">专业</label>
        <div class="layui-input-block">
            <input type="text" name="stuProfessional" required lay-verify="required" placeholder="请输入专业"
                   value="<%=request.getParameter("stuProfessional")%>"
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
} else if (subName.equals("User")) {
%>
<form class="layui-form" action="${pageContext.request.contextPath}/AdminServlet" method="post">
    <input type=hidden name="methodWay" value="userEdit">
    <input type=hidden name="id" value="<%=request.getParameter("id")%>" required>
    <input type=hidden name="userPassword" value="<%=request.getParameter("userPassword")%>" required>
    <div class="layui-form-item">
        <label class="layui-form-label">账号</label>
        <div class="layui-input-block">
            <input type="text" name="userName" required lay-verify="required" placeholder="请输入账号" autocomplete="off"
                   value="<%=request.getParameter("userName")%>"
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
    <div class="layui-form-item">
        <label class="layui-form-label">学号</label>
        <div class="layui-input-inline">
            <input type="text" name="configmUserPassword" required lay-verify="required" placeholder="请输入密码"
                   value="<%=request.getParameter("stuID")%>"
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
    }
%>
</table>
<script lang="javascript">
    function myFunction(subName, attribute) {
        if (confirm("确认删除？")) {
            var tmp = document.createElement("form");
            var action = "${pageContext.request.contextPath}/AdminServlet?methodWay=delSub&subName=" + subName + "&attribute=" + attribute;
            tmp.action = action;
            tmp.method = "post";
            document.body.appendChild(tmp);
            tmp.submit();
        }
    }

    function insert(subName) {
        window.location.href = "NewSub.jsp?&subName=" + subName;
    }
</script>
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
