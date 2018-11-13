package com.xc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xc.bean.User;
import com.xc.bean.UserExample;
import com.xc.bean.UserExample.Criteria;
import com.xc.dao.UserMapper;

@Service
public class UserService {
    
	@Autowired
	UserMapper userMapper;

	/**
	 * 登陆检测用户名和密码是否正确
	 * @param username
	 * @param password
	 * @return
	 */
	public boolean findUser(String username, String password) {
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		criteria.andPasswordEqualTo(password);
		long count = userMapper.countByExample(example);
		return count == 1;
	}
	
	/**
	 * 通过用户名返回用户对象信息
	 * @param username
	 * @return user
	 */
	public User returnUserInfo(String username){
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		List<User> userInfos = userMapper.selectByExample(example);
		User userInfo = userInfos.get(0);
		return userInfo;
		
	}
    
	/**
	 * 新增用户
	 * @param user
	 */
	public void saveUser(User user) {
		userMapper.insert(user);
	}
	
	/**
	 * 检验用户名是否可用
	 * @param userName
	 * @return true 代表当前姓名可用 false 不可用
	 * Example类包含一个内部静态类 Criteria 包含一个用 anded 组合在where子句中的条件列表. 
	 * Example类包含一个 List<Criteria> 属性,所有内部类Criteria中的子句会用 ored组合在一起. 
	 * 使用不同属性的 Criteria 类允许您生成无限类型的where子句.
	 */
	public boolean checkUser(String username){
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		long count = userMapper.countByExample(example);
		return count == 0;
	}
	
	/**
	 * 获取所有的实验室老师
	 * @return labTeacherAll
	 */
	public List<User> getLabTeacherAll(){
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andRoleEqualTo("实验室老师");
		List<User> labTeacherAll = userMapper.selectByExample(example);
		return labTeacherAll;
	}

	/**
	 * 获取所有用户对象
	 * @return usersAll
	 */
    public List<User> getUsersAll() {
        List<User> usersAll = userMapper.selectByExample(null);
        return usersAll;
    }

    /**
     * 获取单个对象
     * @param id
     * @return
     */
    public User getUser(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    /**
     * 更新用户对象信息
     * @param user
     */
    public void updateUser(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }

    /**
     * 删除单个用户
     * @param id
     */
    public void deleteUser(Integer id) {
        userMapper.deleteByPrimaryKey(id);
    }

    public Integer findIdByUsername(String username) {
        UserExample example = new UserExample();
        Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(username);
        User user = userMapper.selectByExample(example).get(0);
        return user.getUserId();
        
    }
}
