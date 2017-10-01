package com.java1234.dao;

import java.util.List;
import java.util.Map;

import com.java1234.entity.ProjectCheck;

public interface ProjectCheckDao {
	
	    /**
	     * 
	     * @param map
	     * @return
	     */
	    public List<ProjectCheck> find(Map<String, Object> map);
	    
	    /**
	     * 
	     * @param map
	     * @return
	     */
	    public long getTotal(Map<String, Object> map);
   
        public int check(ProjectCheck projectCheck);

		public int add(ProjectCheck pc);

		public List<Integer> getFinishedPro();

		public int delete(Integer proId);
}
