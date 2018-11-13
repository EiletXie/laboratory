package com.xc.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xc.bean.Logs;
import com.xc.bean.Msg;
import com.xc.service.LogsService;
import com.xc.service.RecordService;

@Controller
@RequestMapping("/LogsController")
public class LogsController {
        
         @Autowired
         LogsService logsService;
         
         
         @ResponseBody
         @RequestMapping(value="/logs",method=RequestMethod.GET)
         public Msg getLogs(@RequestParam(value="pn",defaultValue="1") Integer pn){
             PageHelper.startPage(pn,5);
             List<Logs> logs = logsService.getLogs();
             PageInfo<Logs> pageInfo = new PageInfo<Logs>(logs,5);
             return Msg.success().add("pageInfo", pageInfo);
         }
         
         /**
          * 只查询给定用户名名下的实验室相关申请记录
          * @param pn
          * @return
         * @throws UnsupportedEncodingException 
          */
        @ResponseBody
         @RequestMapping(value="/labTeacherLogs",method=RequestMethod.GET)
         public Msg getLabTeacherLogs(@RequestParam(value="pn",defaultValue="1") Integer pn,String labname) throws UnsupportedEncodingException{
            String name = new String(labname.getBytes("iso8859-1"),"utf-8"); 
            List<Logs> labTeacherLogs = logsService.getLabTeacherLogs(name);
            PageHelper.startPage(pn,5);
            //紧跟着的第一个select方法会被分页
            //目前无法解决直接将一个数组给pageInfo让它分页问题
             PageInfo<Logs> pageInfo = new PageInfo<Logs>(labTeacherLogs,5);
             return Msg.success().add("pageInfo", pageInfo);
         }
         
         @ResponseBody
         @RequestMapping(value="/applyRecord",method=RequestMethod.POST)
         public Msg insertLogs(Integer id){
             Logs log = new Logs(null,id,"0");
             logsService.insertlog(log);
             return Msg.success();
         }
         
         /**
          * 插入一条同意申请记录的日志信息
          * @param reqId
          * @return
          */
         @ResponseBody
         @RequestMapping(value="/agreeRecord",method=RequestMethod.POST)
         public Msg agreeRecord(Integer id){
             Logs log = new Logs(null,id,"1");
             logsService.insertlog(log);
             return Msg.success();
         }
         
         @ResponseBody
         @RequestMapping(value="/disagreeRecord",method=RequestMethod.POST)
         public Msg disagreeRecord(Integer id,String reason){
             System.out.println(reason);
             Logs log = new Logs(null,id,"2");
             logsService.insertlog(log);
             return Msg.success();
         }
}
