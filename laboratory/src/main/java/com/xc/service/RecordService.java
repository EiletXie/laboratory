package com.xc.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xc.bean.Record;
import com.xc.bean.RecordExample;
import com.xc.bean.RecordExample.Criteria;
import com.xc.dao.RecordMapper;


@Service
public class RecordService {
          @Autowired
          RecordMapper recordMapper;
          
          public int insertRecord(Record record){
             int id =  recordMapper.insertSelective(record);
            // System.out.println("插入操作方法的值"+id); ?为什么是负数
              return id;
          }
          
          /**
           * 返回给定labname的所有日志记录,并且checkread字段为0，即还没被读取的
           * @param labname
           * @return
           */
          public List<Record> getRecordsByLabname(String labname){
              RecordExample example = new RecordExample();
              Criteria criteria = example.createCriteria();
              criteria.andLabnameEqualTo(labname);
              criteria.andCheckreadEqualTo(0);
              return recordMapper.selectByExample(example);
          }

        public Record getRecord(Integer id) {
            return recordMapper.selectByPrimaryKey(id);
        }

        /**
         * 更新申请记录为已读
         * @param id
         */
        public void updateRecord(Integer id) {
            Record record = recordMapper.selectByPrimaryKey(id);
                    record.setCheckread(1);
            recordMapper.updateByPrimaryKey(record);
        }

        public Integer findIdByRecord(Record record) {
            RecordExample example = new RecordExample();
            Criteria criteria = example.createCriteria();
            criteria.andUsernameEqualTo(record.getUsername());
            criteria.andAssistantEqualTo(record.getAssistant());
            criteria.andReqdateEqualTo(record.getReqdate());
            criteria.andClassnameEqualTo(record.getClassname());
            criteria.andPeriodEqualTo(record.getPeriod());
            return recordMapper.selectByExample(example).get(0).getReqId();
        }

        public boolean judgelabTeacherLogs(Integer getrId,String labname) {
            RecordExample example = new RecordExample();
            Criteria criteria = example.createCriteria();
            criteria.andReqIdEqualTo(getrId);
            String labname2 = recordMapper.selectByExample(example).get(0).getLabname();
            if(labname.equals(labname2)){
                return true;
            }else{
                return false;
            }
        }

        public List<Record> timeConflictRecord(String period, Date applydate, String classname,String subject) {
            System.out.println("service中 "+ classname + subject);
            RecordExample example = new RecordExample();
            Criteria criteria = example.createCriteria();
            criteria.andSubjectEqualTo(subject);
            criteria.andClassnameEqualTo(classname);
            criteria.andReqdateEqualTo(applydate);
            List<Record> records = recordMapper.selectByExample(example);
            List<Record> sameRecords = new ArrayList<Record>();
            if(records.isEmpty() == false){
                 for(Record i : records){
                    if(period.equals(i.getPeriod())){
                        sameRecords.add(i);
                     }
                  }
               }
            return sameRecords;
        }

        public List<Record> getRecordsByLabnameAndDate(String labname, Date today) {
            RecordExample example = new RecordExample();
            Criteria criteria = example.createCriteria();
            criteria.andLabnameEqualTo(labname);
            criteria.andReqdateEqualTo(today);
            return recordMapper.selectByExample(example);
        }

}
