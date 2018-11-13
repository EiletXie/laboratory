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
	 * ��½����û����������Ƿ���ȷ
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
	 * ͨ���û��������û�������Ϣ
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
	 * �����û�
	 * @param user
	 */
	public void saveUser(User user) {
		userMapper.insert(user);
	}
	
	/**
	 * �����û����Ƿ����
	 * @param userName
	 * @return true ����ǰ�������� false ������
	 * Example�����һ���ڲ���̬�� Criteria ����һ���� anded �����where�Ӿ��е������б�. 
	 * Example�����һ�� List<Criteria> ����,�����ڲ���Criteria�е��Ӿ���� ored�����һ��. 
	 * ʹ�ò�ͬ���Ե� Criteria �������������������͵�where�Ӿ�.
	 */
	public boolean checkUser(String username){
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		long count = userMapper.countByExample(example);
		return count == 0;
	}
	
	/**
	 * ��ȡ���е�ʵ������ʦ
	 * @return labTeacherAll
	 */
	public List<User> getLabTeacherAll(){
		UserExample example = new UserExample();
		Criteria criteria = example.createCriteria();
		criteria.andRoleEqualTo("ʵ������ʦ");
		List<User> labTeacherAll = userMapper.selectByExample(example);
		return labTeacherAll;
	}

	/**
	 * ��ȡ�����û�����
	 * @return usersAll
	 */
    public List<User> getUsersAll() {
        List<User> usersAll = userMapper.selectByExample(null);
        return usersAll;
    }

    /**
     * ��ȡ��������
     * @param id
     * @return
     */
    public User getUser(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    /**
     * �����û�������Ϣ
     * @param user
     */
    public void updateUser(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }

    /**
     * ɾ�������û�
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
