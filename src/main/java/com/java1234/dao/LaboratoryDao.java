package com.java1234.dao;

import java.util.List;
import java.util.Map;
import com.java1234.entity.Laboratory;

public interface LaboratoryDao {
	
	  
	    public List<Laboratory> find(Map<String, Object> map);
	    
	   
	    public long getTotal(Map<String, Object> map);
	   
	    public int update(Laboratory laboratory);
	    
	    public int add(Laboratory laboratory);

	    public int delete(Integer id);

}
