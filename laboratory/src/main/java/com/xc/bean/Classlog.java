package com.xc.bean;

public class Classlog {
    private Integer classId;

    private String classname;

    private Integer number;

    private String grade;

    private String subject;

    
    public Classlog() {
        super();
    }

    public Classlog(Integer classId, String classname, Integer number, String grade, String subject) {
        super();
        this.classId = classId;
        this.classname = classname;
        this.number = number;
        this.grade = grade;
        this.subject = subject;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname == null ? null : classname.trim();
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade == null ? null : grade.trim();
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject == null ? null : subject.trim();
    }

    @Override
    public String toString() {
        return "Classlog [classId=" + classId + ", classname=" + classname + ", number=" + number + ", grade=" + grade
                + ", subject=" + subject + "]";
    }
    
    
}