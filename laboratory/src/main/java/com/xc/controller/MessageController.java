package com.xc.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xc.bean.Message;
import com.xc.bean.Msg;
import com.xc.service.MessageService;

@Controller
public class MessageController {

     @Autowired
     MessageService messageService;
     
     /**
      * ±£´æÍ¨Öª
      * @param message
      * @return
      */
     @ResponseBody
     @RequestMapping(value="/message",method=RequestMethod.POST)
     public Msg saveMessage(@Valid Message message){
         Date sendTime = new Date();
//         DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//         String time= sdf.format(sendTime);
         message.setSendtime(sendTime);
         messageService.saveMessage(message);
         return Msg.success();
     }
     
     @ResponseBody
     @RequestMapping(value="/MessageController/systemMessage",method=RequestMethod.GET)
     public Msg getMessageWithJson(@RequestParam(value="pn",defaultValue="1") Integer pn,Model model){
         PageHelper.startPage(pn,6);
         List<Message> messages =  messageService.getMessages();
         PageInfo<Message> page = new PageInfo<Message>(messages,6);
         return Msg.success().add("pageInfo", page);
     } 
}
