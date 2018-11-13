package com.xc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xc.bean.Course;
import com.xc.bean.CourseExample;
import com.xc.bean.CourseExample.Criteria;
import com.xc.dao.CourseMapper;

@Service
public class CourseService {
        
    @Autowired
    CourseMapper courseMapper;

    public void insertCourse(Course course) {
         courseMapper.insertSelective(course);
    }

    public List<Course> getCourses() {
        return courseMapper.selectByExample(null);
    }

    public List<Course> getBlurredCourse(String blurredCourse) {
        CourseExample example = new CourseExample();
        Criteria criteria = example.createCriteria();
        String courseName = "%" + blurredCourse + "%";
        criteria.andCoursenameLike(courseName);
        return courseMapper.selectByExample(example);
    }
}
