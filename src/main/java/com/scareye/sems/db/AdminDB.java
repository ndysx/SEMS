package com.scareye.sems.db;

import com.scareye.sems.service.UserService;

import java.sql.Connection;
import java.sql.Statement;

public class AdminDB extends EssDB {
    Connection connection = this.mysqlConnection();

    public void delSub(String subName, String attribute) {
        String deleteSubSQL;
        String temp1;
        String temp2;
        try {
            Statement statement = connection.createStatement();
            switch (subName) {
                case "Student":
                    // 删除该学生信息
                    deleteSubSQL = "delete from students_sub where stuID=" + attribute;
                    // 删除该学生核酸记录
                    temp1 = "delete from records_sub where stuID=" + attribute;
                    // 将与该学生绑定的用户stuID设为0
                    temp2 = "update users_sub set stuID=0 where stuID=" + attribute;
                    statement.executeUpdate(deleteSubSQL);
                    statement.executeUpdate(temp1);
                    statement.executeUpdate(temp2);
                    break;
                case "User":
                    // 删除该用户信息
                    deleteSubSQL = "delete from users_sub where userName=" + attribute;
                    // 删除该用户对应学生信息
                    UserService userService = new UserService();
                    int tempUserStuID = userService.getUserStuID(attribute);
                    temp1 = "delete from students_sub where stuID=" + tempUserStuID;
                    // 删除该学生核酸记录
                    temp2 = "delete from records_sub where stuID=" + tempUserStuID;
                    statement.executeUpdate(deleteSubSQL);
                    statement.executeUpdate(temp1);
                    statement.executeUpdate(temp2);
                    break;
                case "Record":
                    // 删除该条记录
                    deleteSubSQL = "delete from records_sub where id=" + attribute;
                    statement.executeUpdate(deleteSubSQL);
                    break;
            }
            connection.close();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
