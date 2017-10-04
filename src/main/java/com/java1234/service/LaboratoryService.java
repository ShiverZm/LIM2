package com.java1234.service;

import java.util.List;
import java.util.Map;

import com.java1234.entity.Laboratory;

public interface LaboratoryService {
  
    public List<Laboratory> find(Map<String, Object> map);
    
    public long getTotal(Map<String, Object> map);

    public int update(Laboratory equipment);
    
    public int add(Laboratory equipment);
    
    public int delete(Integer id);

	public List<String> listLab();
}
