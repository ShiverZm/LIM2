package com.java1234.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.MessageDao;
import com.java1234.entity.Message;
import com.java1234.service.MessageService;

@Service("messageService")
public class MessageServiceImpl implements MessageService{
    @Resource
    private MessageDao messageDao;
	
	public List<Message> findProAllByProId(Integer proId) {
		return messageDao.findProAllByProId(proId);
	}

	public int add(Message message) {
		return messageDao.add(message);
	}

	public List<Message> findByProId(int proId) {
		
		return messageDao.findByProId(proId);
	}

	public Long getTotal(Map<String, Object> map) {
		
		return messageDao.getTotal(map);
	}

	public List<Message> find(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return messageDao.find(map);
	}

	public int delete(int id) {
		return messageDao.delete(id);
	}
	
   
}
