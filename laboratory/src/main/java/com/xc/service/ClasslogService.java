package com.xc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xc.bean.Classlog;
import com.xc.dao.ClasslogMapper;

@Service
public class ClasslogService {
         
   @Autowired
   ClasslogMapper classlogMapper;

    public void saveClass(Classlog c) {
        classlogMapper.insertSelective(c);
    }

    public List<Classlog> getClasses() {
        return classlogMapper.selectByExample(null);
    }
}
