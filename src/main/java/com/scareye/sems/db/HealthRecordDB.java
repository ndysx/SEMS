package com.scareye.sems.db;

import com.scareye.sems.controlObject.HealthRecord;

import java.sql.*;
import java.util.ArrayList;
import java.util.Objects;

public class HealthRecordDB extends EssDB {
    Connection connection = this.mysqlConnection();
    public ArrayList healthRecordArrayList(Object attributeV, Object parameterV) {
        HealthRecordDB healthRecordDao = new HealthRecordDB();
        Connection connection = healthRecordDao.mysqlConnection();

        ArrayList healthRecordList = new ArrayList();
        String recordSubSql;
        // 核酸记录表
        if (attributeV == null | parameterV == null | Objects.equals(attributeV, "") | Objects.equals(parameterV, "")) {
            recordSubSql = "select * from records_sub";
        } else {
            recordSubSql = "select  * from records_sub where " + utils.attributeChange(attributeV) + "=" + parameterV;
        }

        try {
//            PreparedStatement recordSubPs = connection.prepareStatement(recordSubSql);

            ResultSet recordSubRs = healthRecordDao.selectSql(connection, recordSubSql);

            // 查询核酸记录表
            while (recordSubRs.next()) {
                // 实例化VO
                HealthRecord healthRecord = new HealthRecord(
                        // 学生信息
                        recordSubRs.getInt("id"),
                        recordSubRs.getInt("stuID"),
                        recordSubRs.getString("stuName"),
                        recordSubRs.getString("stuSex"),
                        recordSubRs.getInt("stuAge"),
                        recordSubRs.getString("stuPhoneNum"),
                        recordSubRs.getString("stuClassNum"),
                        recordSubRs.getString("stuProfessional"),
                        // 核酸信息
                        recordSubRs.getDouble("stuTemperature"),
                        recordSubRs.getBoolean("ifDetected"),
                        recordSubRs.getString("stuHealthSituation"),
                        recordSubRs.getString("dateTime")
                );
                healthRecordList.add(healthRecord);
            }
            recordSubRs.close();
//            recordSubPs.close();

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
        return healthRecordList;
    }

    public void insertRecord(HealthRecord healthRecord) {
        int ifDetected = 0;
        if (healthRecord.getIfDetected()) {
            ifDetected = 1;
        }
        Connection connection = new EssDB().mysqlConnection();
        String insertRecordSub = "insert into records_sub " +
                "(stuID,stuName,stuSex,stuAge,stuPhoneNum,stuClassNum,stuProfessional,stuTemperature,ifDetected,stuHealthSituation,dateTime) " +
                "VALUES ('" + healthRecord.getStuID() + "','" + healthRecord.getStuName() + "','" + healthRecord.getStuSex() + "','" +
                healthRecord.getStuAge() + "','" + healthRecord.getStuPhoneNum() + "','" + healthRecord.getStuClassNum() + "','" +
                healthRecord.getStuProfessional() + "','" + healthRecord.getStuTemperature() + "','" + ifDetected +
                "','" + healthRecord.getStuHealthSituation() + "','" + healthRecord.getDateTime() + "')";
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(insertRecordSub);
            statement.close();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void updateRecordInfo(HealthRecord healthRecord) {
        int ifDetected;
        if (healthRecord.getIfDetected()) {
            ifDetected = 1;
        } else {
            ifDetected = 0;
        }
        String updateStudentInfoSql = "UPDATE records_sub SET " + " stuID='" + healthRecord.getStuID() + "'," + " stuName='" + healthRecord.getStuName() + "'," + " stuSex='" + healthRecord.getStuSex() + "'," + " stuAge='" + healthRecord.getStuAge() + "'," + " stuPhoneNum='" + healthRecord.getStuPhoneNum() + "'," + " stuClassNum='" + healthRecord.getStuClassNum() + "'," + " stuProfessional='" + healthRecord.getStuProfessional() + "'," + " stuTemperature='" + healthRecord.getStuTemperature() + "'," + " ifDetected='" + ifDetected + "'," + " stuHealthSituation='" + healthRecord.getStuHealthSituation() + "'," + " dateTime='" + healthRecord.getDateTime() + "'" + " WHERE id='" + healthRecord.getID() + "'";
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(updateStudentInfoSql);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
