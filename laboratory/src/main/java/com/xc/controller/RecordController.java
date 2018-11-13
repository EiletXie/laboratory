package com.xc.controller;


import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xc.bean.Msg;
import com.xc.bean.Record;
import com.xc.service.ApplyService;
import com.xc.service.LogsService;
import com.xc.service.RecordService;
import com.xc.service.SchoolCalendarService;

@Controller
@RequestMapping("/RecordController")
public class RecordController {
        
    @Autowired
    RecordService recordService;
    
    @Autowired
    ApplyService applyService;
    
    @Autowired
    LogsService logsService;
    
    @Autowired
    SchoolCalendarService schoolCalendarService;
    
    /**
     * 插入初始的申请数据，即未包含实验室老师的judge字段和结课记录endrecord
     * @param log
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/record",method=RequestMethod.POST)
    public Msg saveLogs(Record record){
        System.out.println(record);
         recordService.insertRecord(record);
         int id = record.getReqId();
        return Msg.success().add("id", id);
    }
    
    /**
     * 多时间段的record插入，需要额外添加applydate，period字段
     * @param log
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/mutipleRecord",method=RequestMethod.POST)
    public Msg savemutipleRecord(String username,String subject,String classname,String labname,String course,String assistant,long applydate,String period){
        Record record = new Record();
        record.setAssistant(assistant);
        record.setClassname(classname);
        record.setCourse(course);
        record.setSubject(subject);
        record.setUsername(username);
        record.setLabname(labname);
        Date reqdate = new Date(applydate);
        record.setReqdate(reqdate);
        record.setPeriod(period);
        System.out.println(record);
         recordService.insertRecord(record);
         int id = record.getReqId();
        return Msg.success().add("id", id);
    }
    
    /**
     * 提交多时段的课时申请记录
     * @param log
     * @return 返回可供用户看到时段信息，还应该有一个相应的时间数组，专门用来分析和存入记录数据
     * @throws UnsupportedEncodingException 
     * @throws ParseException 
     */
    @ResponseBody
    @RequestMapping(value="/mutlipleRecords",method=RequestMethod.POST)
    public Msg saveMultiplerecords(String labname,String info) throws UnsupportedEncodingException, ParseException{
          //为什么labname不转不会乱码，转了反而乱码了
        //labname  = new String(labname.getBytes("iso8859-1"),"utf-8");
        info  = new String(info.getBytes("iso8859-1"),"utf-8");
        System.out.println(labname+" "+info);
        String[] str = info.split("-");
        String weekday[] = {"星期一","星期二","星期三","星期四","星期五","星期六","星期天"};
        String dayperiods[] = {"第一 二节","第三 四节","第五 六节","第七 八节","第九 十一节"};
        String weeks[] = {"第一周","第二周","第三周","第四周","第五周","第六周","第七周","第八周","第九周","第十周","第十一周","第十二周",
                "第十三周","第十四周","第十五周","第十六周"};
        String periods[] = {"one","three","five","seven","nine"};
        int startWeek = Integer.parseInt(str[str.length - 2]);
        int endWeek = Integer.parseInt(str[str.length-1]);
        String applysInfo =   weeks[startWeek - 1] + " 到 " + weeks[endWeek - 1] + " |";
        //建立一个时间数组，用于存放申请的时间当天，一个字段数组，存放对于当天的申请时间段
        int num = (endWeek - startWeek + 1) * (str.length - 2);
        Date applydates[] = new Date[num];
        String applyperiods[]= new String[num];
        Date startDay = schoolCalendarService.getStartDay();
        for(int c = 0; c <= endWeek - startWeek ; c++){
            Date d = addWeekDate(startWeek+c,startDay);//申请的第几周的日期
            for(int i = 0; i < str.length - 2; i ++){
                int l = Integer.parseInt(str[i]) / 10;//这是星期几
                int j = Integer.parseInt(str[i]) % 10;//这是第几节
                int sign = c * (str.length - 2) + i;
                applydates[sign] = addDate(d,l); //确定为第几周的星期几
                applyperiods[sign] = periods[j];
            }
        }
        for(int i = 0; i < str.length - 3; i ++){
             int l = Integer.parseInt(str[i]) / 10;
             int j = Integer.parseInt(str[i]) % 10;
             applysInfo = applysInfo +weekday[l] + "的" + dayperiods[j] + " 和 ";
        }
        int l = Integer.parseInt(str[str.length - 3]) / 10;
        int j = Integer.parseInt(str[str.length - 3]) % 10;
        applysInfo = applysInfo +weekday[l] + "的" + dayperiods[j] ;
        return Msg.success().add("applysInfo", applysInfo)
                .add("applydates", applydates).add("applyperiods", applyperiods);
    }
    
