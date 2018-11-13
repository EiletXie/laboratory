package com.xc.dao;

import com.xc.bean.Classlog;
import com.xc.bean.ClasslogExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ClasslogMapper {
    long countByExample(ClasslogExample example);

    int deleteByExample(ClasslogExample example);

    int deleteByPrimaryKey(Integer classId);

    int insert(Classlog record);

    int insertSelective(Classlog record);

    List<Classlog> selectByExample(ClasslogExample example);

    Classlog selectByPrimaryKey(Integer classId);

    int updateByExampleSelective(@Param("record") Classlog record, @Param("example") ClasslogExample example);

    int updateByExample(@Param("record") Classlog record, @Param("example") ClasslogExample example);

    int updateByPrimaryKeySelective(Classlog record);

    int updateByPrimaryKey(Classlog record);
}