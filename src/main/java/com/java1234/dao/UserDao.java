package com.java1234.dao;

import java.util.Set;

import com.java1234.entity.User;

public interface UserDao {
	
	public User login(User user);
	
	public Set<String> getRoles(String userName);
	
	public Set<String> getPermissions(String userName);

	public User getByUserName(String userName);
	
}
