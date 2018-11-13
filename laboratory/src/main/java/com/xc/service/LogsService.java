package com.xc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xc.bean.Logs;
import com.xc.bean.LogsExample;
import com.xc.bean.LogsExample.Criteria;
import com.xc.dao.LogsMapper;
import com.xc.dao.RecordMapper;

@Service
public class LogsService {
       
        @Autowired
        LogsMapper logsMapper;
        
        @Autowired
        RecordMapper recordMapper;
        
        @Autowired
        RecordService recordService;

        public void insertlog(Logs log) {
            logsMapper.insertSelective(log);
        }

        public List<Logs> getLogs() {
            return logsMapper.selectByExample(null);
        }
        
        public List<Logs> getLabTeacherLogs(String labname){
            List<Logs> logs = logsMapper.selectByExample(null);
            List<Logs> labTeacherLogs = new ArrayList<>();
            for(Logs l : logs){
                if(recordService.judgelabTeacherLogs(l.getrId(),labname)){
                    labTeacherLogs.add(l);
                }
            }
            return labTeacherLogs;
        }

        /**
         * 检测Record记录id是否成功，返回时间冲突检测结果
         * @param reqId
         */
        public boolean checkTimeConflict(Integer reqId) {
           LogsExample example = new LogsExample();
           Criteria criteria = example.createCriteria();
           criteria.andRIdEqualTo(reqId);
           criteria.andJudgeEqualTo("1");
           System.out.println(logsMapper.selectByExample(example).isEmpty());
           if(logsMapper.countByExample(example) == 1){
               return true;
           }
            return false;   
        }


}
