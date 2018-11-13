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
     * ����¼��İ༶����
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
     * ��json�����Ʒ������еİ༶����
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/classes",method=RequestMethod.GET)
    public Msg getClassesWithJson(@RequestParam(value="pn",defaultValue="1") Integer pn){
        //�����ҳ��ѯ��ʹ��PageHelper��ҳ����  
        //�ڲ�ѯ֮ǰ���뵱ǰҳ��Ȼ����ټ�¼  
        PageHelper.startPage(pn,8);
        List<Classlog> classes =  classlogService.getClasses();
        //ʹ��PageInfo��װ��ѯ�����ֻ��Ҫ��pageInfo����ҳ��Ϳ���
        PageInfo pageInfo = new PageInfo<>(classes,5);
        return Msg.success().add("pageInfo", pageInfo);
    }
}
