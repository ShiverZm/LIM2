package com.java1234.service;

import java.util.List;
import java.util.Map;

import com.java1234.entity.ProjectCheck;


public interface ProjectCheckService {
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

	public int delete(int proId);
  
}
