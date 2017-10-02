package com.java1234.dao;

import java.util.List;
import java.util.Map;

import com.java1234.entity.LaboratoryReserCheck;

public interface LaboratoryReserCheckDao {
	
	   
	    public List<LaboratoryReserCheck> find(Map<String, Object> map);
	    
	    public long getTotal(Map<String, Object> map);
   
        public int check(LaboratoryReserCheck labReserCheck);

		public int add(LaboratoryReserCheck lr);

		public int delete(Integer resId);
		
		public List<Integer> getFinishedRes();
}
