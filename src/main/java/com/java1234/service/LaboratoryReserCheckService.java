package com.java1234.service;

import java.util.List;
import java.util.Map;

import com.java1234.entity.LaboratoryReserCheck;


public interface LaboratoryReserCheckService {
   
	public List<LaboratoryReserCheck> find(Map<String, Object> map);
    
    public long getTotal(Map<String, Object> map);

	public int check(LaboratoryReserCheck labResCheck);

	public int add(LaboratoryReserCheck labResCheck);

	public List<Integer> getFinishedRes();

	public int delete(int resId);
  
}
