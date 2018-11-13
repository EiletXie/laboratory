package com.xc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xc.dao.UserMessageMappingMapper;

@Service
public class UserMessageMappingService {
       
    @Autowired
    UserMessageMappingMapper mappingMapper;
    
}
