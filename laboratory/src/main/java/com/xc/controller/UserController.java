package com.xc.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xc.bean.Apply;
import com.xc.bean.Laboratory;
import com.xc.bean.Msg;
import com.xc.bean.Record;
import com.xc.bean.User;
import com.xc.service.ApplyService;
import com.xc.service.LaboratoryService;
import com.xc.service.LogsService;
import com.xc.service.RecordService;
import com.xc.service.SchoolCalendarService;
import com.xc.service.UserService;

/**
 * �����û���crud����
 * @author Administrator
 */
@Controller
public class UserController {

	@Autowired
	UserService userService;
	
	@Autowired
	LaboratoryService labService;
	
	@Autowired
	RecordService recordService;
	
	@Autowired
	ApplyService applyService;
	
	@Autowired
	LogsService logsService;
	
	@Autowired
	SchoolCalendarService schoolCalendarService;
	
	String username = null;
	/**
	 * ����û����Ƿ����
	 * @param empName
	 * @return
	 */
	@RequestMapping("/checkuser")
	@ResponseBody
	public Msg checkuser(@RequestParam("username")String username){
		String  regName = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,6})";
		if(!username.matches(regName)){
			return Msg.fail().add("va_msg","�û���Ҫ����2-6�����Ļ���3-16λӢ�ĺ����ֵ���ϣ�");
		}
		//���ݿ�У��
		boolean check = userService.checkUser(username);
		if(check){
			return Msg.success();
		}else{
			return Msg.fail().add("va_msg","�û��������ã�");
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/user",method=RequestMethod.POST)
	public Msg saveUser(@Valid User user,BindingResult result){
	    if(result.hasErrors()){
            //У��ʧ�ܣ�Ӧ�÷���ʧ�ܣ���ģ̬������ʾУ��ʧ�ܵĴ�����Ϣ
            Map<String,Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for(FieldError fieldError : errors){
                System.out.println("������ֶ����� "+ fieldError.getField());
                System.out.println("������Ϣ: " + fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        }else{
		System.out.println(user);
		userService.saveUser(user);
		return Msg.success();
        }
	}
	
	
//	@RequestMapping(value="/loginUser",method=RequestMethod.POST)
//	public ModelAndView loginUser(@Valid User user){
//		String username = user.getUsername();
//		String password = user.getPassword();
//		System.out.println(username + "���ڼ��");
//		boolean flag = userService.findUser(username, password);
//		ModelAndView mav = new ModelAndView("labTeacher");
//		mav.addObject("username",username);
//		if (flag) {
//			System.out.println(username + "�Ѿ�ͨ�����");
//			mav.addObject("flag", "success");
//			return mav;
//		} else {
//			System.out.println("ʧ��");
//			mav.addObject("flag", "fail");
//			return mav;
//	//window.location.href="/WEB-INF/views/labTeacher.jsp" + username ;
//		}
//	}
	
	@ResponseBody
	@RequestMapping(value="/loginUser",method=RequestMethod.POST)
	public Msg loginUser(@Valid User user,Model model,HttpSession httpSession){
		username = user.getUsername();
		httpSession.setAttribute("sessionUsername", username);
		httpSession.setMaxInactiveInterval(6000);
		String password = user.getPassword();
		model.addAttribute("username", username);
		boolean flag = userService.findUser(username, password);
		if (flag) {
			System.out.println(username + "�Ѿ�ͨ�����");
			User userInformation = userService.returnUserInfo(username);
			String role = userInformation.getRole();
			return Msg.success().add("username",username).add("role",role);
		} else {
			System.out.println("���ʧ��");
			return Msg.fail();
		}
	}
	
	
	@ResponseBody
	@RequestMapping("/labTeachers")
	public Msg getLabTeachersWithJson(
			@RequestParam(value="pn",defaultValue="1") Integer pn,Model model){
		PageHelper.startPage(pn,5);
		List<User> labTeachers = userService.getLabTeacherAll();
		PageInfo<User> page = new PageInfo<User>(labTeachers,5);
		return Msg.success().add("pageInfo", page);
	}
	
	/**
	 * ��ȡ���е��û�����
	 * @param pn
	 * @param model
	 * @return
	 */
	@ResponseBody
    @RequestMapping("/getUsers")
    public Msg getUsersWithJson(
            @RequestParam(value="pn",defaultValue="1") Integer pn,Model model){
        PageHelper.startPage(pn,5);
        List<User> users = userService.getUsersAll();
        PageInfo<User> page = new PageInfo<User>(users,5);
        return Msg.success().add("pageInfo", page);
    }
	
	/**
	 * ��ȡ�����û�����
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/user/{id}",method=RequestMethod.GET)
	public Msg getUser(@PathVariable("id") Integer id){
	    User user = userService.getUser(id);
        return Msg.success().add("user", user);
	}
	
	/**
     * �����û�����,����url��id��������userʱ����ҪΪuser�Ĳ�����userId����������id����������
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/user/{userId}",method=RequestMethod.PUT)
    public Msg updateUser(User user){
        System.out.println(user);
        userService.updateUser(user);
        return Msg.success();
    }
    
    /**
     * ɾ�������û�����
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/user/{id}",method=RequestMethod.DELETE)
    public Msg deleteUser(@PathVariable("id") Integer id){
        userService.deleteUser(id);
        return Msg.success();
    }
	
    /**
     * ͨ���û����ҵ���Ӧ�û�id�Ӷ��õ����ڵ�ʵ����������˵õ���Ӧ��ʵ����
     * @param sessionUsername
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/UserController/labRecord",method=RequestMethod.GET)
    public Msg getLabRecord(String sessionUsername){
        Integer id = userService.findIdByUsername(sessionUsername);
        //ͨ��ʵ������ʦ��id����ȡ������ʵ����
        String labname = labService.findLabnameById(id);
        //ͨ�����ڵ�ʵ�������������Ҷ�Ӧ��������־
        if(labname != null){
        List<Record> records = recordService.getRecordsByLabname(labname);
        return Msg.success().add("records", records);
        }else{
            return Msg.success();
        }
    }
    
    /**
     * ͨ���û����жϽ����Ƿ����޶�Ӧ�Ŀγ�
     * @param sessionUsername
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/UserController/userRoutine",method=RequestMethod.GET)
    public Msg getUserRoutine(String sessionUsername){
        Integer id = userService.findIdByUsername(sessionUsername);
        //ͨ��ʵ������ʦ��id����ȡ������ʵ����
        String labname = labService.findLabnameById(id);
        //ͨ�����ڵ�ʵ�������������Ҷ�Ӧ��������־
        if(labname != null){
         Date today = new Date();
        List<Record> records = recordService.getRecordsByLabnameAndDate(labname,today);
        List<Record> successRecords = new ArrayList<>();
        for(Record r : records){
           if(logsService.checkTimeConflict(r.getReqId())){
               successRecords.add(r);
           }
        }
        if(successRecords.isEmpty() == false){
        return Msg.success().add("records", successRecords);
        }
        }
            return Msg.success();
    }
    
    /**
     * ͨ��ʵ�����Ʋ��õ������ĵڼ����������
     * @param labname
     * @return
     * @throws ParseException 
     * @throws UnsupportedEncodingException 
     */
    @SuppressWarnings("unused")
    @ResponseBody
    @RequestMapping(value="/UserController/WeekApplyByLabname",method=RequestMethod.GET)
    public Msg getWeekApplyInformationBylabname(String labname,Integer weekDate) throws ParseException, UnsupportedEncodingException{
        //ͨ��ʵ������ʦ��id����ȡ������ʵ����
        labname = new String(labname.getBytes("iso8859-1"),"utf-8");
        Date startDay = schoolCalendarService.getStartDay();
        Date endDay = null;
        switch(weekDate){
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
        //ͨ�����ڵ�ʵ�������������Ҷ�Ӧ��������־
        if(labname != null){
        //˼·������һ��5x7�Ķ�ά�������飬��ÿ�ܵ�����ʵ����������Ϣ�����ȥ
            //����jquery�в���ͨ����������������ֶ����ƣ��ʰ������һ��7x5�Ķ�ά�������
            String[][] doubleapplys = new String [7][5];
        Apply applys[] = new Apply[7];
        for(int i = 0; i < 7 ; i++){
          Date searchDay = addDate(endDay,i);
         applys[i] = applyService.getWeekApplyBylabnameAndReqdate(labname,searchDay);
         doubleapplys[i][0] = applys[i].getOne();
         doubleapplys[i][1] = applys[i].getThree();
         doubleapplys[i][2] = applys[i].getFive();
         doubleapplys[i][3] = applys[i].getSeven();
         doubleapplys[i][4] = applys[i].getNine();
        }
          return Msg.success().add("doubleapplys", doubleapplys);
        } 
            return Msg.success();
       }
    
    /**
     * ͨ���û����ҵ���Ӧ�û�id�Ӷ��õ����ڵ�ʵ�����Ʋ��õ������ĵڼ����������
     * @param sessionUsername
     * @return
     * @throws ParseException 
     * @throws UnsupportedEncodingException 
     */
    @ResponseBody
    @RequestMapping(value="/UserController/WeekApplyInformation",method=RequestMethod.GET)
    public Msg getWeekApplyInformation(String sessionUsername,Integer weekDate) throws ParseException, UnsupportedEncodingException{
        sessionUsername  = new String(sessionUsername.getBytes("iso8859-1"),"utf-8");
        Integer id = userService.findIdByUsername(sessionUsername);
        //ͨ��ʵ������ʦ��id����ȡ������ʵ����
        String labname = labService.findLabnameById(id);
        
        Date startDay = schoolCalendarService.getStartDay();
        Date endDay = null;
        switch(weekDate){
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
        //ͨ�����ڵ�ʵ�������������Ҷ�Ӧ��������־
        if(labname != null){
        //˼·������һ��5x7�Ķ�ά�������飬��ÿ�ܵ�����ʵ����������Ϣ�����ȥ
            //����jquery�в���ͨ����������������ֶ����ƣ��ʰ������һ��7x5�Ķ�ά�������
            String[][] doubleapplys = new String [7][5];
        Apply applys[] = new Apply[7];
        for(int i = 0; i < 7 ; i++){
          Date searchDay = addDate(endDay,i);
         applys[i] = applyService.getWeekApplyBylabnameAndReqdate(labname,searchDay);
         doubleapplys[i][0] = applys[i].getOne();
         doubleapplys[i][1] = applys[i].getThree();
         doubleapplys[i][2] = applys[i].getFive();
         doubleapplys[i][3] = applys[i].getSeven();
         doubleapplys[i][4] = applys[i].getNine();
        }
        return Msg.success().add("doubleapplys", doubleapplys);
        }else{
            return Msg.success();
        }
    }
    
    public static Date addDate(Date date,long day) throws ParseException {
        long time = date.getTime(); // �õ�ָ�����ڵĺ�����
        day = day*24*60*60*1000; // Ҫ���ϵ�����ת���ɺ�����
        time+=day; // ��ӵõ��µĺ�����
        return new Date(time); // ��������ת��������
       }
    
    
    @ResponseBody
    @RequestMapping(value="/UserController/getlabnameByUsername",method=RequestMethod.GET)
    public Msg getlabnameByUsername(String sessionUsername){
        Integer id = userService.findIdByUsername(sessionUsername);
        //ͨ��ʵ������ʦ��id����ȡ������ʵ����
        String labname = labService.findLabnameById(id);
        return Msg.success().add("labname", labname);
    }
    
    /**
     * ͨ���û�����ѯ���ڵ�ʵ������Ϣ
     * @param sessionUsername
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/UserController/labInformation",method=RequestMethod.GET)
    public Msg getLabInformation(String sessionUsername){
        Integer id = userService.findIdByUsername(sessionUsername);
        Laboratory lab = labService.findLaboratory(id);
        return Msg.success().add("laboratory", lab);
    }
    
	/**
	 * ҳ����ת
	 * @return
	 */
	@RequestMapping(value="/laboratoryInformation")
	public String laboratoryInformation(Map<String,Object> map){
	    map.put("username",username);
		return "laboratoryInformation";
	}
	
	@RequestMapping(value="/labInsert")
	public String labInsert(Map<String,Object> map){
	    map.put("username",username);
		return "labInsert";
	}
	
	@RequestMapping(value="/classInsert")
    public String classInsert(Map<String,Object> map){
        map.put("username",username);
        return "classInsert";
    }
	
	@RequestMapping(value="/courseInsert")
    public String courseInsert(){
        return "courseInsert";
    }
	
	@RequestMapping(value="/schoolCalendarInsert")
    public String schoolCalendarInsert(){
        return "schoolCalendarInsert";
    }
	
	@RequestMapping(value="/userManage")
	public String userManage(Map<String,Object> map){
	    map.put("username",username);
		return "userManage";
	}
	
	@RequestMapping(value="/message")
    public String message(Map<String,Object> map){
	    map.put("username",username);
        return "message";
    }
	
	@RequestMapping(value="/labOperate")
    public String labOperate(Map<String,Object> map){
        map.put("username",username);
        return "labOperate";
    }
	
	@RequestMapping(value="/labTeacherApply")
    public String labTeacherApply(){
        return "labTeacherApply";
    }
	
	@RequestMapping(value="/labTeacherWeekApply")
    public String labTeacherWeekApply(){
        return "labTeacherWeekApply";
    }

    @RequestMapping(value="/labTeacherMultipleApply")
    public String labTeacherMultipleApply(){
        return "labTeacherMultipleApply";
    }
	
	@RequestMapping(value="/labTeacherMessage")
    public String labTeacherMessage(){
        return "labTeacherMessage";
    }
	
	@RequestMapping(value="/labTeacherLogs")
    public String labTeacherLogs(){
        return "labTeacherLogs";
    }
	
	@RequestMapping(value="/manageLogs")
    public String manageLogs(){
        return "manageLogs";
    }
	
	@RequestMapping(value="/innerLogin")
    public String innerLogin(){
        return "innerLogin";
    }
}
