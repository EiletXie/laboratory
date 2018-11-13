package com.xc.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xc.bean.Apply;
import com.xc.bean.ApplyExample;
import com.xc.bean.ApplyExample.Criteria;
import com.xc.dao.ApplyMapper;

@Service
public class ApplyService {
     
    @Autowired
    ApplyMapper applyMapper;

    public List<Apply> getApplys() {
        return applyMapper.selectByExample(null);
    }

    /**
     * 查询给定日期的所有实验室对象
     * @param applydate
     * @return
     */
    public List<Apply> getApplysWithDate(Date applydate) {
        ApplyExample example = new ApplyExample();
        Criteria criteria = example.createCriteria();
        criteria.andApplydateEqualTo(applydate);
        return applyMapper.selectByExample(example);
    }
    
    /**
     * 模糊查询给定日期和实验室名称的所有申请对象
     * @param blurredLabname
     * @param applydate
     * @return
     */
    public List<Apply> getApplysWithBlurredLabname(String blurredLabname,Date applydate){
       String labname = "%" + blurredLabname + "%";
       ApplyExample example = new ApplyExample();
       Criteria criteria = example.createCriteria();
       criteria.andLabnameLike(labname);
       criteria.andApplydateEqualTo(applydate);
       return applyMapper.selectByExample(example);
    }
    
    public Apply getApplyById(Integer id) {
        return applyMapper.selectByPrimaryKey(id);
    }

    public void updateApply(Apply apply) {
        applyMapper.updateByPrimaryKey(apply);
    }

    public Integer getApplyBylabnameAndReqdate(String labname, Date reqdate) {
        ApplyExample example = new ApplyExample();
        Criteria criteria = example.createCriteria();
        java.sql.Date sqlDate = new java.sql.Date(reqdate.getTime());
        criteria.andApplydateEqualTo(sqlDate);
        criteria.andLabnameEqualTo(labname);
        System.out.println(applyMapper.selectByExample(example).get(0));
        return applyMapper.selectByExample(example).get(0).getApplyId();
    }
    
    public Apply getWeekApplyBylabnameAndReqdate(String labname, Date reqdate) {
        ApplyExample example = new ApplyExample();
        Criteria criteria = example.createCriteria();
        java.sql.Date sqlDate = new java.sql.Date(reqdate.getTime());
        criteria.andApplydateEqualTo(sqlDate);
        criteria.andLabnameEqualTo(labname);
        return applyMapper.selectByExample(example).get(0);
    }
    
}
