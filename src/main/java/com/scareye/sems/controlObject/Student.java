package com.scareye.sems.controlObject;

public class Student {

    private int id;
    private int stuID;
    private String stuName;
    private String stuSex;
    private int stuAge;
    private String stuPhoneNum;
    private String stuClassNum;
    private String stuProfessional;

    public Student() {
    }

    public Student(int id, int stuID, String stuName, String stuSex, int stuAge, String stuPhoneNum, String stuClassNum, String stuProfessional) {
        this.id = id;
        this.stuID = stuID;
        this.stuName = stuName;
        this.stuSex = stuSex;
        this.stuAge = stuAge;
        this.stuPhoneNum = stuPhoneNum;
        this.stuClassNum = stuClassNum;
        this.stuProfessional = stuProfessional;
    }

    public int getID() {
        return id;
    }

    public void setID(int id) {
        this.id = id;
    }

    public int getStuID() {
        return stuID;
    }

    public void setStuID(int stuID) {
        this.stuID = stuID;
    }

    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    public String getStuSex() {
        return stuSex;
    }

    public void setStuSex(String stuSex) {
        this.stuSex = stuSex;
    }

    public int getStuAge() {
        return stuAge;
    }

    public void setStuAge(int stuAge) {
        this.stuAge = stuAge;
    }

    public String getStuPhoneNum() {
        return stuPhoneNum;
    }

    public void setStuPhoneNum(String stuPhoneNum) {
        this.stuPhoneNum = stuPhoneNum;
    }

    public String getStuClassNum() {
        return stuClassNum;
    }

    public void setStuClassNum(String stuClassNum) {
        this.stuClassNum = stuClassNum;
    }

    public String getStuProfessional() {
        return stuProfessional;
    }

    public void setStuProfessional(String stuProfessional) {
        this.stuProfessional = stuProfessional;
    }
}
