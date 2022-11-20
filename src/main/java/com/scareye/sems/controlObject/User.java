package com.scareye.sems.controlObject;

public class User {
    private int ID;
    private String userName;
    private String userPassword;
    private int stuID;

    public User() {
    }

    public User(int ID, String userName, String userPassword, int stuID) {
        this.ID = ID;
        this.userName = userName;
        this.userPassword = userPassword;
        this.stuID = stuID;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public int getStuID() {
        return stuID;
    }

    public void setStuID(int stuID) {
        this.stuID = stuID;
    }
}
