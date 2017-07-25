package com.java1234.service;

import java.util.Set;

import javax.annotation.Resource;

import com.java1234.entity.User;

public interface UserService {
	 
    public User login(User user);
    
    public Set<String> getRoles(String userName);
    
    public Set<String> getPermissions(String userName);

	public User getByUserName(String userName);
}
