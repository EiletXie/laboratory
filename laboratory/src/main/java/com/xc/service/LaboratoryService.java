package com.xc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xc.bean.Laboratory;
import com.xc.bean.LaboratoryExample;
import com.xc.bean.LaboratoryExample.Criteria;
import com.xc.dao.LaboratoryMapper;

@Service
public class LaboratoryService {

	@Autowired
	LaboratoryMapper laboratoryMapper;
	
	/**
	 * 添加实验室对象
	 * @param lab
	 */
	public void saveLabroom(Laboratory lab) {
		laboratoryMapper.insert(lab);
	}

    public String findLabnameById(Integer id) {
        LaboratoryExample example = new LaboratoryExample();
        Criteria criteria = example.createCriteria();
        criteria.andUIdEqualTo(id);
        Laboratory lab = laboratoryMapper.selectByExample(example).get(0);
        return lab.getLabname();
    }
    
    public Laboratory findLaboratory(Integer id) {
        LaboratoryExample example = new LaboratoryExample();
        Criteria criteria = example.createCriteria();
        criteria.andUIdEqualTo(id);
        Laboratory lab = laboratoryMapper.selectByExample(example).get(0);
        return lab;
    }

    public List<Laboratory> getBlurredLabname(String blurredLabname) {
        String labname = "%" + blurredLabname + "%";
        LaboratoryExample example = new LaboratoryExample();
        Criteria criteria = example.createCriteria();
        criteria.andLabnameLike(labname);
        return laboratoryMapper.selectByExample(example);
    }

}
