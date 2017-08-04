package com.java1234.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import com.java1234.entity.User;
import com.java1234.entity.User;

public interface UserService {

	public User login(User user);

	public Set<String> getRoles(String userName);

	public Set<String> getPermissions(String userName);

	public User getByUserName(String userName);

	public List<User> find(Map<String, Object> map);

	public long getTotal(Map<String, Object> map);

	public int update(User user);

	public int add(User user);

	public int delete(Integer id);

	public int modifyPassword(String userName, String oldPassword, String newPassword);
}
