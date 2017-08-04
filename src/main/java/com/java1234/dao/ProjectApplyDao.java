package com.java1234.dao;

import java.util.List;
import java.util.Map;

import com.java1234.entity.ProjectApply;

public interface ProjectApplyDao {
	
	    /**
	     * 
	     * @param map
	     * @return
	     */
	    public List<ProjectApply> find(Map<String, Object> map);
	    
	    /**
	     * 
	     * @param map
	     * @return
	     */
	    public long getTotal(Map<String, Object> map);
	    
	    /**
	     * 
	     * @param projectApply
	     * @return
	     */
	    public int update(ProjectApply projectApply);
	    
	    /**
	     * 
	     * @param projectApply
	     * @return
	     */
	    public int add(ProjectApply projectApply);
	    
	    /**
	     *  
	     * @param id
	     * @return
	     */
		public int delete(Integer id);

		public int findIdByProName(String proName);
		
		public ProjectApply findById(Integer id);

		public List<ProjectApply> findByProApplicant(String realName);
	    
	   

}
