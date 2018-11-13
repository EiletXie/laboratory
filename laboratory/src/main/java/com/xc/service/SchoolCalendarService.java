package com.xc.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xc.bean.SchoolCalendar;
import com.xc.dao.SchoolCalendarMapper;

@Service
public class SchoolCalendarService {
         
    @Autowired
    SchoolCalendarMapper schoolCalendarMapper;
    
    public Date getStartDay(){
        return schoolCalendarMapper.selectByPrimaryKey(1).getStartday();
    }
    
    public void updateStartDay(SchoolCalendar schoolCalendar){
        schoolCalendarMapper.updateByPrimaryKey(schoolCalendar);
    }
}
