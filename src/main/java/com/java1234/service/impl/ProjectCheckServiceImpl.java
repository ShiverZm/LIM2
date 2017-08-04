package com.java1234.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.ProjectCheckDao;
import com.java1234.entity.ProjectCheck;
import com.java1234.service.ProjectCheckService;

@Service("projectCheckService")
public class ProjectCheckServiceImpl implements ProjectCheckService {
    
	@Resource
	private ProjectCheckDao projectCheckDao;
	
	public List<ProjectCheck> find(Map<String, Object> map) {
		
		return projectCheckDao.find(map);
	}

	public long getTotal(Map<String, Object> map) {
		
		return projectCheckDao.getTotal(map);
	}	
	
	public int check(ProjectCheck projectCheck) {
		return projectCheckDao.check(projectCheck);
	}

	public int add(ProjectCheck pc) {
	
		return projectCheckDao.add(pc);
	}
	public List<Integer> getFinishedPro(){
		return projectCheckDao.getFinishedPro();
	}
}
