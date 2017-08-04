package com.java1234.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.java1234.dao.ProjectApplyDao;
import com.java1234.dao.ProjectCheckDao;
import com.java1234.entity.ProjectApply;
import com.java1234.entity.ProjectCheck;
import com.java1234.service.ProjectApplyService;

@Service("projectApplyService")
public class ProjectApplyServiceImpl implements ProjectApplyService {
    
	@Resource
	private ProjectApplyDao projectApplyDao;
	
	public List<ProjectApply> find(Map<String, Object> map) {
		
		return projectApplyDao.find(map);
	}

	public long getTotal(Map<String, Object> map) {
		
		return projectApplyDao.getTotal(map);
	}

	public int update(ProjectApply projectApply) {
		
		return projectApplyDao.update(projectApply);
	}

	public int add(ProjectApply projectApply) {
		return projectApplyDao.add(projectApply);
	}

	public int delete(Integer id) {
		return projectApplyDao.delete(id);
	}
	
	public int findIdByProName(String proName) {
		return projectApplyDao.findIdByProName(proName);
	}
	
	public ProjectApply findById(Integer id) {
		return projectApplyDao.findById(id);
	}

	public List<ProjectApply> findByProApplicant(String userName) {
		
		return projectApplyDao.findByProApplicant(userName);
	}
	
}
