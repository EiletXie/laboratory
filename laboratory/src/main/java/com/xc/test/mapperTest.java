package com.xc.test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.internal.Classes;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xc.bean.Apply;
import com.xc.bean.Classlog;
import com.xc.bean.Laboratory;
import com.xc.bean.User;
import com.xc.dao.ApplyMapper;
import com.xc.dao.ClasslogMapper;
import com.xc.dao.LaboratoryMapper;
import com.xc.dao.UserMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class mapperTest {
 
	@Autowired
	UserMapper userMapper;
	
	@Resource
	LaboratoryMapper labMapper;
	
	@Resource
    ApplyMapper applyMapper;
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
    ClasslogMapper classMapper;
	
	@Test
    public void testCrud(){
		for(int i = 1; i <= 100 ; i++){
		  String teacherName = UUID.randomUUID().toString().substring(0,4)+i;
	      userMapper.insertSelective(new User(null,"labT"+teacherName,"123","实验室老师","122"+teacherName+"@qq.com","M"));
		}
	}
	
	@Test
	public void testApply() throws ParseException{
	    List<Laboratory> labs = labMapper.selectByExample(null);
	       String str = "2018-4-23";
	       SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	       Date startday =  format.parse(str);
	    for(int i = 0; i < 7 * 15 ; i++){
	        for(Laboratory l : labs){
	            String labname = l.getLabname();
	            applyMapper.insert(new Apply(null,labname,"0","0","0","0","0",startday));
	            System.out.print(labname+" ");
	         }
	        System.out.println();
	        Calendar c = Calendar.getInstance();
	        c.setTime(startday);
	        c.add(Calendar.DAY_OF_MONTH, 1);
	        startday = c.getTime();
	    }
	}
	public static Date addDate(Date date,long day) throws ParseException {
        long time = date.getTime(); // 得到指定日期的毫秒数
        day = day*24*60*60*1000; // 要加上的天数转换成毫秒数
        time+=day; // 相加得到新的毫秒数
        return new Date(time); // 将毫秒数转换成日期
       }
	
	@Test
    public void testClasses(){
	    for(int i = 1; i <= 100 ; i++){
	          String classname = UUID.randomUUID().toString().substring(0,2)+i;
	          String classsubject[] = new String[]{"软件","机械","土木","材料","电信","法律","计算机","通信","历史","外语"};
	          String grades[] = new String[]{"2014级","2015级","2016级","2013级"};
	          classMapper.insertSelective(new Classlog(null,classsubject[i%10]+classname+"班",43,grades[i%4],classsubject[i%10]+"工程"));
	        }
        }
	
	@Test
    public void testtime(){
        Date alterTime = new Date(System.currentTimeMillis());
        System.out.println(alterTime);
    }
}
