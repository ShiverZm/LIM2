package com.java1234.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.UserDao;
import com.java1234.entity.User;
import com.java1234.entity.ProjectApply;
import com.java1234.entity.User;
import com.java1234.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Resource
	private UserDao userDao;
	
	public User login(User user) {
		return userDao.login(user);
	}

	public Set<String> getRoles(String userName) {
		
		return userDao.getRoles(userName);
	}

	public Set<String> getPermissions(String userName) {
		
		return userDao.getPermissions(userName);
	}

	public User getByUserName(String userName) {
		
		return userDao.getByUserName(userName);
	}
	
	public List<User> find(Map<String, Object> map) {
		return userDao.find(map);
	}

	
	public long getTotal(Map<String, Object> map) {
		return userDao.getTotal(map);
	}

	
	public int update(User user) {
		
		return userDao.update(user);
	}

	
	public int add(User user) {
		
		return userDao.add(user);
	}

	
	public int delete(Integer id) {
		
		return userDao.delete(id);
	}
	public int modifyPassword(String userName, String oldPassword, String newPassword) {
		return userDao.modifyPassword(userName,oldPassword,newPassword);
	}

}
