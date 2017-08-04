package com.java1234.dao;

import java.util.List;
import java.util.Map;

import com.java1234.entity.LaboratoryReser;


public interface LaboratoryReserDao {
	
	    public List<LaboratoryReser> find(Map<String, Object> map);
	    
	    public long getTotal(Map<String, Object> map);
	    
	    /**
	     * 
	     * @param laboratoryReser
	     * @return
	     */
	    public int update(LaboratoryReser laboratoryReser);
	    
	    /**
	     * 
	     * @param laboratoryReser
	     * @return
	     */
	    public int add(LaboratoryReser laboratoryReser);
	    
	    /**
	     *  
	     * @param id
	     * @return
	     */
		public int delete(Integer id);

		public List<LaboratoryReser> findByLabResPerson(String realName);
      
}
