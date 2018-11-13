package com.xc.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xc.bean.Msg;
import com.xc.bean.SchoolCalendar;
import com.xc.service.SchoolCalendarService;

@Controller
@RequestMapping("/SchoolCalendarController")
public class SchoolCalendarController {
   
    @Autowired
    SchoolCalendarService schoolCalendarService;
    
    @ResponseBody
    @RequestMapping(value="/startDay",method=RequestMethod.GET)
    public Msg getStartDay(){
        return Msg.success().add("startDay", schoolCalendarService.getStartDay());
    }
    
    @ResponseBody
    @RequestMapping(value="/startDay",method=RequestMethod.PUT)
    public void getStartDay(String startDay) throws ParseException{
        SchoolCalendar schoolCalendar = new SchoolCalendar();
        schoolCalendar.setLenId(1);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = format.parse(startDay);
        schoolCalendar.setStartday(date);
        System.out.println(schoolCalendar.getStartday());
        schoolCalendarService.updateStartDay(schoolCalendar);
    }
}
