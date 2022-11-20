package com.scareye.sems.db;

import com.scareye.sems.utils.Utils;

import java.sql.*;
import java.util.Map;

public class EssDB {
    Utils utils = new Utils();


    /**
     * 链接数据库
     *
     * @return connection
     */
    public Connection mysqlConnection() {
        Connection connection = null;
        Map<String, Object> configReader = utils.config();
        try {
            // 获取链接
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://" + configReader.get("mysql_url") + "?characterEncoding=utf-8&serverTimezone=GMT%2B8";
            String username = (String) configReader.get("mysql_username");
            String password = (String) configReader.get("mysql_password");
            connection = DriverManager.getConnection(url, username, password);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    /**
     * 基础查询方法
     *
     * @param connection 连接
     * @param sql        SQL语句
     * @return resultSet
     */
    public ResultSet selectSql(Connection connection, String sql) {
        PreparedStatement preparedStatement;
        ResultSet resultSet;
        try {
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return resultSet;
    }


}

