package com.scareye.sems.controlObject;

public class HealthRecord extends Student {
    private double stuTemperature;
    private Boolean ifDetected;
    private String stuHealthSituation;
    private String dateTime;

    public HealthRecord() {
    }

    public HealthRecord(int id, int stuID, String stuName, String stuSex, int stuAge, String stuPhoneNum, String stuClassNum, String stuProfessional, double stuTemperature, Boolean ifDetected, String stuHealthSituation, String dateTime) {
        super(id, stuID, stuName, stuSex, stuAge, stuPhoneNum, stuClassNum, stuProfessional);
        this.stuTemperature = stuTemperature;
        this.ifDetected = ifDetected;
        this.stuHealthSituation = stuHealthSituation;
        this.dateTime = dateTime;
    }

    public double getStuTemperature() {
        return stuTemperature;
    }

    public void setStuTemperature(double stuTemperature) {
        this.stuTemperature = stuTemperature;
    }

    public Boolean getIfDetected() {
        return ifDetected;
    }

    public void setIfDetected(Boolean ifDetected) {
        this.ifDetected = ifDetected;
    }

    public String getStuHealthSituation() {
        return stuHealthSituation;
    }

    public void setStuHealthSituation(String stuHealthSituation) {
        this.stuHealthSituation = stuHealthSituation;
    }

    public String getDateTime() {
        return dateTime;
    }

    public void setDateTime(String dateTime) {
        this.dateTime = dateTime;
    }
}
