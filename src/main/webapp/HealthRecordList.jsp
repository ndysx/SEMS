<%--
  Created by IntelliJ IDEA.
  User: 17TheWord
  Date: 2022/10/30
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.scareye.sems.db.HealthRecordDB" %>
<%@ page import="com.scareye.sems.controlObject.HealthRecord" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>核酸记录列表</title>
</head>
<body>

<form action="HealthRecordList.jsp" method="post">
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
            String stuHeathSituation = healthRecord.getStuHealthSituation();
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
        <td><%=stuHeathSituation%>
        </td>
        <td><%=dateTime%>
        </td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>
