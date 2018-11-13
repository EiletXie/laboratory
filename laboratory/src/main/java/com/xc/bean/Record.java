package com.xc.bean;

import java.util.Date;

public class Record {
    private Integer reqId;

    private String username;

    private Date reqdate;

    private String labname;

    private String period;

    private String classname;

    private String subject;

    private String course;

    private String assistant;

    private String endrecord;

    private Integer checkread;

    public Integer getReqId() {
        return reqId;
    }

    public void setReqId(Integer reqId) {
        this.reqId = reqId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public Date getReqdate() {
        return reqdate;
    }

    public void setReqdate(Date reqdate) {
        this.reqdate = reqdate;
    }

    public String getLabname() {
        return labname;
    }

    public void setLabname(String labname) {
        this.labname = labname == null ? null : labname.trim();
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period == null ? null : period.trim();
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname == null ? null : classname.trim();
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject == null ? null : subject.trim();
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course == null ? null : course.trim();
    }

    public String getAssistant() {
        return assistant;
    }

    public void setAssistant(String assistant) {
        this.assistant = assistant == null ? null : assistant.trim();
    }

    public String getEndrecord() {
        return endrecord;
    }

    public void setEndrecord(String endrecord) {
        this.endrecord = endrecord == null ? null : endrecord.trim();
    }

    public Integer getCheckread() {
        return checkread;
    }

    public void setCheckread(Integer checkread) {
        this.checkread = checkread;
    }

    public Record(Integer reqId, String username, Date reqdate, String labname, String period, String classname,
            String subject, String course, String assistant, String endrecord, Integer checkread) {
        super();
        this.reqId = reqId;
        this.username = username;
        this.reqdate = reqdate;
        this.labname = labname;
        this.period = period;
        this.classname = classname;
        this.subject = subject;
        this.course = course;
        this.assistant = assistant;
        this.endrecord = endrecord;
        this.checkread = checkread;
    }

    public Record() {
        super();
    }

    @Override
    public String toString() {
        return "Record [reqId=" + reqId + ", username=" + username + ", reqdate=" + reqdate + ", labname=" + labname
                + ", period=" + period + ", classname=" + classname + ", subject=" + subject + ", course=" + course
                + ", assistant=" + assistant + ", endrecord=" + endrecord + ", checkread=" + checkread + "]";
    }
    
    
}