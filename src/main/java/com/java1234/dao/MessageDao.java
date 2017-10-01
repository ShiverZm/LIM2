package com.java1234.dao;

import java.util.List;
import java.util.Map;

import com.java1234.entity.Message;

public interface MessageDao {
   public List<Message> findProAllByProId(Integer proId);

   public int add(Message message);

   public List<Message> findByProId(int proId);

   public Long getTotal(Map<String, Object> map);

   public List<Message> find(Map<String, Object> map);

   public int delete(int id);  
} 
