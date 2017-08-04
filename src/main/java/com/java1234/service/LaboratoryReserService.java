package com.java1234.service;

import java.util.List;
import java.util.Map;

import com.java1234.entity.LaboratoryReser;

public interface LaboratoryReserService {
    
    public List<LaboratoryReser> find(Map<String, Object> map);
    
    
    public long getTotal(Map<String, Object> map);

    public int update(LaboratoryReser equipment);
 
    public int add(LaboratoryReser equipment);
   
    public int delete(Integer id);


	public List<LaboratoryReser> findByLabResPerson(String realName);
}
