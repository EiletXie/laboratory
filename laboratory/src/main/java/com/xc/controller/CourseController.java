package com.xc.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xc.bean.Course;
import com.xc.bean.Msg;
import com.xc.service.CourseService;

@Controller
@RequestMapping("/CourseController")
public class CourseController {

    @Autowired
    CourseService courseService;
    
    @ResponseBody
    @RequestMapping(value="/course",method=RequestMethod.POST)
    public Msg saveCourse(Course course){
        courseService.insertCourse(course);
        return Msg.success().add("coursename", course.getCoursename());
    }
    
    @ResponseBody
    @RequestMapping(value="/course",method=RequestMethod.GET)
    public Msg getCoursesWithJson(@RequestParam(value="pn",defaultValue="1") Integer pn){
        List<Course> courses = courseService.getCourses();
        PageHelper.startPage(pn,10);
        PageInfo<Course> pageInfo = new PageInfo<Course>(courses,4);
        return Msg.success().add("pageInfo", pageInfo);
    }
    
    @ResponseBody
    @RequestMapping(value="/blurredCourse",method=RequestMethod.GET)
    public Msg getblurredCoursesWithJson(String blurredCourse) throws UnsupportedEncodingException{
        blurredCourse  = new String(blurredCourse.getBytes("iso8859-1"),"utf-8");
        List<Course> courses = courseService.getBlurredCourse(blurredCourse);
        PageHelper.startPage(1,4);
        PageInfo<Course> pageInfo = new PageInfo<Course>(courses,4);
        return Msg.success().add("pageInfo", pageInfo);
    }
}
