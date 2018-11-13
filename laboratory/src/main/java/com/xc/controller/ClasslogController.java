package com.xc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xc.bean.Classlog;
import com.xc.bean.Msg;
import com.xc.service.ClasslogService;

@Controller
public class ClasslogController {
         
    @Autowired
    ClasslogService classlogService;
    
    /**
     * 保存录入的班级对象
     * @param c
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/class",method=RequestMethod.POST)
    public Msg saveClass(Classlog c){
        classlogService.saveClass(c);
        return Msg.success().add("classname", c.getClassname());
    }
    
    /**
     * 以json的形势返回所有的班级对象
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/classes",method=RequestMethod.GET)
    public Msg getClassesWithJson(@RequestParam(value="pn",defaultValue="1") Integer pn){
        //引入分页查询，使用PageHelper分页功能  
        //在查询之前传入当前页，然后多少记录  
        PageHelper.startPage(pn,8);
        List<Classlog> classes =  classlogService.getClasses();
        //使用PageInfo包装查询结果，只需要将pageInfo交给页面就可以
        PageInfo pageInfo = new PageInfo<>(classes,5);
        return Msg.success().add("pageInfo", pageInfo);
    }
}
