package com.xc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.xc.service.UserMessageMappingService;

@Controller
public class UserMessageMapperController {
         @Autowired
         UserMessageMappingService mapperService;
}
