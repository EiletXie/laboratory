package com.xc.dao;

import com.xc.bean.UserMessageMapping;
import com.xc.bean.UserMessageMappingExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserMessageMappingMapper {
    long countByExample(UserMessageMappingExample example);

    int deleteByExample(UserMessageMappingExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(UserMessageMapping record);

    int insertSelective(UserMessageMapping record);

    List<UserMessageMapping> selectByExample(UserMessageMappingExample example);

    UserMessageMapping selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") UserMessageMapping record, @Param("example") UserMessageMappingExample example);

    int updateByExample(@Param("record") UserMessageMapping record, @Param("example") UserMessageMappingExample example);

    int updateByPrimaryKeySelective(UserMessageMapping record);

    int updateByPrimaryKey(UserMessageMapping record);
}