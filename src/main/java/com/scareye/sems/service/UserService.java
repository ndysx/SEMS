package com.scareye.sems.service;


import com.scareye.sems.controlObject.Student;
import com.scareye.sems.db.StudentDB;
import com.scareye.sems.db.UserDB;

public class UserService {
    UserDB userDB = new UserDB();
    StudentDB studentDB = new StudentDB();

    public boolean ifBind(String userName) {
        return userDB.ifBind(userName);
    }

    public Student getStudentInfo(int stuID) {
        return studentDB.getStudentInfo(stuID);
    }

    public int getUserStuID(String userName) {
        return userDB.getUserStuID(userName);
    }

    public void changeUserStuID(String userName, int stuID) {
        userDB.changeUserStuID(userName, stuID);
    }

    public void deleteStudentSQL(int stuID) {
        studentDB.deleteStudent(stuID);
    }

    public void insertUser(String userName, String userPassword) {
        userDB.insertUser(userName, userPassword);
    }

    public boolean ifUserNameExited(String userName) {
        return userDB.ifUserNameExited(userName);
    }
}
