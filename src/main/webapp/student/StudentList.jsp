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
</head>
<body>

<form action="StudentList.jsp" method="post">
    请输查询的属性：<input type="text" name="attributeValue" required><br>
    请输查询的值：<input type="text" name="parameterValue" required><br>
    <input type="submit" value="查询">
</form>

<%
    // 获取查询的班级信息
    request.setCharacterEncoding("UTF-8");
    String attributeV = request.getParameter("attributeValue");
    String parameterV = request.getParameter("parameterValue");

    // 根据属性、参数查看对应列表信息
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
    </tr>
    <%
        }
    %>
</table>

</body>
</html>
