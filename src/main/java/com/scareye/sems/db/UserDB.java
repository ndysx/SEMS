package com.scareye.sems.db;

import com.scareye.sems.controlObject.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.Objects;

public class UserDB extends EssDB {
    Connection connection = this.mysqlConnection();

    public void insertUser(String userName, String userPassword) {
        String insertUserSQL = "INSERT INTO users_sub(userName,userPassword,stuID) VALUES('" + userName + "','" + userPassword + "','0')";
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(insertUserSQL);
            statement.close();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList userArrayList(Object attributeV, Object parameterV) {
        ArrayList userList = new ArrayList();
        String userSubSql;
        // 核酸记录表
        if (attributeV == null | parameterV == null | Objects.equals(attributeV, "") | Objects.equals(parameterV, "")) {
            userSubSql = "select * from users_sub";
        } else {
            userSubSql = "select  * from users_sub where " + utils.attributeChange(attributeV) + "=" + parameterV;
        }

        try {
            PreparedStatement recordSubPs = connection.prepareStatement(userSubSql);
            ResultSet recordSubRs = recordSubPs.executeQuery();

            // 查询核酸记录表
            while (recordSubRs.next()) {
                // 实例化VO
                User user = new User(
                        // 学生信息
                        recordSubRs.getInt("id"),
                        recordSubRs.getString("userName"),
                        recordSubRs.getString("userPassword"),
                        recordSubRs.getInt("stuID")
                );
                userList.add(user);
            }
            recordSubRs.close();
            recordSubPs.close();

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return userList;
    }

    public void changeUserStuID(String userName, int stuID) {
        String userInfoSql = "UPDATE users_sub SET stuID=" + stuID + " WHERE userName=" + userName;
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(userInfoSql);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean ifBind(String userName) {
        String userInfoSql = "select * from users_sub where userName=" + userName;
        ResultSet userSubRs = this.selectSql(connection, userInfoSql);
        try {
            while (userSubRs.next()) {
                if (userName.equals(userSubRs.getString("userName")) && userSubRs.getInt("stuID") != 0) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public int getUserStuID(String userName) {
        String userInfoSql = "select * from users_sub where userName=" + userName;
        ResultSet userSubRs = this.selectSql(connection, userInfoSql);
        try {
            while (userSubRs.next()) {
                // 如果用户名=用户名，获取stuID
                if (userName.equals(userSubRs.getString("userName"))) {
                    return userSubRs.getInt("stuID");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean ifUserNameExited(String userName) {
        String userInfoSql = "select * from users_sub where userName=" + userName;
        ResultSet userSubRs = this.selectSql(connection, userInfoSql);
        try {
            if (userSubRs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void updateUserInfo(User user) {
        String updateUserInfoSql = "UPDATE users_sub SET " + " userName='" + user.getUserName() + "'," + " userPassword='" + user.getUserPassword() + "'," + " stuID='" + user.getStuID() + "'" + " WHERE id='" + user.getID() + "'";
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(updateUserInfoSql);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
