package com.java1234.service;

import java.util.List;
import java.util.Map;

import com.java1234.entity.Message;

public interface MessageService {
	public List<Message> findProAllByProId(Integer id);

	public int add(Message message);

	public List<Message> findByProId(int proId);

	public Long getTotal(Map<String, Object> map);

	public List<Message> find(Map<String, Object> map);

	public int delete(int id); 
}
