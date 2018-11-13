package com.xc.bean;

public class Course {
    private Integer courseId;

    private String coursename;

    
    public Course() {
        super();
    }

    public Course(Integer courseId, String coursename) {
        super();
        this.courseId = courseId;
        this.coursename = coursename;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public String getCoursename() {
        return coursename;
    }

    public void setCoursename(String coursename) {
        this.coursename = coursename == null ? null : coursename.trim();
    }
    
    
}