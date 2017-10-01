package com.java1234.dao;

import java.util.List;
import java.util.Map;

import com.java1234.entity.LaboratoryReser;


public interface LaboratoryReserDao {
	
	    public List<LaboratoryReser> find(Map<String, Object> map);
	    
	    public long getTotal(Map<String, Object> map);
	   
	    public int update(LaboratoryReser laboratoryReser);
	    
	    public int add(LaboratoryReser laboratoryReser);
	   
		public int delete(Integer labId);

		public List<LaboratoryReser> findByLabResPerson(String realName);

		public int findIdByLabName(String labName);

		public LaboratoryReser findById(Integer labId);
      
}
