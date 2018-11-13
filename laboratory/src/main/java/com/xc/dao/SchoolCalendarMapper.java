package com.xc.dao;

import com.xc.bean.SchoolCalendar;
import com.xc.bean.SchoolCalendarExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SchoolCalendarMapper {
    long countByExample(SchoolCalendarExample example);

    int deleteByExample(SchoolCalendarExample example);

    int deleteByPrimaryKey(Integer lenId);

    int insert(SchoolCalendar record);

    int insertSelective(SchoolCalendar record);

    List<SchoolCalendar> selectByExample(SchoolCalendarExample example);

    SchoolCalendar selectByPrimaryKey(Integer lenId);

    int updateByExampleSelective(@Param("record") SchoolCalendar record, @Param("example") SchoolCalendarExample example);

    int updateByExample(@Param("record") SchoolCalendar record, @Param("example") SchoolCalendarExample example);

    int updateByPrimaryKeySelective(SchoolCalendar record);

    int updateByPrimaryKey(SchoolCalendar record);
}