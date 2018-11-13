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
     * �����ʼ���������ݣ���δ����ʵ������ʦ��judge�ֶκͽ�μ�¼endrecord
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
     * ��ʱ��ε�record���룬��Ҫ�������applydate��period�ֶ�
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
     * �ύ��ʱ�εĿ�ʱ�����¼
     * @param log
     * @return ���ؿɹ��û�����ʱ����Ϣ����Ӧ����һ����Ӧ��ʱ�����飬ר�����������ʹ����¼����
     * @throws UnsupportedEncodingException 
     * @throws ParseException 
     */
    @ResponseBody
    @RequestMapping(value="/mutlipleRecords",method=RequestMethod.POST)
    public Msg saveMultiplerecords(String labname,String info) throws UnsupportedEncodingException, ParseException{
          //Ϊʲôlabname��ת�������룬ת�˷���������
        //labname  = new String(labname.getBytes("iso8859-1"),"utf-8");
        info  = new String(info.getBytes("iso8859-1"),"utf-8");
        System.out.println(labname+" "+info);
        String[] str = info.split("-");
        String weekday[] = {"����һ","���ڶ�","������","������","������","������","������"};
        String dayperiods[] = {"��һ ����","���� �Ľ�","���� ����","���� �˽�","�ھ� ʮһ��"};
        String weeks[] = {"��һ��","�ڶ���","������","������","������","������","������","�ڰ���","�ھ���","��ʮ��","��ʮһ��","��ʮ����",
                "��ʮ����","��ʮ����","��ʮ����","��ʮ����"};
        String periods[] = {"one","three","five","seven","nine"};
        int startWeek = Integer.parseInt(str[str.length - 2]);
        int endWeek = Integer.parseInt(str[str.length-1]);
        String applysInfo =   weeks[startWeek - 1] + " �� " + weeks[endWeek - 1] + " |";
        //����һ��ʱ�����飬���ڴ�������ʱ�䵱�죬һ���ֶ����飬��Ŷ��ڵ��������ʱ���
        int num = (endWeek - startWeek + 1) * (str.length - 2);
        Date applydates[] = new Date[num];
        String applyperiods[]= new String[num];
        Date startDay = schoolCalendarService.getStartDay();
        for(int c = 0; c <= endWeek - startWeek ; c++){
            Date d = addWeekDate(startWeek+c,startDay);//����ĵڼ��ܵ�����
            for(int i = 0; i < str.length - 2; i ++){
                int l = Integer.parseInt(str[i]) / 10;//�������ڼ�
                int j = Integer.parseInt(str[i]) % 10;//���ǵڼ���
                int sign = c * (str.length - 2) + i;
                applydates[sign] = addDate(d,l); //ȷ��Ϊ�ڼ��ܵ����ڼ�
                applyperiods[sign] = periods[j];
            }
        }
        for(int i = 0; i < str.length - 3; i ++){
             int l = Integer.parseInt(str[i]) / 10;
             int j = Integer.parseInt(str[i]) % 10;
             applysInfo = applysInfo +weekday[l] + "��" + dayperiods[j] + " �� ";
        }
        int l = Integer.parseInt(str[str.length - 3]) / 10;
        int j = Integer.parseInt(str[str.length - 3]) % 10;
        applysInfo = applysInfo +weekday[l] + "��" + dayperiods[j] ;
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
        long time = date.getTime(); // �õ�ָ�����ڵĺ�����
        day = day*24*60*60*1000; // Ҫ���ϵ�����ת���ɺ�����
        time+=day; // ��ӵõ��µĺ�����
        return new Date(time); // ��������ת��������
       }
    /**
     * ����ID��ѯ�����¼����Ϣ
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
     * ʱ���ͻ��⣬����������༶ʱ��εĳ�ͻ�����Ǹ��û�����ʱ��εĳ�ͻ��
     * �Ȼ�ȡ�༶ʱ��μ�¼�ٲ鿴�Ƿ���־�Ǽ�Ϊ�ɹ������ǣ����س�ͻ��Ϣ��
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
        System.out.println("ͨ��Record�ҵ���APPlyId ��"+applyId);
        return Msg.success().add("period", record.getPeriod()).add("applyId", applyId);
    }
    
    @ResponseBody
    @RequestMapping(value="/record",method=RequestMethod.PUT)
    public Msg deleteRecord(Integer id){
        System.out.println("���������¼ID"+id);
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
