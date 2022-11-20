package com.scareye.sems.service;

import com.scareye.sems.controlObject.HealthRecord;
import com.scareye.sems.controlObject.Student;
import com.scareye.sems.controlObject.User;
import com.scareye.sems.db.AdminDB;
import com.scareye.sems.db.HealthRecordDB;
import com.scareye.sems.db.StudentDB;
import com.scareye.sems.db.UserDB;

import java.sql.Connection;
import java.sql.Statement;

public class AdminService {
    AdminDB adminDB = new AdminDB();
    StudentDB studentDB = new StudentDB();

    public void insertSub(User user) {
        UserDB userDB = new UserDB();
        userDB.insertUser(user.getUserName(), user.getUserPassword());
    }

    public void insertSub(Student student) {

        studentDB.insertStudent(student);
    }

    public void insertSub(HealthRecord healthRecord) {
        HealthRecordDB healthRecordDB = new HealthRecordDB();
        healthRecordDB.insertRecord(healthRecord);
    }

    public void updateStudentInfo(Student student) {
        studentDB.updateStudentInfo(student);
    }

    public void updateRecordInfo(HealthRecord healthRecord) {
        new HealthRecordDB().updateRecordInfo(healthRecord);
    }

    public void updateUserInfo(User user) {
        new UserDB().updateUserInfo(user);
    }

    public void delSub(String subName, String attribute) {
        adminDB.delSub(subName, attribute);
    }
}
