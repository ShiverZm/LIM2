package com.java1234.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.ibatis.annotations.Param;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.java1234.entity.User;
import com.java1234.entity.User;


public interface UserDao {
	
	public User login(User user);
	
	public Set<String> getRoles(String userName);
	
	public Set<String> getPermissions(String userName);

	public User getByUserName(String userName);
	
	 public List<User> find(Map<String, Object> map);
	    
	 public long getTotal(Map<String, Object> map);
	    
	   
	    public int update(User user);
	    
	    public int add(User user);
	    
	  
	    public int delete(Integer id);
	    
	   
		public int modifyPassword(@Param("userName")String userName, @Param("oldPassword")String oldPassword,@Param("newPassword") String newPassword);
	    
	   
	
}
