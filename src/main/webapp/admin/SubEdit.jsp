<%@ page import="com.scareye.sems.controlObject.HealthRecord" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.scareye.sems.db.HealthRecordDB" %>
<%@ page import="com.scareye.sems.controlObject.Student" %>
<%@ page import="com.scareye.sems.db.StudentDB" %>
<%@ page import="com.scareye.sems.controlObject.User" %>
<%@ page import="com.scareye.sems.db.UserDB" %><%--
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
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    if ((boolean) session.getAttribute("isLogin")) {
        // 获取查询的班级信息
        String subName = request.getParameter("subName");
        if (subName.equals("Record")) {
%>
<form action="${pageContext.request.contextPath}/AdminServlet" method="post">
    <input type=hidden name="methodWay" value="recordEdit">
    <input type=hidden name="id" value="<%=request.getParameter("id")%>" required>
    学号<input type="text" name="stuID" value="<%=request.getParameter("stuID")%>" required><br>
    姓名<input type="text" name="stuName" value="<%=request.getParameter("stuName")%>" required><br>
    性别<input type="text" name="stuSex" value="<%=request.getParameter("stuSex")%>" required><br>
    年龄<input type="text" name="stuAge" value="<%=request.getParameter("stuAge")%>" required><br>
    手机号<input type="text" name="stuPhoneNum" value="<%=request.getParameter("stuPhoneNum")%>" required><br>
    班级<input type="text" name="stuClassNum" value="<%=request.getParameter("stuClassNum")%>" required><br>
    专业<input type="text" name="stuProfessional" value="<%=request.getParameter("stuProfessional")%>" required><br>
    体温<input type="text" name="stuTemperature" value="<%=request.getParameter("stuTemperature")%>" required><br>
    核酸<input type="text" name="ifDetected" value="<%=request.getParameter("ifDetected")%>" required><br>
    身体状况<input type="text" name="stuHealthSituation" value="<%=request.getParameter("stuHealthSituation")%>"
               required><br>
    日期<input type="text" name="dateTime" value="<%=request.getParameter("dateTime")%>" required><br>
    <button type="submit">提交</button>
</form>
<%
} else if (subName.equals("Student")) {
%>
<form action="${pageContext.request.contextPath}/AdminServlet" method="post">
    <input type=hidden name="methodWay" value="studentEdit">
    <input type=hidden name="id" value="<%=request.getParameter("id")%>" required>
    学号<input type="text" name="stuID" value="<%=request.getParameter("stuID")%>" required><br>
    姓名<input type="text" name="stuName" value="<%=request.getParameter("stuName")%>" required><br>
    性别<input type="text" name="stuSex" value="<%=request.getParameter("stuSex")%>" required><br>
    年龄<input type="text" name="stuAge" value="<%=request.getParameter("stuAge")%>" required><br>
    手机号<input type="text" name="stuPhoneNum" value="<%=request.getParameter("stuPhoneNum")%>" required><br>
    班级<input type="text" name="stuClassNum" value="<%=request.getParameter("stuClassNum")%>" required><br>
    专业<input type="text" name="stuProfessional" value="<%=request.getParameter("stuProfessional")%>" required><br>
    <button type="submit">提交</button>
</form>
<%
} else if (subName.equals("User")) {
%>
<form action="${pageContext.request.contextPath}/AdminServlet" method="post">
    <input type=hidden name="methodWay" value="userEdit">
    <input type=hidden name="id" value="<%=request.getParameter("id")%>" required>
    <input type=hidden name="userPassword" value="<%=request.getParameter("userPassword")%>" required>
    用户名<input type="text" name="userName" value="<%=request.getParameter("userName")%>" required><br>
    新密码<input type="text" name="newUserPassword"><br>
    确认新密码<input type="text" name="confirmNewUserNewPassword"><br>
    学号<input type="text" name="stuID" value="<%=request.getParameter("stuID")%>" required><br>
    <button type="submit">提交</button>
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
</body>
</html>
