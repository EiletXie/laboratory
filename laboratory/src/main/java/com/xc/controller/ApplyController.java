package com.xc.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xc.bean.Apply;
import com.xc.bean.Msg;
import com.xc.service.ApplyService;

@Controller
@RequestMapping("/ApplyController")
public class ApplyController {
   
    @Autowired
    ApplyService applyService;
    
    
    
    /**
     * 获取给定时间的实验室对象申请信息
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/dateApply",method=RequestMethod.GET)
    public Msg getApplysWithJson(@RequestParam(value="pn",defaultValue="1") Integer pn,long applydate){
        System.out.println(applydate);
        Date  applydate1 = null;
        if(applydate == 0){
           applydate1 =   new Date();
        }else
        { 
            applydate1 =   new Date(applydate);
        }
        PageHelper.startPage(pn,5);
        List<Apply> applys = applyService.getApplysWithDate(applydate1);
        PageInfo<Apply> pageInfo = new PageInfo<Apply>(applys,5);
       return Msg.success().add("pageInfo", pageInfo);
    }
    
    /**
     * 模糊查询
     * @param blurredLabname
     * @param applydate
     * @return
     * @throws UnsupportedEncodingException
     */
    @ResponseBody
    @RequestMapping(value="blurredLabname",method=RequestMethod.GET)
    public Msg getblurredApplysWithJson(String blurredLabname,long applydate) throws UnsupportedEncodingException{
        blurredLabname  = new String(blurredLabname.getBytes("iso8859-1"),"utf-8");
        Date  applydate1 = null;
        if(applydate == 0){
           applydate1 =   new Date();
        }else
        { 
            applydate1 =   new Date(applydate);
        }
        PageHelper.startPage(1,5);
        List<Apply> applys = applyService.getApplysWithBlurredLabname(blurredLabname, applydate1);
        PageInfo<Apply> pageInfo = new PageInfo<Apply>(applys,5);
       return Msg.success().add("pageInfo", pageInfo);
    }
    
    @ResponseBody
    @RequestMapping(value="/apply",method=RequestMethod.POST)
    public Msg saveApply(Integer id,String period){
        Apply apply = applyService.getApplyById(id);
        String judge = period;
        if(judge.equals("one")){
            apply.setOne("1");
        }else if(judge.equals("three")){
            apply.setThree("1");
        }else if(judge.equals("five")){
            apply.setFive("1");
        }else if(judge.equals("seven")){
            apply.setSeven("1");
        }else if(judge.equals("nine")){
             apply.setNine("1");
        }
        
        applyService.updateApply(apply);
        return Msg.success();
    }
}
