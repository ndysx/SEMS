package com.scareye.sems.utils;


import com.scareye.sems.db.EssDB;
import org.yaml.snakeyaml.Yaml;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Map;

public class Utils {

    public Map<String, Object> config() {
        File configFile = new File("E:\\JetBrains\\IDEA\\Projects\\SEMS\\src\\main\\resources\\config.yml");

        if (!configFile.exists()) {
            System.err.println("配置文件不存在，请创建。");
        }
        try {
            FileReader reader = new FileReader(configFile);
            BufferedReader buffer = new BufferedReader(reader);
            Map<String, Object> configMap = new Yaml().load(buffer);
            buffer.close();
            reader.close();
            return configMap;
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public String attributeChange(Object attributeV) {
        switch ((String) attributeV) {
            case "序号":
                attributeV = "id";
                break;
            case "学号":
            case "绑定学号":
                attributeV = "stuID";
                break;
            case "姓名":
                attributeV = "stuName";
                break;
            case "性别":
                attributeV = "stuSex";
                break;
            case "年龄":
                attributeV = "stuAge";
                break;
            case "手机号码":
                attributeV = "stuPhoneNum";
                break;
            case "班级":
                attributeV = "stuClassNum";
                break;
            case "专业":
                attributeV = "stuProfessional";
                break;
            case "体温":
                attributeV = "stuTemperature";
                break;
            case "核酸记录":
                attributeV = "ifDetected";
                break;
            case "身体状况":
                attributeV = "stuHealthSituation";
                break;
            case "日期":
                attributeV = "dateTime";
                break;
            case "用户名":
                attributeV = "userName";
                break;
            default:
                attributeV = "";
                break;
        }
        return (String) attributeV;
    }

    public boolean ifPasswordRight(String userType, String name, String password) {
        EssDB essDB = new EssDB();
        Connection connection = essDB.mysqlConnection();
        String adminInfoSql = "select * from " + userType + "s_sub where adminName=" + name;
        ResultSet adminSubRs = essDB.selectSql(connection, adminInfoSql);
        try {
            while (adminSubRs.next()) {
                if (name.equals(adminSubRs.getString(2)) && password.equals(adminSubRs.getString(3))) {
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
