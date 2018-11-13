package com.xc.controller;

import java.util.Date;
import java.util.List;
import java.io.UnsupportedEncodingException;
import java.util.Calendar;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xc.bean.Laboratory;
import com.xc.bean.Msg;
import com.xc.service.LaboratoryService;

@Controller
public class LaboratoryController {
     
	@Autowired
	LaboratoryService labratoryService;
	
	
	@ResponseBody
	@RequestMapping(value="/addLaboratory",method=RequestMethod.POST)
	public Msg addLabroom(@Valid Laboratory lab){
		System.out.println(lab);
		labratoryService.saveLabroom(lab);
		return Msg.success().add("labname",lab.getLabname());
	}
	
	Date alterTime = new Date();
	@ResponseBody
    @RequestMapping(value="/laboratoryController/getTime",method=RequestMethod.GET)
    public Msg addLabroom(Integer flag){
         if(flag == 0){
         }else if(flag == 1){
             Calendar c = Calendar.getInstance();
             c.setTime(alterTime);
             c.add(Calendar.DAY_OF_MONTH, 1);
             alterTime =  c.getTime();
         }else{
             Calendar c = Calendar.getInstance();
             c.setTime(alterTime);
             c.add(Calendar.DAY_OF_MONTH, -1);
             alterTime =  c.getTime();
         }
         return Msg.success().add("alterTime",alterTime);
    }
	
	@ResponseBody
    @RequestMapping(value="/LaboratoryController/blurredLabname",method=RequestMethod.GET)
    public Msg getBlurredLabname(@RequestParam(value="pn",defaultValue="1") Integer pn,String blurredLabname) throws UnsupportedEncodingException{
	    blurredLabname = new String(blurredLabname.getBytes("iso8859-1"),"utf-8");
	    List<Laboratory> labs = labratoryService.getBlurredLabname(blurredLabname);
	    PageHelper.startPage(pn,5);
	    PageInfo<Laboratory> pageInfo = new PageInfo<>(labs,5);
	    return Msg.success().add("pageInfo", pageInfo);
	}
}
