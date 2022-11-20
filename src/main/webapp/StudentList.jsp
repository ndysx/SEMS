<%--
  Created by IntelliJ IDEA.
  User: 17TheWord
  Date: 2022/10/30
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.scareye.sems.db.StudentDB" %>
<%@ page import="com.scareye.sems.controlObject.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生列表</title>
    <link rel="stylesheet" type="text/css" href="ui/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="ui/mdui/css/mdui.css"/>
</head>
<body>

<form action="StudentList.jsp" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">选择框</label>
        <div class="layui-input-block">
            <select name="attributeValue" lay-verify="required">
                <option value=""></option>
                <option value="id">序号</option>
                <option value="stuID">学号</option>
                <option value="stuName">姓名</option>
                <option value="stuSex">性别</option>
                <option value="stuAge">年龄</option>
                <option value="stuPhoneNUm">手机号</option>
                <option value="stuClassNum">班级</option>
                <option value="stuProfessional">专业</option>
                <option value="stuTemperature">体温</option>
                <option value="ifDetected">核酸记录</option>
                <option value="stuHealthSituation">身体状况</option>
                <option value="dateTime">日期</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">查询的值</label>
        <div class="layui-input-block">
            <input type="text" width="5em" name="parameterValue" required lay-verify="required" placeholder="请输入标题"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">查询</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<%
    // 获取查询的班级信息
    request.setCharacterEncoding("UTF-8");
    String attributeV = request.getParameter("attributeValue");
    String parameterV = request.getParameter("parameterValue");

    // 根据属性、参数查看对应列表信息
    ArrayList studentArrayList = new StudentDB().studentArrayList(attributeV, parameterV);

%>
<div class="mdui-table-fluid">
    <table class="mdui-table mdui-table-hoverable">
        <thead>
        <tr>
            <th>序号</th>
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>电话号码</th>
            <th>班级</th>
            <th>专业</th>
        </tr>
        </thead>
        <%
            for (int i = 0; i < studentArrayList.size(); i++) {
                Student student = (Student) studentArrayList.get(i);

                int id = student.getID();
                int stuID = student.getStuID();
                String stuName = student.getStuName();
                String stuSex = student.getStuSex();
                int stuAge = student.getStuAge();
                String stuPhoneNum = student.getStuPhoneNum();
                String stuClassNum = student.getStuClassNum();
                String stuProfessional = student.getStuProfessional();

        %>
        <tbody>
        <tr>
            <td><%=id%>
            </td>
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
        <%
            }
        %>
    </table>
</div>
<script src="ui/layui/layui.js"></script>
<script>
    layui.use('form', function () {
        var form = layui.form;
    });
</script>
</body>
</html>
