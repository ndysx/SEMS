package com.scareye.sems.db;

import com.scareye.sems.controlObject.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.Objects;

public class StudentDB extends EssDB {
    Connection connection = this.mysqlConnection();

    public ArrayList studentArrayList(Object attributeV, Object parameterV) {
        Connection connection = new EssDB().mysqlConnection();
        ArrayList studentList = new ArrayList();
        String studentSubSql;
        // 核酸记录表
        if (attributeV == null | parameterV == null | Objects.equals(attributeV, "") | Objects.equals(parameterV, "")) {
            studentSubSql = "select * from students_sub";
        } else {
            studentSubSql = "select  * from students_sub where " + attributeV + "=" + parameterV;
        }

        try {
            PreparedStatement recordSubPs = connection.prepareStatement(studentSubSql);
            ResultSet recordSubRs = recordSubPs.executeQuery();

            // 查询核酸记录表
            while (recordSubRs.next()) {
                // 实例化VO
                Student student = new Student(
                        // 学生信息
                        recordSubRs.getInt("id"),
                        recordSubRs.getInt("stuID"),
                        recordSubRs.getString("stuName"),
                        recordSubRs.getString("stuSex"),
                        recordSubRs.getInt("stuAge"),
                        recordSubRs.getString("stuPhoneNum"),
                        recordSubRs.getString("stuClassNum"),
                        recordSubRs.getString("stuProfessional")
                );
                studentList.add(student);
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
        return studentList;
    }

    public void insertStudent(Student student) {
        Connection connection = new EssDB().mysqlConnection();
        String insertStudentSQL = "INSERT INTO students_sub" +
                "(stuID,stuName,stuSex,stuAge,stuPhoneNum,stuClassNum,stuProfessional) VALUES('" +
                student.getStuID() + "','" + student.getStuName() + "','" + student.getStuSex() + "','" + student.getStuAge() + "','" +
                student.getStuPhoneNum() + "','" + student.getStuClassNum() + "','" + student.getStuProfessional() + "')";
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(insertStudentSQL);
            statement.close();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void deleteStudent(int stuID) {
        Connection connection = this.mysqlConnection();
        String deleteStudentSQL = "delete from students_sub where stuID=" + stuID;
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(deleteStudentSQL);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Student getStudentInfo(int stuID) {
        String studentInfoSql = "select * from students_sub";
        ResultSet studentSubRs = this.selectSql(connection, studentInfoSql);
        try {
            while (studentSubRs.next()) {
                if (studentSubRs.getInt("stuID") == stuID) {
                    return new Student(
                            studentSubRs.getInt("id"),
                            studentSubRs.getInt("stuID"),
                            studentSubRs.getString("stuName"),
                            studentSubRs.getString("stuSex"),
                            studentSubRs.getInt("stuAge"),
                            studentSubRs.getString("stuPhoneNum"),
                            studentSubRs.getString("stuClassNum"),
                            studentSubRs.getString("stuProfessional")
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void updateStudentInfo(Student student) {
        String updateStudentInfoSql = "UPDATE students_sub SET " + " stuID='" + student.getStuID() + "'," + " stuName='" + student.getStuName() + "'," + " stuSex='" + student.getStuID() + "'," + " stuAge='" + student.getStuAge() + "'," + " stuPhoneNum='" + student.getStuPhoneNum() + "'," + " stuClassNum='" + student.getStuClassNum() + "'," + " stuProfessional='" + student.getStuProfessional() + "'" + " WHERE id='" + student.getID() + "'";
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(updateStudentInfoSql);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