    public static Date addWeekDate(Integer i,Date startDay) throws ParseException{
        Date endDay = null;
        switch(i){
        case 1: endDay= startDay ; break;
        case 2: endDay = addDate(startDay,7); break;
        case 3: endDay = addDate(startDay,14); break;
        case 4: endDay = addDate(startDay,21); break;
        case 5: endDay = addDate(startDay,28); break;
        case 6: endDay = addDate(startDay,35); break;
        case 7: endDay = addDate(startDay,42); break;
        case 8: endDay = addDate(startDay,49); break;
        case 9: endDay = addDate(startDay,56); break;
        case 10: endDay = addDate(startDay,63); break;
        case 11: endDay = addDate(startDay,70); break;
        case 12: endDay = addDate(startDay,77); break;
        case 13: endDay = addDate(startDay,84); break;
        case 14: endDay = addDate(startDay,91); break;
        case 15: endDay = addDate(startDay,98); break;
        case 16: endDay = addDate(startDay,105); break;
        }
        return endDay;
    }
    
    public static Date addDate(Date date,long day) throws ParseException {
        long time = date.getTime(); // 得到指定日期的毫秒数
        day = day*24*60*60*1000; // 要加上的天数转换成毫秒数
        time+=day; // 相加得到新的毫秒数
        return new Date(time); // 将毫秒数转换成日期
       }
    /**
     * 根据ID查询申请记录的信息
     * @param reqId
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/record",method=RequestMethod.GET)
    public Msg saveRecord(Integer id){
        Record record = recordService.getRecord(id);
        return Msg.success().add("record", record);
    }
    
    /**
     * 时间冲突检测，检测的是申请班级时间段的冲突，不是该用户申请时间段的冲突。
     * 先获取班级时间段记录再查看是否日志登记为成功，若是，返回冲突信息。
     * @param period
     * @param applydate
     * @param username
     * @return
     * @throws UnsupportedEncodingException 
     */
    @ResponseBody
    @RequestMapping(value="timeConflict",method=RequestMethod.GET)
    public Msg timeConflict(String period,long applydate,String classname,String subject) throws UnsupportedEncodingException{
        classname  = new String(classname.getBytes("iso8859-1"),"utf-8");
        subject  = new String(subject.getBytes("iso8859-1"),"utf-8");
        Date  applydate1 = null;
        if(applydate == 0){
           applydate1 =   new Date();
        }else
        { 
            applydate1 =   new Date(applydate);
        }
        List<Record> records = recordService.timeConflictRecord(period,applydate1,classname,subject);
        if(records.isEmpty() == false){
        for(Record i : records){
            if(logsService.checkTimeConflict(i.getReqId())){
                return Msg.success().add("record", i).add("flag",1);
            }
          }
        }
            return Msg.success().add("flag",0);
    }
    
    @ResponseBody
    @RequestMapping(value="mutlipleTimeConflict",method=RequestMethod.GET)
    public Msg mutlipleTimeConflict(String period,String applydate,String classname,String subject) throws UnsupportedEncodingException{
        classname  = new String(classname.getBytes("iso8859-1"),"utf-8");
        subject  = new String(subject.getBytes("iso8859-1"),"utf-8");
        long longdate = Long.parseLong(applydate);
        Date  applydate1 = new Date(longdate);
        List<Record> records = recordService.timeConflictRecord(period,applydate1,classname,subject);
        if(records.isEmpty() == false){
        for(Record i : records){
            if(logsService.checkTimeConflict(i.getReqId())){
                return Msg.success().add("record", i).add("flag",1);
            }
          }
        }
            return Msg.success().add("flag",0);
    }
    
    @ResponseBody
    @RequestMapping(value="/recordToapplyId",method=RequestMethod.GET)
    public Msg getApplyByRecordId(Integer id){
        Record record = recordService.getRecord(id);
        System.out.println(record);
        Integer applyId = applyService.getApplyBylabnameAndReqdate(
                record.getLabname(),record.getReqdate());
        System.out.println("通过Record找到的APPlyId ："+applyId);
        return Msg.success().add("period", record.getPeriod()).add("applyId", applyId);
    }
    
    @ResponseBody
    @RequestMapping(value="/record",method=RequestMethod.PUT)
    public Msg deleteRecord(Integer id){
        System.out.println("更新申请记录ID"+id);
        recordService.updateRecord(id);
        return Msg.success();
    }
    
//    @ResponseBody
//    @RequestMapping(value="/labLog",method=RequestMethod.GET)
//    public Msg getLogsByUsername(@RequestParam("sessionUsername") String username){
//        System.out.println(username);
//        return Msg.success();
//    }
}
