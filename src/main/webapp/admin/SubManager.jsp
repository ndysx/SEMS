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
    String attributeV = request.getParameter("attributeValue");
    String parameterV = request.getParameter("parameterValue");
    if ((boolean) session.getAttribute("isLogin")) {
        // 获取查询的班级信息
        String subName = request.getParameter("subName");
        if (subName.equals("Record")) {
%>
<form action="${pageContext.request.contextPath}/admin/SubManager.jsp" method="post">
    <input type="hidden" name="subName" value="Record" required><br>
    请输查询的属性：<input type="text" name="attributeValue" required><br>
    请输查询的值：<input type="text" name="parameterValue" required><br>
    <input type="submit" value="查询">
</form>
<%
    // 根据属性、参数查看对应列表信息
    ArrayList healthRecordList = new HealthRecordDB().healthRecordArrayList(attributeV, parameterV);

%>
<table border="1">
    <tr>
        <th>序号</th>
        <th>学号</th>
        <th>姓名</th>
        <th>性别</th>
        <th>年龄</th>
        <th>手机号</th>
        <th>班级</th>
        <th>专业</th>
        <th>体温</th>
        <th>核酸记录</th>
        <th>身体状况</th>
        <th>日期</th>
        <th>操作
            <input type="button" value="新增" onclick="insertSub('Record')">
        </th>
    </tr>
    <%
        for (int i = 0; i < healthRecordList.size(); i++) {
            HealthRecord healthRecord = (HealthRecord) healthRecordList.get(i);

            int id = healthRecord.getID();
            int stuID = healthRecord.getStuID();
            String stuName = healthRecord.getStuName();
            String stuSex = healthRecord.getStuSex();
            int stuAge = healthRecord.getStuAge();
            String stuPhoneNum = healthRecord.getStuPhoneNum();
            String stuClassNum = healthRecord.getStuClassNum();
            String stuProfessional = healthRecord.getStuProfessional();

            double stuTemperature = healthRecord.getStuTemperature();
            String ifDetected = "未做";
            if (healthRecord.getIfDetected()) {
                ifDetected = "已做";
            }
            String stuHealthSituation = healthRecord.getStuHealthSituation();
            String dateTime = healthRecord.getDateTime();
    %>
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
        <td><%=stuTemperature%>
        </td>
        <td><%=ifDetected%>
        </td>
        <td><%=stuHealthSituation%>
        </td>
        <td><%=dateTime%>
        </td>
        <td>
            <form action="RecordEdit.jsp" method="post">
                <input type="hidden" name="id" value="<%=id%>">
                <input type="hidden" name="stuID" value="<%=stuID%>">
                <input type="hidden" name="stuName" value="<%=stuName%>">
                <input type="hidden" name="stuSex" value="<%=stuSex%>">
                <input type="hidden" name="stuAge" value="<%=stuAge%>">
                <input type="hidden" name="stuPhoneNum" value="<%=stuPhoneNum%>">
                <input type="hidden" name="stuClassNum" value="<%=stuClassNum%>">
                <input type="hidden" name="stuProfessional" value="<%=stuProfessional%>">
                <input type="hidden" name="stuTemperature" value="<%=stuTemperature%>">
                <input type="hidden" name="ifDetected" value="<%=ifDetected%>">
                <input type="hidden" name="stuHealthSituation" value="<%=stuHealthSituation%>">
                <input type="hidden" name="dateTime" value="<%=dateTime%>">
                <input type="submit" value="编辑">
            </form>
            <button name="delete" onclick="editSub('Record',<%=id%>)">删除</button>
        </td>
    </tr>
    <%
        }
    } else if (subName.equals("Student")) {
    %>
    <form action="${pageContext.request.contextPath}/admin/SubManager.jsp" method="post">
        <input type="hidden" name="subName" value="Student" required><br>
        请输查询的属性：<input type="text" name="attributeValue" required><br>
        请输查询的值：<input type="text" name="parameterValue" required><br>
        <input type="submit" value="查询">
    </form>

    <%
        ArrayList studentArrayList = new StudentDB().studentArrayList(attributeV, parameterV);
    %>

    <table border="1">
        <tr>
            <th>序号</th>
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>电话号码</th>
            <th>班级</th>
            <th>专业</th>
            <th>操作
                <input type="button" value="新增" onclick="insertSub('Student')">
            </th>
        </tr>
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
            <td>
                <form action="StudentEdit.jsp" method="post">
                    <input type="hidden" name="id" value="<%=id%>">
                    <input type="hidden" name="stuID" value="<%=stuID%>">
                    <input type="hidden" name="stuName" value="<%=stuName%>">
                    <input type="hidden" name="stuSex" value="<%=stuSex%>">
                    <input type="hidden" name="stuAge" value="<%=stuAge%>">
                    <input type="hidden" name="stuPhoneNum" value="<%=stuPhoneNum%>">
                    <input type="hidden" name="stuClassNum" value="<%=stuClassNum%>">
                    <input type="hidden" name="stuProfessional" value="<%=stuProfessional%>">
                    <input type="submit" value="编辑">
                </form>
                <button name="delete" onclick="editSub('Student',<%=stuID%>)">删除</button>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    <%
    } else if (subName.equals("User")) {
    %>
    <form action="${pageContext.request.contextPath}/admin/SubManager.jsp" method="post">
        <input type="hidden" name="subName" value="User" required><br>
        请输查询的属性：<input type="text" name="attributeValue" required><br>
        请输查询的值：<input type="text" name="parameterValue" required><br>
        <input type="submit" value="查询">
    </form>

    <%
        ArrayList userArrayList = new UserDB().userArrayList(attributeV, parameterV);
    %>

    <table border="1">
        <tr>
            <th>序号</th>
            <th>用户名</th>
            <th>绑定学号</th>
            <th>操作
                <input type="button" value="新增" onclick="insertSub('User')">
            </th>
        </tr>
        <%
            for (int i = 0; i < userArrayList.size(); i++) {
                User user = (User) userArrayList.get(i);

                int id = user.getID();
                String userName = user.getUserName();
                String userPassword = user.getUserPassword();
                int stuID = user.getStuID();
        %>
        <tr>
            <td><%=id%>
            </td>
            <td><%=userName%>
            </td>
            <td><%=stuID%>
            </td>
            <td>
                <form action="UserEdit.jsp" method="post">
                    <input type="hidden" name="id" value="<%=id%>">
                    <input type="hidden" name="userName" value="<%=userName%>">
                    <input type="hidden" name="userPassword" value="<%=userPassword%>">
                    <input type="hidden" name="stuID" value="<%=stuID%>">
                    <input type="submit" value="编辑">
                </form>
                <button name="delete" onclick="editSub('User',<%=userName%>)">删除</button>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    <%
            }
        }
    %>
</table>
<script lang="javascript">
    function editSub(subName, attribute) {
        if (confirm("确认删除？")) {
            var tmp = document.createElement("form");
            var action = "${pageContext.request.contextPath}/AdminServlet?methodWay=delSub&subName=" + subName + "&attribute=" + attribute;
            tmp.action = action;
            tmp.method = "post";
            document.body.appendChild(tmp);
            tmp.submit();
        }
    }

    function insertSub(subName) {
        window.location.href = "NewSub.jsp?&subName=" + subName;
    }
</script>
</body>
</html>
